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
	addvl	sp, sp, #-12
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x60,0x1e,0x22
	add	x6, x0, 448
	ptrue	p7.h, all
	sub	sp, sp, #2176
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0x60,0x1e,0x23,0x80,0x11,0x22
	add	x8, x0, 704
	add	x10, x0, 960
	add	x3, x0, 64
	add	x4, x0, 192
	add	x5, x0, 320
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	add	x7, x0, 576
	add	x9, x0, 832
	add	x11, x0, 1088
	stp	x19, x20, [sp, 16]
	add	x12, x0, 1216
	add	x13, x0, 1344
	stp	x21, x22, [sp, 32]
	add	x14, x0, 1472
	add	x15, x0, 1600
	stp	d8, d9, [sp, 64]
	add	x16, x0, 1728
	add	x17, x0, 1856
	stp	d10, d11, [sp, 80]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x16,0x2,0x8f,0x28
	.cfi_escape 0x10,0x48,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x49,0x3,0x8f,0xc8,0
	.cfi_escape 0x10,0x4a,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x4b,0x3,0x8f,0xd8,0
	add	x19, x0, 1984
	adrp	x18, _ZL6CDOT_O
	stp	d12, d13, [sp, 96]
	add	x21, x18, :lo12:_ZL6CDOT_O
	stp	d14, d15, [sp, 112]
	ldr	z1, [x6]
	ldr	z3, [x8]
	ldr	z5, [x10]
	ldr	z9, [x3]
	ldr	z31, [x4]
	ldr	z10, [x5]
	ldr	z11, [x7]
	.cfi_escape 0x10,0x4c,0x3,0x8f,0xe0,0
	.cfi_escape 0x10,0x4d,0x3,0x8f,0xe8,0
	.cfi_escape 0x10,0x4e,0x3,0x8f,0xf0,0
	.cfi_escape 0x10,0x4f,0x3,0x8f,0xf8,0
	ldr	z12, [x9]
	ldr	z13, [x11]
	ldr	z7, [x12]
	ldr	z14, [x13]
	ldr	z8, [x14]
	ldr	z15, [x15]
	ldr	z17, [x16]
	ldr	z16, [x17]
	ldr	z18, [x19]
	zip1	z2.h, z10.h, z1.h
	zip1	z4.h, z11.h, z3.h
	zip1	z6.h, z12.h, z5.h
	zip1	z0.h, z9.h, z31.h
	zip1	z1.h, z13.h, z7.h
	zip1	z3.h, z14.h, z8.h
	zip1	z5.h, z15.h, z17.h
	zip1	z16.h, z16.h, z18.h
	str	x23, [sp, 48]
	.cfi_escape 0x10,0x17,0x2,0x8f,0x30
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+256
	add	x22, x20, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+512
	add	x30, x23, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+768
	add	x15, x3, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+1024
	add	x14, x4, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+1280
	add	x13, x5, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+1536
	add	x12, x6, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+1792
	add	x11, x7, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+2048
	add	x10, x8, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+2304
	add	x16, x9, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+2560
	add	x18, x17, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x19, _ZL6CDOT_O+2816
	add	x23, x19, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+3072
	add	x6, x20, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3328
	add	x5, x3, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x4, sp, #7
	adrp	x7, _ZL6CDOT_O+3584
	add	x4, x4, 128
	add	x8, x7, :lo12:_ZL6CDOT_O+3584
	str	z15, [x4]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z14.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z16.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x9, sp, #8
	adrp	x17, _ZL6CDOT_O+3840
	add	x9, x9, 128
	add	x19, x17, :lo12:_ZL6CDOT_O+3840
	str	z13, [x9]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x19, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z4.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x19, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x19, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x19, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x19, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x19, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z8.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z16.h, z5.h
// 0 "" 2
#NO_APP
	addvl	x20, sp, #9
	add	x4, x0, 128
	ldr	z16, [x4]
	add	x7, x0, 384
	add	x20, x20, 128
	ldr	z15, [x7]
	add	x9, x0, 640
	ldr	z9, [x9]
	add	x17, x0, 896
	ldr	z17, [x17]
	add	x19, x0, 1152
	ldr	z10, [x19]
	add	x4, x0, 1664
	ldr	z12, [x4]
	add	x7, x0, 1920
	ldr	z13, [x7]
	adrp	x3, .LANCHOR0
	zip1	z0.h, z16.h, z15.h
	zip1	z7.h, z9.h, z17.h
	add	x3, x3, :lo12:.LANCHOR0
	zip1	z2.h, z12.h, z13.h
	str	z14, [x20]
	add	x20, x0, 1408
	ldr	z11, [x20]
	zip1	z8.h, z10.h, z11.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z8.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z3.h
// 0 "" 2
#NO_APP
	add	x9, x3, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z7.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z15.h
// 0 "" 2
#NO_APP
	add	x17, x3, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z7.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z4.h
// 0 "" 2
#NO_APP
	add	x19, x3, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z7.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x19, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z8.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x19, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z5.h
// 0 "" 2
#NO_APP
	add	x20, x3, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x20, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x20, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z17.h
// 0 "" 2
#NO_APP
	add	x4, x3, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z8.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z3.h
// 0 "" 2
#NO_APP
	add	x7, x3, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z8.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z4.h
// 0 "" 2
#NO_APP
	add	x9, x3, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z7.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z8.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z2.h, z8.h
// 0 "" 2
#NO_APP
	add	x17, x0, 256
	ldr	z2, [x17]
	add	x19, x0, 768
	ldr	z1, [x19]
	add	x20, x0, 1280
	ldr	z3, [x20]
	add	x4, x0, 1792
	ldr	z5, [x4]
	zip1	z0.h, z2.h, z1.h
	add	x7, x3, 1024
	zip1	z17.h, z3.h, z5.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z17.h, z7.h
// 0 "" 2
#NO_APP
	add	x9, x3, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z17.h, z2.h
// 0 "" 2
#NO_APP
	add	x17, x3, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z0.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	add	x19, x3, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z17.h, z0.h
// 0 "" 2
#NO_APP
	add	x20, x0, 512
	ldr	z17, [x20]
	add	x4, x0, 1536
	ldr	z2, [x4]
	add	x7, x3, 1280
	zip1	z1.h, z17.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z1.h, z3.h
// 0 "" 2
#NO_APP
	add	x9, x3, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z1.h, z8.h
// 0 "" 2
#NO_APP
	ldr	z0, [x0]
	add	x17, x0, 1024
	ldr	z17, [x17]
	add	x19, x3, 1344
	zip1	z1.h, z0.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	x3, x3, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	z1.s, z8.s, z2.s
	sub	z8.s, z8.s, z2.s
	add	z2.s, z1.s, z4.s
	sub	z1.s, z1.s, z4.s
	add	z4.s, z2.s, z9.s
	add	x4, sp, 128
	sub	z9.s, z2.s, z9.s
	add	z0.s, z4.s, z18.s
	add	z2.s, z17.s, z3.s
	addvl	x20, sp, #6
	sub	z17.s, z17.s, z3.s
	add	z3.s, z2.s, z5.s
	str	z4, [x4]
	sqrshrnb	z4.h, z0.s, #7
	ptrue	p5.h, vl8
	add	x20, x20, 128
	addvl	x9, sp, #1
	uzp1	z0.h, z4.h, z4.h
	addvl	x17, sp, #10
	add	z4.s, z17.s, z6.s
	sub	z17.s, z17.s, z6.s
	str	z9, [x20]
	sub	z9.s, z2.s, z5.s
	add	z5.s, z3.s, z10.s
	sub	z10.s, z3.s, z10.s
	add	z2.s, z5.s, z19.s
	sqrshrnb	z3.h, z2.s, #7
	uzp1	z6.h, z3.h, z3.h
	splice	z0.h, p5, z0.h, z6.h
	addvl	x7, sp, #5
	add	x9, x9, 128
	add	x17, x17, 128
	str	z5, [x9]
	add	z5.s, z4.s, z11.s
	str	z0, [x17]
	add	z0.s, z5.s, z20.s
	sub	z6.s, z4.s, z11.s
	add	x7, x7, 128
	add	z11.s, z8.s, z7.s
	addvl	x19, sp, #2
	sub	z8.s, z8.s, z7.s
	addvl	x3, sp, #3
	add	z7.s, z11.s, z12.s
	str	z10, [x7]
	sqrshrnb	z10.h, z0.s, #7
	sub	z0.s, z11.s, z12.s
	add	z12.s, z7.s, z21.s
	sqrshrnb	z2.h, z12.s, #7
	uzp1	z3.h, z2.h, z2.h
	uzp1	z4.h, z10.h, z10.h
	add	z2.s, z8.s, z13.s
	add	x19, x19, 128
	add	x3, x3, 128
	str	z5, [x19]
	str	z7, [x3]
	movprfx	z7, z4
	splice	z7.h, p5, z7.h, z3.h
	sub	z3.s, z8.s, z13.s
	add	z13.s, z2.s, z22.s
	sqrshrnb	z5.h, z13.s, #7
	uzp1	z11.h, z5.h, z5.h
	add	z13.s, z17.s, z14.s
	sub	z17.s, z17.s, z14.s
	add	z14.s, z13.s, z23.s
	sqrshrnb	z10.h, z14.s, #7
	uzp1	z8.h, z10.h, z10.h
	movprfx	z5, z11
	splice	z5.h, p5, z5.h, z8.h
	add	z11.s, z9.s, z15.s
	sub	z9.s, z9.s, z15.s
	add	z15.s, z11.s, z24.s
	sqrshrnb	z4.h, z15.s, #7
	add	z15.s, z1.s, z16.s
	sub	z1.s, z1.s, z16.s
	add	z16.s, z15.s, z25.s
	sqrshrnb	z12.h, z16.s, #7
	add	z8.s, z1.s, z26.s
	uzp1	z10.h, z12.h, z12.h
	uzp1	z14.h, z4.h, z4.h
	add	z12.s, z9.s, z27.s
	sqrshrnb	z4.h, z8.s, #7
	splice	z14.h, p5, z14.h, z10.h
	uzp1	z16.h, z4.h, z4.h
	sqrshrnb	z10.h, z12.s, #7
	add	z4.s, z17.s, z28.s
	uzp1	z8.h, z10.h, z10.h
	sqrshrnb	z12.h, z4.s, #7
	splice	z16.h, p5, z16.h, z8.h
	add	z10.s, z3.s, z29.s
	addvl	x20, sp, #4
	sqrshrnb	z8.h, z10.s, #7
	addvl	x4, sp, #7
	uzp1	z4.h, z12.h, z12.h
	uzp1	z12.h, z8.h, z8.h
	add	z10.s, z0.s, z30.s
	splice	z4.h, p5, z4.h, z12.h
	add	x20, x20, 128
	add	x4, x4, 128
	ldr	z12, [x4]
	addvl	x7, sp, #5
	sqrshrnb	z8.h, z10.s, #7
	str	z6, [x20]
	add	z6.s, z6.s, z12.s
	add	x7, x7, 128
	addvl	x9, sp, #8
	uzp1	z10.h, z8.h, z8.h
	sqrshrnb	z8.h, z6.s, #7
	ldr	z6, [x7]
	uzp1	z12.h, z8.h, z8.h
	add	x9, x9, 128
	ldr	z8, [x9]
	splice	z10.h, p5, z10.h, z12.h
	addvl	x17, sp, #6
	add	z12.s, z6.s, z8.s
	addvl	x19, sp, #9
	sqrshrnb	z6.h, z12.s, #7
	add	x17, x17, 128
	add	x19, x19, 128
	ldr	z8, [x19]
	uzp1	z12.h, z6.h, z6.h
	ldr	z6, [x17]
	add	z6.s, z6.s, z8.s
	addvl	x3, sp, #10
	sqrshrnb	z8.h, z6.s, #7
	uzp1	z6.h, z8.h, z8.h
	add	x3, x3, 128
	splice	z12.h, p5, z12.h, z6.h
	ldr	z6, [x3]
	uzp1	z8.h, z6.h, z7.h
	uzp2	z6.h, z6.h, z7.h
	uzp1	z7.h, z5.h, z14.h
	addvl	x20, sp, #12
	uzp2	z14.h, z5.h, z14.h
	uzp1	z5.h, z8.h, z7.h
	uzp2	z8.h, z8.h, z7.h
	uzp1	z7.h, z16.h, z4.h
	uzp2	z16.h, z16.h, z4.h
	uzp1	z4.h, z10.h, z12.h
	add	x20, x20, 128
	uzp2	z12.h, z10.h, z12.h
	addvl	x4, sp, #12
	uzp1	z10.h, z7.h, z4.h
	uzp2	z7.h, z7.h, z4.h
	uzp1	z4.h, z5.h, z10.h
	str	z4, [x20]
	uzp2	z10.h, z5.h, z10.h
	add	x4, x4, 192
	uzp1	z5.h, z6.h, z14.h
	addvl	x7, sp, #12
	uzp2	z14.h, z6.h, z14.h
	uzp1	z6.h, z16.h, z12.h
	uzp2	z16.h, z16.h, z12.h
	uzp1	z12.h, z5.h, z6.h
	str	z12, [x4]
	uzp1	z4.h, z8.h, z7.h
	add	x7, x7, 256
	addvl	x9, sp, #12
	str	z4, [x7]
	uzp2	z8.h, z8.h, z7.h
	add	x9, x9, 320
	uzp1	z7.h, z14.h, z16.h
	addvl	x19, sp, #12
	str	z7, [x9]
	add	x17, sp, 128
	uzp2	z5.h, z5.h, z6.h
	ldr	z6, [x17]
	add	x19, x19, 384
	addvl	x3, sp, #1
	addvl	x20, sp, #12
	str	z10, [x19]
	add	x3, x3, 128
	ldr	z10, [x3]
	add	x20, x20, 448
	addvl	x4, sp, #12
	addvl	x7, sp, #2
	str	z5, [x20]
	addvl	x9, sp, #12
	addvl	x17, sp, #3
	uzp2	z14.h, z14.h, z16.h
	addvl	x19, sp, #4
	sub	z18.s, z6.s, z18.s
	sub	z19.s, z10.s, z19.s
	sqrshrnb	z16.h, z18.s, #7
	sqrshrnb	z5.h, z19.s, #7
	uzp1	z12.h, z16.h, z16.h
	add	x4, x4, 512
	add	x7, x7, 128
	str	z8, [x4]
	ldr	z8, [x7]
	add	x9, x9, 576
	sub	z20.s, z8.s, z20.s
	add	x17, x17, 128
	sqrshrnb	z7.h, z20.s, #7
	add	x19, x19, 128
	uzp1	z6.h, z7.h, z7.h
	addvl	x3, sp, #7
	sub	z2.s, z2.s, z22.s
	add	x3, x3, 128
	sqrshrnb	z16.h, z2.s, #7
	addvl	x20, sp, #5
	uzp1	z10.h, z16.h, z16.h
	addvl	x4, sp, #8
	addvl	x7, sp, #6
	uzp1	z4.h, z5.h, z5.h
	sub	z23.s, z13.s, z23.s
	splice	z4.h, p5, z4.h, z12.h
	sqrshrnb	z13.h, z23.s, #7
	sub	z24.s, z11.s, z24.s
	sub	z25.s, z15.s, z25.s
	sqrshrnb	z11.h, z24.s, #7
	sqrshrnb	z15.h, z25.s, #7
	uzp1	z12.h, z11.h, z11.h
	sub	z26.s, z1.s, z26.s
	uzp1	z5.h, z15.h, z15.h
	sqrshrnb	z1.h, z26.s, #7
	splice	z5.h, p5, z5.h, z12.h
	uzp1	z8.h, z1.h, z1.h
	sub	z27.s, z9.s, z27.s
	sub	z28.s, z17.s, z28.s
	sqrshrnb	z9.h, z27.s, #7
	sqrshrnb	z17.h, z28.s, #7
	sub	z29.s, z3.s, z29.s
	uzp1	z20.h, z17.h, z17.h
	sqrshrnb	z3.h, z29.s, #7
	sub	z30.s, z0.s, z30.s
	sqrshrnb	z0.h, z30.s, #7
	str	z14, [x9]
	ldr	z14, [x17]
	addvl	x9, sp, #9
	sub	z21.s, z14.s, z21.s
	addvl	x17, sp, #12
	sqrshrnb	z18.h, z21.s, #7
	uzp1	z22.h, z18.h, z18.h
	splice	z22.h, p5, z22.h, z6.h
	ldr	z6, [x19]
	addvl	x19, sp, #12
	ldr	z18, [x3]
	uzp1	z17.h, z22.h, z4.h
	sub	z2.s, z6.s, z18.s
	uzp2	z4.h, z22.h, z4.h
	uzp1	z21.h, z0.h, z0.h
	sqrshrnb	z24.h, z2.s, #7
	add	x20, x20, 128
	ldr	z16, [x20]
	add	x4, x4, 128
	add	x7, x7, 128
	ldr	z25, [x7]
	add	x9, x9, 128
	ldr	z26, [x9]
	add	x17, x17, 160
	sub	z15.s, z25.s, z26.s
	add	x19, x19, 224
	addvl	x3, sp, #12
	uzp1	z19.h, z13.h, z13.h
	uzp1	z7.h, z9.h, z9.h
	splice	z19.h, p5, z19.h, z10.h
	ldr	z10, [x4]
	uzp1	z27.h, z5.h, z19.h
	splice	z7.h, p5, z7.h, z8.h
	sub	z23.s, z16.s, z10.s
	sqrshrnb	z8.h, z15.s, #7
	sqrshrnb	z13.h, z23.s, #7
	uzp2	z19.h, z5.h, z19.h
	uzp1	z12.h, z13.h, z13.h
	uzp1	z5.h, z19.h, z4.h
	uzp1	z14.h, z3.h, z3.h
	uzp1	z11.h, z24.h, z24.h
	splice	z14.h, p5, z14.h, z20.h
	splice	z11.h, p5, z11.h, z21.h
	uzp1	z20.h, z27.h, z17.h
	uzp1	z1.h, z14.h, z7.h
	uzp1	z9.h, z8.h, z8.h
	uzp2	z7.h, z14.h, z7.h
	splice	z9.h, p5, z9.h, z12.h
	uzp1	z28.h, z9.h, z11.h
	uzp2	z30.h, z9.h, z11.h
	uzp1	z0.h, z28.h, z1.h
	uzp1	z22.h, z30.h, z7.h
	uzp1	z29.h, z0.h, z20.h
	uzp1	z3.h, z22.h, z5.h
	str	z29, [x17]
	str	z3, [x19]
	uzp2	z14.h, z28.h, z1.h
	uzp2	z21.h, z27.h, z17.h
	add	x3, x3, 288
	uzp1	z6.h, z14.h, z21.h
	addvl	x20, sp, #12
	str	z6, [x3]
	uzp2	z18.h, z30.h, z7.h
	uzp2	z2.h, z19.h, z4.h
	add	x20, x20, 352
	uzp1	z16.h, z18.h, z2.h
	addvl	x4, sp, #12
	str	z16, [x20]
	uzp2	z10.h, z0.h, z20.h
	add	x4, x4, 416
	addvl	x7, sp, #12
	str	z10, [x4]
	uzp2	z23.h, z22.h, z5.h
	add	x20, x0, 464
	add	x7, x7, 480
	str	z23, [x7]
	addvl	x17, sp, #12
	add	x9, x0, 80
	uzp2	z24.h, z14.h, z21.h
	add	x19, x0, 208
	add	x17, x17, 544
	str	z24, [x17]
	ldr	z26, [x20]
	add	x20, x0, 1232
	ldr	z13, [x9]
	ldr	z11, [x19]
	ldr	z20, [x20]
	add	x3, x0, 336
	add	x4, x0, 592
	add	x7, x0, 720
	ldr	z12, [x3]
	add	x9, x0, 848
	add	x17, x0, 976
	ldr	z15, [x4]
	add	x19, x0, 1104
	addvl	x20, sp, #12
	ldr	z8, [x7]
	ldr	z27, [x9]
	ldr	z9, [x17]
	ldr	z17, [x19]
	uzp2	z25.h, z18.h, z2.h
	add	x3, x0, 1360
	ldr	z28, [x3]
	add	x4, x0, 1488
	ldr	z29, [x4]
	add	x7, x0, 1616
	ldr	z30, [x7]
	add	x9, x0, 1744
	ldr	z7, [x9]
	add	x17, x0, 1872
	ldr	z19, [x17]
	add	x19, x0, 2000
	ldr	z22, [x19]
	add	x20, x20, 608
	zip1	z1.h, z13.h, z11.h
	zip1	z0.h, z12.h, z26.h
	zip1	z4.h, z15.h, z8.h
	zip1	z5.h, z27.h, z9.h
	zip1	z3.h, z17.h, z20.h
	zip1	z14.h, z28.h, z29.h
	zip1	z6.h, z30.h, z7.h
	zip1	z2.h, z19.h, z22.h
	str	z25, [x20]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x21, sp, #7
	add	x21, x21, 128
	str	z30, [x21]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z2.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x22, sp, #8
	adrp	x30, _ZL6CDOT_O+3840
	add	x22, x22, 128
	add	x23, x30, :lo12:_ZL6CDOT_O+3840
	str	z7, [x22]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x15, sp, #9
	add	x14, x0, 144
	ldr	z2, [x14]
	add	x15, x15, 128
	add	x13, x0, 400
	ldr	z9, [x13]
	add	x12, x0, 656
	ldr	z10, [x12]
	add	x11, x0, 912
	ldr	z13, [x11]
	add	x10, x0, 1168
	ldr	z16, [x10]
	add	x16, x0, 1424
	ldr	z11, [x16]
	add	x18, x0, 1680
	ldr	z12, [x18]
	add	x6, x0, 1936
	ldr	z15, [x6]
	adrp	x5, .LANCHOR0
	zip1	z1.h, z2.h, z9.h
	zip1	z7.h, z10.h, z13.h
	zip1	z0.h, z16.h, z11.h
	add	x3, x5, :lo12:.LANCHOR0
	zip1	z4.h, z12.h, z15.h
	str	z30, [x15]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z7.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z4.h, z6.h
// 0 "" 2
#NO_APP
	add	x22, x3, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z7.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z4.h, z13.h
// 0 "" 2
#NO_APP
	add	x30, x3, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z7.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z4.h, z15.h
// 0 "" 2
#NO_APP
	add	x12, x3, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z7.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z4.h, z6.h
// 0 "" 2
#NO_APP
	add	x9, x3, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z7.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z4.h, z16.h
// 0 "" 2
#NO_APP
	add	x8, x3, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z7.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z0.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z4.h, z14.h
// 0 "" 2
#NO_APP
	add	x7, x3, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z7.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z0.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z4.h, z16.h
// 0 "" 2
#NO_APP
	add	x11, x3, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z7.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z4.h, z0.h
// 0 "" 2
#NO_APP
	add	x4, x0, 272
	ldr	z4, [x4]
	add	x17, x0, 784
	ldr	z3, [x17]
	add	x19, x0, 1296
	ldr	z6, [x19]
	add	x20, x0, 1808
	ldr	z2, [x20]
	zip1	z30.h, z4.h, z3.h
	add	x10, x3, 1024
	zip1	z16.h, z6.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z30.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z16.h, z1.h
// 0 "" 2
#NO_APP
	add	x15, x3, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z30.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	add	x14, x3, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z30.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z16.h, z2.h
// 0 "" 2
#NO_APP
	add	x13, x3, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z30.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z7.h
// 0 "" 2
#NO_APP
	add	x21, x0, 528
	ldr	z16, [x21]
	add	x16, x0, 1552
	ldr	z31, [x16]
	add	x20, x3, 1280
	zip1	z0.h, z16.h, z31.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z0.h, z3.h
// 0 "" 2
#NO_APP
	add	x19, x3, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z0.h, z1.h
// 0 "" 2
#NO_APP
	add	x18, x0, 16
	ldr	z7, [x18]
	add	x6, x0, 1040
	ldr	z16, [x6]
	add	x16, x3, 1344
	zip1	z1.h, z7.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	x17, x3, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	z1.s, z7.s, z2.s
	addvl	x5, sp, #6
	sub	z7.s, z7.s, z2.s
	add	z2.s, z1.s, z4.s
	sub	z1.s, z1.s, z4.s
	add	z4.s, z2.s, z8.s
	sub	z8.s, z2.s, z8.s
	add	z0.s, z4.s, z17.s
	add	z2.s, z16.s, z3.s
	add	x5, x5, 128
	sub	z16.s, z16.s, z3.s
	addvl	x18, sp, #1
	add	z3.s, z2.s, z5.s
	str	z8, [x5]
	sub	z8.s, z2.s, z5.s
	add	z5.s, z3.s, z9.s
	add	x4, sp, 128
	add	z2.s, z5.s, z18.s
	sub	z9.s, z3.s, z9.s
	addvl	x21, sp, #5
	sqrshrnb	z3.h, z2.s, #7
	add	x18, x18, 128
	addvl	x6, sp, #10
	str	z4, [x4]
	sqrshrnb	z4.h, z0.s, #7
	uzp1	z0.h, z4.h, z4.h
	str	z5, [x18]
	uzp1	z5.h, z3.h, z3.h
	splice	z0.h, p5, z0.h, z5.h
	add	z4.s, z16.s, z6.s
	add	x21, x21, 128
	sub	z16.s, z16.s, z6.s
	add	x6, x6, 128
	add	z6.s, z4.s, z10.s
	str	z0, [x6]
	add	z0.s, z6.s, z19.s
	add	z2.s, z7.s, z30.s
	sub	z10.s, z4.s, z10.s
	sub	z7.s, z7.s, z30.s
	addvl	x5, sp, #4
	add	z30.s, z2.s, z11.s
	str	z9, [x21]
	sqrshrnb	z9.h, z0.s, #7
	addvl	x21, sp, #3
	sub	z0.s, z2.s, z11.s
	add	z11.s, z30.s, z20.s
	sqrshrnb	z3.h, z11.s, #7
	uzp1	z4.h, z9.h, z9.h
	add	z11.s, z8.s, z14.s
	uzp1	z5.h, z3.h, z3.h
	sub	z8.s, z8.s, z14.s
	sub	z3.s, z7.s, z12.s
	add	z14.s, z11.s, z23.s
	add	z2.s, z7.s, z12.s
	add	x5, x5, 128
	add	z12.s, z2.s, z21.s
	addvl	x4, sp, #2
	add	x21, x21, 128
	str	z10, [x5]
	sqrshrnb	z10.h, z12.s, #7
	uzp1	z9.h, z10.h, z10.h
	str	z30, [x21]
	sqrshrnb	z30.h, z14.s, #7
	add	z12.s, z16.s, z13.s
	add	x4, x4, 128
	sub	z16.s, z16.s, z13.s
	uzp1	z14.h, z30.h, z30.h
	add	z13.s, z12.s, z22.s
	add	z30.s, z1.s, z15.s
	sqrshrnb	z7.h, z13.s, #7
	sub	z1.s, z1.s, z15.s
	add	z15.s, z30.s, z24.s
	sqrshrnb	z10.h, z15.s, #7
	str	z6, [x4]
	movprfx	z6, z4
	splice	z6.h, p5, z6.h, z5.h
	uzp1	z4.h, z7.h, z7.h
	movprfx	z5, z9
	splice	z5.h, p5, z5.h, z4.h
	uzp1	z9.h, z10.h, z10.h
	add	z13.s, z1.s, z25.s
	splice	z14.h, p5, z14.h, z9.h
	add	z4.s, z8.s, z26.s
	sqrshrnb	z7.h, z13.s, #7
	sqrshrnb	z10.h, z4.s, #7
	uzp1	z9.h, z10.h, z10.h
	add	z13.s, z16.s, z27.s
	add	z10.s, z3.s, z28.s
	addvl	x18, sp, #4
	uzp1	z15.h, z7.h, z7.h
	sqrshrnb	z7.h, z13.s, #7
	splice	z15.h, p5, z15.h, z9.h
	sqrshrnb	z9.h, z10.s, #7
	add	x18, x18, 128
	uzp1	z13.h, z9.h, z9.h
	ldr	z9, [x18]
	addvl	x6, sp, #7
	uzp1	z4.h, z7.h, z7.h
	add	z7.s, z0.s, z29.s
	splice	z4.h, p5, z4.h, z13.h
	add	x6, x6, 128
	ldr	z13, [x6]
	addvl	x5, sp, #5
	sqrshrnb	z10.h, z7.s, #7
	add	z7.s, z9.s, z13.s
	sqrshrnb	z9.h, z7.s, #7
	add	x5, x5, 128
	uzp1	z13.h, z9.h, z9.h
	ldr	z9, [x5]
	addvl	x4, sp, #8
	add	x4, x4, 128
	ldr	z7, [x4]
	addvl	x21, sp, #6
	addvl	x18, sp, #9
	uzp1	z10.h, z10.h, z10.h
	splice	z10.h, p5, z10.h, z13.h
	add	z13.s, z9.s, z7.s
	sqrshrnb	z9.h, z13.s, #7
	add	x21, x21, 128
	ldr	z7, [x21]
	add	x18, x18, 128
	uzp1	z13.h, z9.h, z9.h
	ldr	z9, [x18]
	add	z7.s, z7.s, z9.s
	addvl	x6, sp, #10
	sqrshrnb	z9.h, z7.s, #7
	uzp1	z7.h, z9.h, z9.h
	add	x6, x6, 128
	splice	z13.h, p5, z13.h, z7.h
	ldr	z7, [x6]
	uzp1	z9.h, z7.h, z6.h
	uzp2	z6.h, z7.h, z6.h
	uzp1	z7.h, z5.h, z14.h
	addvl	x5, sp, #12
	uzp2	z14.h, z5.h, z14.h
	uzp1	z5.h, z9.h, z7.h
	uzp2	z9.h, z9.h, z7.h
	uzp1	z7.h, z15.h, z4.h
	uzp2	z15.h, z15.h, z4.h
	uzp1	z4.h, z10.h, z13.h
	add	x5, x5, 640
	uzp2	z13.h, z10.h, z13.h
	addvl	x4, sp, #12
	uzp1	z10.h, z7.h, z4.h
	uzp2	z7.h, z7.h, z4.h
	uzp1	z4.h, z5.h, z10.h
	str	z4, [x5]
	uzp2	z10.h, z5.h, z10.h
	add	x4, x4, 704
	uzp1	z5.h, z6.h, z14.h
	addvl	x21, sp, #12
	uzp2	z14.h, z6.h, z14.h
	uzp1	z6.h, z15.h, z13.h
	uzp2	z15.h, z15.h, z13.h
	uzp1	z13.h, z5.h, z6.h
	str	z13, [x4]
	uzp1	z4.h, z9.h, z7.h
	add	x21, x21, 768
	addvl	x18, sp, #12
	str	z4, [x21]
	uzp2	z9.h, z9.h, z7.h
	add	x18, x18, 832
	uzp1	z7.h, z14.h, z15.h
	addvl	x5, sp, #12
	str	z7, [x18]
	add	x6, sp, 128
	uzp2	z5.h, z5.h, z6.h
	ldr	z6, [x6]
	add	x5, x5, 896
	addvl	x4, sp, #1
	addvl	x21, sp, #12
	addvl	x18, sp, #12
	str	z10, [x5]
	add	x4, x4, 128
	ldr	z10, [x4]
	add	x21, x21, 960
	add	x18, x18, 1024
	addvl	x6, sp, #2
	str	z5, [x21]
	uzp2	z14.h, z14.h, z15.h
	sub	z17.s, z6.s, z17.s
	add	x6, x6, 128
	addvl	x5, sp, #12
	addvl	x4, sp, #3
	str	z9, [x18]
	addvl	x21, sp, #4
	addvl	x18, sp, #7
	ldr	z9, [x6]
	sqrshrnb	z15.h, z17.s, #7
	sub	z19.s, z9.s, z19.s
	uzp1	z13.h, z15.h, z15.h
	sqrshrnb	z7.h, z19.s, #7
	add	x5, x5, 1088
	add	x4, x4, 128
	add	x21, x21, 128
	add	x18, x18, 128
	str	z14, [x5]
	ldr	z14, [x4]
	addvl	x6, sp, #5
	sub	z20.s, z14.s, z20.s
	sqrshrnb	z17.h, z20.s, #7
	sub	z18.s, z10.s, z18.s
	uzp1	z6.h, z7.h, z7.h
	ldr	z7, [x21]
	sqrshrnb	z5.h, z18.s, #7
	sub	z2.s, z2.s, z21.s
	sub	z24.s, z30.s, z24.s
	sqrshrnb	z15.h, z2.s, #7
	sub	z30.s, z1.s, z25.s
	uzp1	z10.h, z15.h, z15.h
	sqrshrnb	z25.h, z24.s, #7
	sqrshrnb	z1.h, z30.s, #7
	add	x6, x6, 128
	uzp1	z9.h, z1.h, z1.h
	addvl	x5, sp, #8
	addvl	x4, sp, #6
	addvl	x21, sp, #9
	uzp1	z4.h, z5.h, z5.h
	uzp1	z21.h, z17.h, z17.h
	ldr	z17, [x18]
	splice	z4.h, p5, z4.h, z13.h
	addvl	x18, sp, #12
	sub	z22.s, z12.s, z22.s
	sub	z23.s, z11.s, z23.s
	sqrshrnb	z12.h, z22.s, #7
	sqrshrnb	z11.h, z23.s, #7
	sub	z26.s, z8.s, z26.s
	uzp1	z13.h, z11.h, z11.h
	sqrshrnb	z8.h, z26.s, #7
	sub	z27.s, z16.s, z27.s
	sub	z28.s, z3.s, z28.s
	sqrshrnb	z16.h, z27.s, #7
	sub	z29.s, z0.s, z29.s
	uzp1	z19.h, z16.h, z16.h
	sqrshrnb	z0.h, z29.s, #7
	ldr	z15, [x6]
	splice	z21.h, p5, z21.h, z6.h
	sub	z2.s, z7.s, z17.s
	uzp1	z16.h, z21.h, z4.h
	sqrshrnb	z3.h, z28.s, #7
	uzp1	z20.h, z0.h, z0.h
	sqrshrnb	z23.h, z2.s, #7
	add	x5, x5, 128
	add	x4, x4, 128
	ldr	z24, [x4]
	add	x21, x21, 128
	add	x18, x18, 672
	uzp1	z18.h, z12.h, z12.h
	addvl	x6, sp, #12
	splice	z18.h, p5, z18.h, z10.h
	ldr	z10, [x5]
	ldr	z30, [x21]
	sub	z22.s, z15.s, z10.s
	uzp1	z5.h, z25.h, z25.h
	sqrshrnb	z12.h, z22.s, #7
	splice	z5.h, p5, z5.h, z13.h
	sub	z25.s, z24.s, z30.s
	uzp1	z27.h, z5.h, z18.h
	uzp1	z13.h, z12.h, z12.h
	uzp1	z14.h, z8.h, z8.h
	uzp1	z6.h, z3.h, z3.h
	splice	z14.h, p5, z14.h, z9.h
	splice	z6.h, p5, z6.h, z19.h
	sqrshrnb	z9.h, z25.s, #7
	uzp1	z1.h, z6.h, z14.h
	uzp1	z19.h, z27.h, z16.h
	uzp1	z11.h, z23.h, z23.h
	uzp1	z8.h, z9.h, z9.h
	splice	z11.h, p5, z11.h, z20.h
	splice	z8.h, p5, z8.h, z13.h
	uzp1	z28.h, z8.h, z11.h
	uzp1	z0.h, z28.h, z1.h
	uzp1	z26.h, z0.h, z19.h
	str	z26, [x18]
	uzp2	z20.h, z8.h, z11.h
	uzp2	z14.h, z6.h, z14.h
	uzp2	z4.h, z21.h, z4.h
	uzp2	z18.h, z5.h, z18.h
	uzp1	z21.h, z20.h, z14.h
	uzp1	z5.h, z18.h, z4.h
	add	x6, x6, 736
	uzp1	z29.h, z21.h, z5.h
	addvl	x5, sp, #12
	str	z29, [x6]
	uzp2	z3.h, z28.h, z1.h
	uzp2	z6.h, z27.h, z16.h
	add	x5, x5, 800
	uzp1	z7.h, z3.h, z6.h
	addvl	x4, sp, #12
	str	z7, [x5]
	uzp2	z17.h, z20.h, z14.h
	uzp2	z2.h, z18.h, z4.h
	add	x4, x4, 864
	uzp1	z15.h, z17.h, z2.h
	addvl	x21, sp, #12
	addvl	x18, sp, #12
	str	z15, [x4]
	uzp2	z10.h, z0.h, z19.h
	add	x21, x21, 928
	add	x18, x18, 992
	str	z10, [x21]
	uzp2	z22.h, z21.h, z5.h
	addvl	x5, sp, #12
	str	z22, [x18]
	add	x18, x0, 480
	uzp2	z23.h, z3.h, z6.h
	add	x6, x0, 96
	add	x4, x0, 224
	add	x21, x0, 352
	add	x5, x5, 1056
	str	z23, [x5]
	ldr	z30, [x18]
	add	x18, x0, 1120
	ldr	z12, [x6]
	ldr	z11, [x4]
	ldr	z13, [x21]
	ldr	z19, [x18]
	add	x6, x0, 608
	add	x4, x0, 736
	ldr	z25, [x6]
	add	x5, x0, 864
	add	x21, x0, 992
	ldr	z27, [x4]
	add	x18, x0, 1760
	ldr	z8, [x5]
	ldr	z16, [x21]
	ldr	z18, [x18]
	add	x6, x0, 1248
	add	x4, x0, 1376
	add	x21, x0, 1504
	add	x5, x0, 1632
	ldr	z28, [x6]
	addvl	x18, sp, #12
	ldr	z26, [x4]
	ldr	z20, [x21]
	ldr	z14, [x5]
	uzp2	z24.h, z17.h, z2.h
	add	x6, x0, 1888
	ldr	z21, [x6]
	add	x4, x0, 2016
	ldr	z29, [x4]
	add	x18, x18, 1120
	adrp	x21, _ZL6CDOT_O
	zip1	z1.h, z12.h, z11.h
	zip1	z9.h, z13.h, z30.h
	zip1	z0.h, z25.h, z27.h
	zip1	z4.h, z8.h, z16.h
	zip1	z5.h, z19.h, z28.h
	zip1	z3.h, z26.h, z20.h
	zip1	z6.h, z14.h, z18.h
	add	x5, x21, :lo12:_ZL6CDOT_O
	zip1	z2.h, z21.h, z29.h
	str	z24, [x18]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+256
	add	x4, x6, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z9.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x21, _ZL6CDOT_O+512
	add	x5, x21, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z9.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x18, _ZL6CDOT_O+768
	add	x6, x18, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+1024
	add	x21, x4, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+1280
	add	x18, x5, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+1536
	add	x4, x6, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x21, _ZL6CDOT_O+1792
	add	x5, x21, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x18, _ZL6CDOT_O+2048
	add	x6, x18, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+2304
	add	x21, x4, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+2560
	add	x18, x5, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+2816
	add	x4, x6, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x21, _ZL6CDOT_O+3072
	add	x5, x21, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x18, _ZL6CDOT_O+3328
	add	x6, x18, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+3584
	add	x21, x4, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #7
	add	x5, x5, 128
	str	z15, [x5]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z9.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z4.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z15.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x23, sp, #8
	add	x18, x0, 160
	ldr	z2, [x18]
	add	x6, x0, 416
	add	x23, x23, 128
	ldr	z12, [x6]
	add	x4, x0, 672
	ldr	z13, [x4]
	add	x21, x0, 928
	ldr	z8, [x21]
	add	x5, x0, 1184
	ldr	z7, [x5]
	add	x18, x0, 1696
	ldr	z16, [x18]
	add	x6, x0, 1952
	ldr	z1, [x6]
	zip1	z11.h, z2.h, z12.h
	zip1	z14.h, z13.h, z8.h
	str	z10, [x23]
	add	x23, x0, 1440
	ldr	z15, [x23]
	zip1	z10.h, z16.h, z1.h
	zip1	z9.h, z7.h, z15.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z11.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z14.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z9.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z10.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z1.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z11.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z14.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z10.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z11.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z14.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z10.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z11.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z14.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z9.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z10.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z11.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z14.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z9.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z10.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z11.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z14.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z10.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z11.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z14.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z10.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z11.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z9.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z10.h, z9.h
// 0 "" 2
#NO_APP
	add	x22, x0, 288
	ldr	z10, [x22]
	add	x3, x0, 800
	ldr	z8, [x3]
	add	x30, x0, 1312
	ldr	z16, [x30]
	add	x12, x0, 1824
	ldr	z15, [x12]
	zip1	z11.h, z10.h, z8.h
	zip1	z9.h, z16.h, z15.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z11.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z9.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z11.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z11.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z9.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z11.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	add	x9, x0, 544
	ldr	z9, [x9]
	add	x8, x0, 1568
	ldr	z8, [x8]
	zip1	z16.h, z9.h, z8.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z16.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z16.h, z9.h
// 0 "" 2
#NO_APP
	add	x7, x0, 32
	ldr	z8, [x7]
	add	x11, x0, 1056
	ldr	z16, [x11]
	zip1	z9.h, z8.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z9.h, z8.h
// 0 "" 2
#NO_APP
	add	z9.s, z16.s, z10.s
	addvl	x10, sp, #6
	sub	z8.s, z9.s, z12.s
	sub	z16.s, z16.s, z10.s
	add	z10.s, z9.s, z12.s
	add	z12.s, z10.s, z0.s
	sub	z0.s, z10.s, z0.s
	add	z9.s, z12.s, z17.s
	add	x15, sp, 128
	add	x10, x10, 128
	addvl	x14, sp, #5
	sqrshrnb	z10.h, z9.s, #7
	str	z0, [x10]
	str	z12, [x15]
	add	z12.s, z31.s, z11.s
	sub	z31.s, z31.s, z11.s
	sub	z9.s, z12.s, z13.s
	add	z11.s, z12.s, z13.s
	add	z13.s, z11.s, z1.s
	sub	z1.s, z11.s, z1.s
	add	z0.s, z13.s, z30.s
	add	z12.s, z31.s, z14.s
	sqrshrnb	z11.h, z0.s, #7
	sub	z31.s, z31.s, z14.s
	add	x14, x14, 128
	add	z14.s, z12.s, z2.s
	addvl	x13, sp, #1
	str	z1, [x14]
	add	z1.s, z14.s, z18.s
	sqrshrnb	z0.h, z1.s, #7
	sub	z2.s, z12.s, z2.s
	add	x13, x13, 128
	add	z12.s, z16.s, z15.s
	addvl	x16, sp, #4
	sub	z16.s, z16.s, z15.s
	addvl	x17, sp, #2
	uzp1	z15.h, z0.h, z0.h
	add	z0.s, z12.s, z3.s
	str	z13, [x13]
	uzp1	z13.h, z11.h, z11.h
	add	z11.s, z0.s, z19.s
	add	z1.s, z16.s, z4.s
	sub	z3.s, z12.s, z3.s
	sub	z16.s, z16.s, z4.s
	add	x16, x16, 128
	add	x17, x17, 128
	addvl	x4, sp, #9
	uzp1	z10.h, z10.h, z10.h
	splice	z10.h, p5, z10.h, z13.h
	sqrshrnb	z13.h, z11.s, #7
	add	z11.s, z31.s, z5.s
	uzp1	z4.h, z13.h, z13.h
	sub	z31.s, z31.s, z5.s
	splice	z15.h, p5, z15.h, z4.h
	add	z5.s, z11.s, z21.s
	str	z2, [x16]
	str	z14, [x17]
	add	z14.s, z1.s, z20.s
	sqrshrnb	z2.h, z14.s, #7
	uzp1	z12.h, z2.h, z2.h
	add	x4, x4, 128
	str	z15, [x4]
	sqrshrnb	z15.h, z5.s, #7
	add	z5.s, z9.s, z6.s
	uzp1	z13.h, z15.h, z15.h
	movprfx	z2, z12
	splice	z2.h, p5, z2.h, z13.h
	sub	z12.s, z9.s, z6.s
	add	z6.s, z5.s, z22.s
	sqrshrnb	z9.h, z6.s, #7
	add	z15.s, z8.s, z7.s
	uzp1	z13.h, z9.h, z9.h
	sub	z9.s, z8.s, z7.s
	add	z7.s, z15.s, z23.s
	sqrshrnb	z8.h, z7.s, #7
	uzp1	z4.h, z8.h, z8.h
	add	z14.s, z9.s, z24.s
	splice	z13.h, p5, z13.h, z4.h
	add	z7.s, z12.s, z25.s
	addvl	x21, sp, #3
	sqrshrnb	z8.h, z7.s, #7
	uzp1	z4.h, z8.h, z8.h
	add	x21, x21, 128
	add	z8.s, z16.s, z27.s
	addvl	x5, sp, #4
	sqrshrnb	z6.h, z14.s, #7
	add	z14.s, z31.s, z26.s
	uzp1	z6.h, z6.h, z6.h
	sqrshrnb	z7.h, z14.s, #7
	splice	z6.h, p5, z6.h, z4.h
	sqrshrnb	z4.h, z8.s, #7
	str	z3, [x21]
	add	z3.s, z3.s, z28.s
	add	x5, x5, 128
	sqrshrnb	z8.h, z3.s, #7
	addvl	x23, sp, #5
	uzp1	z14.h, z7.h, z7.h
	uzp1	z7.h, z4.h, z4.h
	ldr	z4, [x5]
	add	z3.s, z4.s, z29.s
	splice	z14.h, p5, z14.h, z7.h
	add	x23, x23, 128
	addvl	x18, sp, #7
	uzp1	z7.h, z8.h, z8.h
	sqrshrnb	z8.h, z3.s, #7
	ldr	z3, [x23]
	uzp1	z4.h, z8.h, z8.h
	add	x18, x18, 128
	ldr	z8, [x18]
	splice	z7.h, p5, z7.h, z4.h
	addvl	x6, sp, #6
	add	z4.s, z3.s, z8.s
	addvl	x22, sp, #8
	sqrshrnb	z3.h, z4.s, #7
	add	x6, x6, 128
	add	x22, x22, 128
	ldr	z4, [x22]
	uzp1	z8.h, z3.h, z3.h
	ldr	z3, [x6]
	add	z3.s, z3.s, z4.s
	addvl	x3, sp, #9
	sqrshrnb	z4.h, z3.s, #7
	uzp1	z3.h, z4.h, z4.h
	add	x3, x3, 128
	ldr	z4, [x3]
	splice	z8.h, p5, z8.h, z3.h
	uzp1	z3.h, z10.h, z4.h
	addvl	x30, sp, #12
	uzp2	z10.h, z10.h, z4.h
	uzp1	z4.h, z2.h, z13.h
	uzp2	z13.h, z2.h, z13.h
	uzp1	z2.h, z3.h, z4.h
	uzp2	z4.h, z3.h, z4.h
	uzp1	z3.h, z6.h, z14.h
	uzp2	z14.h, z6.h, z14.h
	uzp1	z6.h, z7.h, z8.h
	add	x30, x30, 1152
	uzp2	z8.h, z7.h, z8.h
	addvl	x12, sp, #12
	uzp1	z7.h, z3.h, z6.h
	uzp2	z3.h, z3.h, z6.h
	uzp1	z6.h, z2.h, z7.h
	str	z6, [x30]
	uzp2	z2.h, z2.h, z7.h
	add	x12, x12, 1216
	uzp1	z7.h, z10.h, z13.h
	addvl	x9, sp, #12
	uzp2	z13.h, z10.h, z13.h
	uzp1	z10.h, z14.h, z8.h
	uzp2	z14.h, z14.h, z8.h
	uzp1	z8.h, z7.h, z10.h
	str	z8, [x12]
	uzp2	z6.h, z7.h, z10.h
	add	x9, x9, 1280
	uzp1	z7.h, z4.h, z3.h
	addvl	x8, sp, #12
	str	z7, [x9]
	uzp2	z4.h, z4.h, z3.h
	add	x8, x8, 1344
	uzp1	z3.h, z13.h, z14.h
	addvl	x7, sp, #12
	str	z3, [x8]
	addvl	x10, sp, #12
	add	x7, x7, 1408
	str	z2, [x7]
	add	x11, sp, 128
	uzp2	z2.h, z13.h, z14.h
	ldr	z13, [x11]
	add	x10, x10, 1472
	addvl	x15, sp, #1
	addvl	x14, sp, #12
	str	z6, [x10]
	addvl	x16, sp, #2
	sub	z17.s, z13.s, z17.s
	add	x15, x15, 128
	ldr	z14, [x15]
	sqrshrnb	z10.h, z17.s, #7
	add	x14, x14, 1536
	uzp1	z8.h, z10.h, z10.h
	addvl	x13, sp, #12
	add	x16, x16, 128
	addvl	x17, sp, #3
	str	z4, [x14]
	ldr	z4, [x16]
	sub	z30.s, z14.s, z30.s
	sub	z18.s, z4.s, z18.s
	sqrshrnb	z6.h, z30.s, #7
	sqrshrnb	z3.h, z18.s, #7
	sub	z16.s, z16.s, z27.s
	add	x13, x13, 1600
	add	x17, x17, 128
	ldr	z27, [x17]
	addvl	x4, sp, #4
	sub	z28.s, z27.s, z28.s
	addvl	x21, sp, #5
	addvl	x5, sp, #7
	addvl	x23, sp, #6
	addvl	x18, sp, #8
	uzp1	z7.h, z6.h, z6.h
	addvl	x6, sp, #12
	splice	z7.h, p5, z7.h, z8.h
	sub	z19.s, z0.s, z19.s
	sub	z20.s, z1.s, z20.s
	sqrshrnb	z0.h, z19.s, #7
	sqrshrnb	z1.h, z20.s, #7
	sub	z21.s, z11.s, z21.s
	uzp1	z17.h, z1.h, z1.h
	sqrshrnb	z11.h, z21.s, #7
	sub	z22.s, z5.s, z22.s
	sub	z23.s, z15.s, z23.s
	sqrshrnb	z5.h, z22.s, #7
	sqrshrnb	z15.h, z23.s, #7
	uzp1	z14.h, z5.h, z5.h
	sub	z24.s, z9.s, z24.s
	sub	z25.s, z12.s, z25.s
	sqrshrnb	z9.h, z24.s, #7
	sqrshrnb	z12.h, z25.s, #7
	uzp1	z8.h, z9.h, z9.h
	sub	z26.s, z31.s, z26.s
	sqrshrnb	z31.h, z26.s, #7
	uzp1	z4.h, z31.h, z31.h
	str	z2, [x13]
	uzp1	z2.h, z3.h, z3.h
	sqrshrnb	z18.h, z16.s, #7
	sqrshrnb	z3.h, z28.s, #7
	add	x4, x4, 128
	add	x21, x21, 128
	ldr	z20, [x21]
	add	x5, x5, 128
	ldr	z1, [x5]
	add	x23, x23, 128
	add	x18, x18, 128
	ldr	z23, [x18]
	add	x6, x6, 1184
	addvl	x22, sp, #12
	addvl	x3, sp, #12
	uzp1	z13.h, z0.h, z0.h
	uzp1	z10.h, z11.h, z11.h
	splice	z13.h, p5, z13.h, z2.h
	ldr	z2, [x4]
	splice	z10.h, p5, z10.h, z17.h
	uzp1	z0.h, z3.h, z3.h
	sub	z17.s, z20.s, z1.s
	sub	z29.s, z2.s, z29.s
	sqrshrnb	z22.h, z17.s, #7
	sqrshrnb	z21.h, z29.s, #7
	uzp1	z5.h, z22.h, z22.h
	uzp1	z30.h, z15.h, z15.h
	uzp1	z6.h, z12.h, z12.h
	splice	z30.h, p5, z30.h, z14.h
	ldr	z14, [x23]
	splice	z6.h, p5, z6.h, z8.h
	sub	z24.s, z14.s, z23.s
	uzp1	z8.h, z30.h, z10.h
	sqrshrnb	z15.h, z24.s, #7
	uzp1	z19.h, z18.h, z18.h
	uzp1	z11.h, z21.h, z21.h
	splice	z19.h, p5, z19.h, z4.h
	splice	z11.h, p5, z11.h, z0.h
	uzp1	z9.h, z19.h, z6.h
	uzp1	z4.h, z13.h, z7.h
	uzp1	z12.h, z15.h, z15.h
	uzp1	z27.h, z8.h, z4.h
	splice	z12.h, p5, z12.h, z5.h
	uzp1	z28.h, z12.h, z11.h
	uzp1	z25.h, z28.h, z9.h
	uzp1	z26.h, z25.h, z27.h
	str	z26, [x6]
	uzp2	z31.h, z12.h, z11.h
	uzp2	z18.h, z28.h, z9.h
	uzp2	z3.h, z8.h, z4.h
	uzp2	z6.h, z19.h, z6.h
	uzp2	z10.h, z30.h, z10.h
	uzp2	z7.h, z13.h, z7.h
	uzp1	z19.h, z18.h, z3.h
	uzp1	z13.h, z31.h, z6.h
	uzp1	z16.h, z10.h, z7.h
	add	x22, x22, 1248
	uzp1	z30.h, z13.h, z16.h
	add	x3, x3, 1312
	addvl	x30, sp, #12
	str	z30, [x22]
	str	z19, [x3]
	uzp2	z0.h, z31.h, z6.h
	uzp2	z2.h, z10.h, z7.h
	add	x30, x30, 1376
	uzp1	z29.h, z0.h, z2.h
	addvl	x12, sp, #12
	str	z29, [x30]
	uzp2	z20.h, z25.h, z27.h
	add	x12, x12, 1440
	addvl	x9, sp, #12
	str	z20, [x12]
	uzp2	z1.h, z13.h, z16.h
	add	x9, x9, 1504
	addvl	x11, sp, #12
	str	z1, [x9]
	add	x16, x0, 880
	uzp2	z17.h, z18.h, z3.h
	add	x11, x11, 1568
	addvl	x12, sp, #12
	str	z17, [x11]
	ldr	z15, [x16]
	uzp2	z21.h, z0.h, z2.h
	add	x8, x0, 112
	ldr	z22, [x8]
	add	x7, x0, 240
	ldr	z11, [x7]
	add	x10, x0, 368
	ldr	z14, [x10]
	add	x15, x0, 496
	ldr	z23, [x15]
	add	x14, x0, 624
	ldr	z24, [x14]
	add	x13, x0, 752
	ldr	z9, [x13]
	add	x17, x0, 1008
	ldr	z8, [x17]
	add	x4, x0, 1136
	ldr	z27, [x4]
	add	x21, x0, 1264
	ldr	z28, [x21]
	add	x5, x0, 1392
	ldr	z25, [x5]
	add	x23, x0, 1520
	ldr	z26, [x23]
	add	x18, x0, 1648
	ldr	z31, [x18]
	add	x6, x0, 1776
	ldr	z10, [x6]
	add	x22, x0, 1904
	ldr	z7, [x22]
	add	x3, x0, 2032
	ldr	z16, [x3]
	add	x12, x12, 1632
	adrp	x30, _ZL6CDOT_O
	zip1	z5.h, z22.h, z11.h
	zip1	z4.h, z14.h, z23.h
	zip1	z6.h, z24.h, z9.h
	zip1	z12.h, z15.h, z8.h
	zip1	z13.h, z27.h, z28.h
	zip1	z3.h, z25.h, z26.h
	zip1	z0.h, z31.h, z10.h
	add	x16, x30, :lo12:_ZL6CDOT_O
	zip1	z2.h, z7.h, z16.h
	str	z21, [x12]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+256
	add	x15, x9, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+512
	add	x14, x8, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+768
	add	x13, x7, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+1024
	add	x21, x11, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+1280
	add	x23, x10, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+1536
	add	x22, x17, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+1792
	add	x30, x4, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+2048
	add	x12, x5, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x18, _ZL6CDOT_O+2304
	add	x9, x18, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+2560
	add	x8, x6, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2816
	add	x7, x3, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+3072
	add	x10, x11, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+3328
	add	x4, x17, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z4.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z12.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z13.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z2.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #7
	adrp	x18, _ZL6CDOT_O+3584
	add	x5, x5, 128
	add	x6, x18, :lo12:_ZL6CDOT_O+3584
	str	z16, [x5]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z12.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z2.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #8
	adrp	x11, _ZL6CDOT_O+3840
	add	x3, x3, 128
	add	x17, x11, :lo12:_ZL6CDOT_O+3840
	str	z7, [x3]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z4.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z12.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z13.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z0.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z16.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x4, sp, #9
	add	x18, x0, 176
	ldr	z2, [x18]
	add	x6, x0, 432
	add	x4, x4, 128
	ldr	z1, [x6]
	add	x3, x0, 688
	ldr	z11, [x3]
	add	x11, x0, 944
	ldr	z17, [x11]
	add	x17, x0, 1200
	ldr	z14, [x17]
	add	x18, x0, 1712
	ldr	z15, [x18]
	add	x6, x0, 1968
	ldr	z16, [x6]
	adrp	x5, .LANCHOR0
	zip1	z4.h, z2.h, z1.h
	zip1	z7.h, z11.h, z17.h
	add	x5, x5, :lo12:.LANCHOR0
	zip1	z3.h, z15.h, z16.h
	str	z10, [x4]
	add	x4, x0, 1456
	ldr	z9, [x4]
	zip1	z8.h, z14.h, z9.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z4.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z13.h
// 0 "" 2
#NO_APP
	add	x3, x5, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z4.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z7.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z8.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z11.h
// 0 "" 2
#NO_APP
	add	x11, x5, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z7.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z16.h
// 0 "" 2
#NO_APP
	add	x17, x5, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z4.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z0.h
// 0 "" 2
#NO_APP
	add	x4, x5, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z4.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z7.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z8.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z14.h
// 0 "" 2
#NO_APP
	add	x18, x5, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z8.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z6.h
// 0 "" 2
#NO_APP
	add	x6, x5, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z4.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z7.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z8.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z17.h
// 0 "" 2
#NO_APP
	add	x3, x5, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z4.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z7.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z8.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z8.h
// 0 "" 2
#NO_APP
	add	x11, x0, 304
	ldr	z3, [x11]
	add	x17, x0, 816
	ldr	z6, [x17]
	add	x4, x0, 1328
	ldr	z2, [x4]
	add	x18, x0, 1840
	ldr	z1, [x18]
	zip1	z0.h, z3.h, z6.h
	add	x6, x5, 1024
	zip1	z17.h, z2.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z17.h, z7.h
// 0 "" 2
#NO_APP
	add	x3, x5, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	add	x11, x5, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z0.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z17.h, z1.h
// 0 "" 2
#NO_APP
	add	x17, x5, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z17.h, z0.h
// 0 "" 2
#NO_APP
	add	x4, x0, 560
	ldr	z17, [x4]
	add	x18, x0, 1584
	ldr	z3, [x18]
	zip1	z1.h, z17.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	x6, x0, 48
	ldr	z1, [x6]
	add	x0, x0, 1072
	ldr	z17, [x0]
	add	x3, x5, 1344
	zip1	z1.h, z1.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	x5, x5, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	z1.s, z8.s, z2.s
	sub	z8.s, z8.s, z2.s
	add	z2.s, z1.s, z4.s
	sub	z1.s, z1.s, z4.s
	add	z4.s, z2.s, z9.s
	add	x17, sp, 128
	sub	z9.s, z2.s, z9.s
	add	z0.s, z4.s, z18.s
	add	z2.s, z17.s, z3.s
	addvl	x11, sp, #6
	sub	z17.s, z17.s, z3.s
	add	z3.s, z2.s, z5.s
	str	z4, [x17]
	sqrshrnb	z4.h, z0.s, #7
	ptrue	p6.h, vl8
	add	x11, x11, 128
	addvl	x18, sp, #1
	uzp1	z0.h, z4.h, z4.h
	addvl	x6, sp, #10
	add	z4.s, z17.s, z6.s
	sub	z17.s, z17.s, z6.s
	str	z9, [x11]
	sub	z9.s, z2.s, z5.s
	add	z5.s, z3.s, z10.s
	sub	z10.s, z3.s, z10.s
	add	z2.s, z5.s, z19.s
	sqrshrnb	z3.h, z2.s, #7
	uzp1	z6.h, z3.h, z3.h
	splice	z0.h, p6, z0.h, z6.h
	addvl	x4, sp, #5
	add	x18, x18, 128
	add	x6, x6, 128
	str	z5, [x18]
	add	z5.s, z4.s, z11.s
	str	z0, [x6]
	add	z0.s, z5.s, z20.s
	sub	z6.s, z4.s, z11.s
	add	x4, x4, 128
	add	z11.s, z8.s, z7.s
	addvl	x0, sp, #2
	sub	z8.s, z8.s, z7.s
	addvl	x3, sp, #3
	add	z7.s, z11.s, z12.s
	str	z10, [x4]
	sqrshrnb	z10.h, z0.s, #7
	sub	z0.s, z11.s, z12.s
	add	z12.s, z7.s, z21.s
	sqrshrnb	z2.h, z12.s, #7
	uzp1	z3.h, z2.h, z2.h
	uzp1	z4.h, z10.h, z10.h
	add	z2.s, z8.s, z13.s
	add	x0, x0, 128
	add	x3, x3, 128
	str	z5, [x0]
	str	z7, [x3]
	movprfx	z7, z4
	splice	z7.h, p6, z7.h, z3.h
	sub	z3.s, z8.s, z13.s
	add	z13.s, z2.s, z22.s
	sqrshrnb	z5.h, z13.s, #7
	uzp1	z11.h, z5.h, z5.h
	add	z13.s, z17.s, z14.s
	sub	z17.s, z17.s, z14.s
	add	z14.s, z13.s, z23.s
	sqrshrnb	z10.h, z14.s, #7
	uzp1	z8.h, z10.h, z10.h
	movprfx	z5, z11
	splice	z5.h, p6, z5.h, z8.h
	add	z11.s, z9.s, z15.s
	sub	z9.s, z9.s, z15.s
	add	z15.s, z11.s, z24.s
	sqrshrnb	z4.h, z15.s, #7
	add	z15.s, z1.s, z16.s
	sub	z1.s, z1.s, z16.s
	add	z16.s, z15.s, z25.s
	sqrshrnb	z12.h, z16.s, #7
	add	z8.s, z1.s, z26.s
	uzp1	z10.h, z12.h, z12.h
	uzp1	z14.h, z4.h, z4.h
	add	z12.s, z9.s, z27.s
	sqrshrnb	z4.h, z8.s, #7
	splice	z14.h, p6, z14.h, z10.h
	uzp1	z16.h, z4.h, z4.h
	sqrshrnb	z10.h, z12.s, #7
	add	z4.s, z17.s, z28.s
	uzp1	z8.h, z10.h, z10.h
	sqrshrnb	z12.h, z4.s, #7
	splice	z16.h, p6, z16.h, z8.h
	add	z10.s, z3.s, z29.s
	addvl	x5, sp, #4
	sqrshrnb	z8.h, z10.s, #7
	addvl	x11, sp, #7
	uzp1	z4.h, z12.h, z12.h
	uzp1	z12.h, z8.h, z8.h
	add	z10.s, z0.s, z30.s
	splice	z4.h, p6, z4.h, z12.h
	add	x5, x5, 128
	add	x11, x11, 128
	ldr	z12, [x11]
	addvl	x17, sp, #5
	sqrshrnb	z8.h, z10.s, #7
	str	z6, [x5]
	add	z6.s, z6.s, z12.s
	add	x17, x17, 128
	addvl	x4, sp, #8
	uzp1	z10.h, z8.h, z8.h
	sqrshrnb	z8.h, z6.s, #7
	ldr	z6, [x17]
	uzp1	z12.h, z8.h, z8.h
	add	x4, x4, 128
	ldr	z8, [x4]
	splice	z10.h, p6, z10.h, z12.h
	addvl	x18, sp, #6
	add	z12.s, z6.s, z8.s
	addvl	x6, sp, #9
	sqrshrnb	z6.h, z12.s, #7
	add	x18, x18, 128
	add	x6, x6, 128
	ldr	z8, [x6]
	uzp1	z12.h, z6.h, z6.h
	ldr	z6, [x18]
	add	z6.s, z6.s, z8.s
	addvl	x0, sp, #10
	sqrshrnb	z8.h, z6.s, #7
	uzp1	z6.h, z8.h, z8.h
	add	x0, x0, 128
	splice	z12.h, p6, z12.h, z6.h
	ldr	z6, [x0]
	uzp1	z8.h, z6.h, z7.h
	uzp2	z6.h, z6.h, z7.h
	uzp1	z7.h, z5.h, z14.h
	addvl	x3, sp, #12
	uzp2	z14.h, z5.h, z14.h
	uzp1	z5.h, z8.h, z7.h
	uzp2	z8.h, z8.h, z7.h
	uzp1	z7.h, z16.h, z4.h
	uzp2	z16.h, z16.h, z4.h
	uzp1	z4.h, z10.h, z12.h
	add	x3, x3, 1664
	uzp2	z12.h, z10.h, z12.h
	addvl	x5, sp, #12
	uzp1	z10.h, z7.h, z4.h
	uzp2	z7.h, z7.h, z4.h
	uzp1	z4.h, z5.h, z10.h
	str	z4, [x3]
	uzp2	z10.h, z5.h, z10.h
	add	x5, x5, 1728
	uzp1	z5.h, z6.h, z14.h
	addvl	x11, sp, #12
	uzp2	z14.h, z6.h, z14.h
	uzp1	z6.h, z16.h, z12.h
	uzp2	z16.h, z16.h, z12.h
	uzp1	z12.h, z5.h, z6.h
	str	z12, [x5]
	uzp1	z4.h, z8.h, z7.h
	add	x11, x11, 1792
	addvl	x17, sp, #12
	str	z4, [x11]
	uzp2	z8.h, z8.h, z7.h
	add	x17, x17, 1856
	uzp1	z7.h, z14.h, z16.h
	addvl	x18, sp, #12
	str	z7, [x17]
	add	x4, sp, 128
	uzp2	z5.h, z5.h, z6.h
	ldr	z6, [x4]
	add	x18, x18, 1920
	addvl	x6, sp, #1
	addvl	x0, sp, #12
	str	z10, [x18]
	add	x6, x6, 128
	ldr	z10, [x6]
	add	x0, x0, 1984
	addvl	x3, sp, #12
	addvl	x5, sp, #2
	str	z5, [x0]
	addvl	x11, sp, #12
	addvl	x17, sp, #3
	uzp2	z14.h, z14.h, z16.h
	sub	z18.s, z6.s, z18.s
	sub	z19.s, z10.s, z19.s
	sqrshrnb	z16.h, z18.s, #7
	sqrshrnb	z5.h, z19.s, #7
	uzp1	z12.h, z16.h, z16.h
	add	x3, x3, 2048
	add	x5, x5, 128
	add	x11, x11, 2112
	str	z8, [x3]
	ldr	z8, [x5]
	add	x17, x17, 128
	sub	z20.s, z8.s, z20.s
	addvl	x4, sp, #4
	sqrshrnb	z7.h, z20.s, #7
	sub	z2.s, z2.s, z22.s
	uzp1	z6.h, z7.h, z7.h
	sqrshrnb	z16.h, z2.s, #7
	add	x4, x4, 128
	uzp1	z10.h, z16.h, z16.h
	addvl	x18, sp, #7
	addvl	x6, sp, #5
	addvl	x0, sp, #8
	addvl	x3, sp, #6
	uzp1	z4.h, z5.h, z5.h
	addvl	x5, sp, #9
	splice	z4.h, p6, z4.h, z12.h
	sub	z23.s, z13.s, z23.s
	sub	z24.s, z11.s, z24.s
	sqrshrnb	z13.h, z23.s, #7
	sqrshrnb	z11.h, z24.s, #7
	sub	z25.s, z15.s, z25.s
	uzp1	z12.h, z11.h, z11.h
	sqrshrnb	z15.h, z25.s, #7
	sub	z26.s, z1.s, z26.s
	uzp1	z5.h, z15.h, z15.h
	sqrshrnb	z1.h, z26.s, #7
	splice	z5.h, p6, z5.h, z12.h
	uzp1	z8.h, z1.h, z1.h
	sub	z27.s, z9.s, z27.s
	sub	z28.s, z17.s, z28.s
	sqrshrnb	z9.h, z27.s, #7
	sqrshrnb	z17.h, z28.s, #7
	sub	z29.s, z3.s, z29.s
	uzp1	z20.h, z17.h, z17.h
	sqrshrnb	z3.h, z29.s, #7
	sub	z30.s, z0.s, z30.s
	sqrshrnb	z0.h, z30.s, #7
	str	z14, [x11]
	ldr	z14, [x17]
	addvl	x11, sp, #12
	sub	z21.s, z14.s, z21.s
	addvl	x17, sp, #12
	sqrshrnb	z18.h, z21.s, #7
	uzp1	z22.h, z18.h, z18.h
	splice	z22.h, p6, z22.h, z6.h
	ldr	z6, [x4]
	uzp1	z17.h, z22.h, z4.h
	uzp1	z21.h, z0.h, z0.h
	uzp2	z4.h, z22.h, z4.h
	add	x18, x18, 128
	ldr	z18, [x18]
	add	x6, x6, 128
	ldr	z16, [x6]
	sub	z2.s, z6.s, z18.s
	add	x0, x0, 128
	sqrshrnb	z24.h, z2.s, #7
	add	x3, x3, 128
	ldr	z25, [x3]
	add	x5, x5, 128
	ldr	z26, [x5]
	add	x11, x11, 1696
	sub	z15.s, z25.s, z26.s
	add	x17, x17, 1760
	addvl	x4, sp, #12
	uzp1	z19.h, z13.h, z13.h
	uzp1	z7.h, z9.h, z9.h
	splice	z19.h, p6, z19.h, z10.h
	ldr	z10, [x0]
	uzp1	z27.h, z5.h, z19.h
	splice	z7.h, p6, z7.h, z8.h
	sub	z23.s, z16.s, z10.s
	sqrshrnb	z8.h, z15.s, #7
	sqrshrnb	z13.h, z23.s, #7
	uzp2	z19.h, z5.h, z19.h
	uzp1	z12.h, z13.h, z13.h
	uzp1	z5.h, z19.h, z4.h
	uzp1	z14.h, z3.h, z3.h
	uzp1	z11.h, z24.h, z24.h
	splice	z14.h, p6, z14.h, z20.h
	splice	z11.h, p6, z11.h, z21.h
	uzp1	z20.h, z27.h, z17.h
	uzp1	z1.h, z14.h, z7.h
	uzp1	z9.h, z8.h, z8.h
	uzp2	z7.h, z14.h, z7.h
	splice	z9.h, p6, z9.h, z12.h
	uzp1	z28.h, z9.h, z11.h
	uzp2	z30.h, z9.h, z11.h
	uzp1	z0.h, z28.h, z1.h
	uzp1	z22.h, z30.h, z7.h
	uzp1	z29.h, z0.h, z20.h
	uzp1	z3.h, z22.h, z5.h
	str	z29, [x11]
	str	z3, [x17]
	uzp2	z14.h, z28.h, z1.h
	uzp2	z21.h, z27.h, z17.h
	add	x4, x4, 1824
	uzp1	z6.h, z14.h, z21.h
	addvl	x18, sp, #12
	str	z6, [x4]
	uzp2	z18.h, z30.h, z7.h
	uzp2	z2.h, z19.h, z4.h
	add	x18, x18, 1888
	addvl	x6, sp, #12
	uzp1	z16.h, z18.h, z2.h
	str	z16, [x18]
	uzp2	z10.h, z0.h, z20.h
	add	x6, x6, 1952
	addvl	x0, sp, #12
	str	z10, [x6]
	uzp2	z23.h, z22.h, z5.h
	add	x0, x0, 2016
	addvl	x3, sp, #12
	str	z23, [x0]
	uzp2	z24.h, z14.h, z21.h
	add	x3, x3, 2080
	addvl	x5, sp, #12
	addvl	x11, sp, #7
	str	z24, [x3]
	uzp2	z13.h, z18.h, z2.h
	add	x5, x5, 2144
	add	x11, x11, 128
	str	z13, [x11]
	addvl	x17, sp, #12
	addvl	x4, sp, #12
	str	z13, [x5]
	addvl	x18, sp, #12
	addvl	x6, sp, #12
	addvl	x0, sp, #12
	addvl	x3, sp, #12
	addvl	x5, sp, #12
	addvl	x11, sp, #12
	add	x17, x17, 192
	add	x4, x4, 320
	ldr	z11, [x17]
	add	x18, x18, 448
	add	x6, x6, 576
	ldr	z12, [x4]
	add	x0, x0, 704
	add	x3, x3, 832
	ldr	z25, [x18]
	add	x5, x5, 960
	add	x11, x11, 1088
	ldr	z26, [x6]
	ldr	z15, [x0]
	ldr	z8, [x3]
	ldr	z27, [x5]
	ldr	z17, [x11]
	addvl	x17, sp, #12
	addvl	x4, sp, #12
	addvl	x18, sp, #12
	addvl	x6, sp, #12
	zip1	z1.h, z11.h, z12.h
	addvl	x0, sp, #12
	addvl	x3, sp, #12
	zip1	z9.h, z25.h, z26.h
	addvl	x5, sp, #12
	addvl	x11, sp, #12
	zip1	z0.h, z15.h, z8.h
	add	x17, x17, 1216
	ldr	z20, [x17]
	add	x4, x4, 1344
	ldr	z28, [x4]
	add	x18, x18, 1472
	ldr	z29, [x18]
	add	x6, x6, 1600
	ldr	z30, [x6]
	add	x0, x0, 1728
	ldr	z7, [x0]
	add	x3, x3, 1856
	ldr	z19, [x3]
	add	x5, x5, 1984
	ldr	z22, [x5]
	add	x11, x11, 2112
	ldr	z21, [x11]
	zip1	z4.h, z27.h, z17.h
	zip1	z5.h, z20.h, z28.h
	zip1	z3.h, z29.h, z30.h
	zip1	z14.h, z7.h, z19.h
	zip1	z6.h, z22.h, z21.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z9.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z9.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x21, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x21, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x21, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x21, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z26.h
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
	ld1h z8.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x16, _ZL6CDOT_O+3328
	add	x5, x16, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x15, _ZL6CDOT_O+3584
	add	x4, x15, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z14.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z6.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x14, sp, #8
	adrp	x13, _ZL6CDOT_O+3840
	add	x14, x14, 128
	add	x3, x13, :lo12:_ZL6CDOT_O+3840
	str	z2, [x14]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z9.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z4.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z2.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x21, sp, #9
	addvl	x22, sp, #12
	addvl	x30, sp, #12
	addvl	x12, sp, #12
	addvl	x9, sp, #12
	addvl	x8, sp, #12
	addvl	x7, sp, #12
	addvl	x10, sp, #12
	addvl	x17, sp, #12
	add	x21, x21, 128
	str	z16, [x21]
	add	x22, x22, 256
	ldr	z10, [x22]
	add	x30, x30, 512
	ldr	z13, [x30]
	add	x12, x12, 768
	ldr	z6, [x12]
	add	x9, x9, 1024
	ldr	z11, [x9]
	add	x8, x8, 1280
	ldr	z12, [x8]
	add	x7, x7, 1536
	ldr	z15, [x7]
	add	x10, x10, 1792
	ldr	z8, [x10]
	add	x17, x17, 2048
	ldr	z9, [x17]
	adrp	x23, .LANCHOR0
	zip1	z2.h, z10.h, z13.h
	zip1	z1.h, z6.h, z11.h
	zip1	z7.h, z12.h, z15.h
	add	x0, x23, :lo12:.LANCHOR0
	zip1	z0.h, z8.h, z9.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z7.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z0.h, z14.h
// 0 "" 2
#NO_APP
	add	x13, x0, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z0.h, z6.h
// 0 "" 2
#NO_APP
	add	x12, x0, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z7.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z4.h
// 0 "" 2
#NO_APP
	add	x11, x0, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z7.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z0.h, z16.h
// 0 "" 2
#NO_APP
	add	x10, x0, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z7.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z0.h, z4.h
// 0 "" 2
#NO_APP
	add	x9, x0, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z7.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z0.h, z16.h
// 0 "" 2
#NO_APP
	add	x8, x0, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z7.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z0.h, z5.h
// 0 "" 2
#NO_APP
	add	x7, x0, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z7.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x18, sp, #12
	addvl	x6, sp, #12
	add	x18, x18, 384
	addvl	x16, sp, #12
	ldr	z0, [x18]
	addvl	x15, sp, #12
	add	x6, x6, 896
	ldr	z6, [x6]
	add	x16, x16, 1408
	ldr	z16, [x16]
	add	x15, x15, 1920
	ldr	z4, [x15]
	zip1	z3.h, z0.h, z6.h
	add	x18, x0, 1024
	zip1	z1.h, z16.h, z4.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z1.h, z2.h
// 0 "" 2
#NO_APP
	add	x17, x0, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z1.h, z0.h
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
	sdot z6.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z1.h, z2.h
// 0 "" 2
#NO_APP
	add	x15, x0, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x21, sp, #12
	addvl	x14, sp, #12
	add	x21, x21, 1664
	ldr	z16, [x21]
	add	x14, x14, 640
	ldr	z1, [x14]
	mov	x21, x20
	zip1	z0.h, z1.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z0.h, z3.h
// 0 "" 2
#NO_APP
	mov	x20, x19
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z0.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x19, sp, #12
	addvl	x23, sp, #12
	add	x19, x19, 128
	ldr	z0, [x19]
	add	x23, x23, 1152
	ldr	z16, [x23]
	add	x19, x0, 1344
	zip1	z1.h, z0.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	x30, x0, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	z1.s, z16.s, z2.s
	sub	z16.s, z16.s, z2.s
	add	z2.s, z1.s, z4.s
	sub	z1.s, z1.s, z4.s
	add	z4.s, z2.s, z8.s
	add	x6, sp, 128
	sub	z8.s, z2.s, z8.s
	add	z0.s, z4.s, z17.s
	add	z2.s, z31.s, z3.s
	addvl	x22, sp, #6
	sub	z31.s, z31.s, z3.s
	add	z3.s, z2.s, z5.s
	str	z4, [x6]
	sqrshrnb	z4.h, z0.s, #12
	add	x22, x22, 128
	uzp1	z0.h, z4.h, z4.h
	addvl	x14, sp, #5
	add	z4.s, z31.s, z6.s
	addvl	x23, sp, #1
	sub	z31.s, z31.s, z6.s
	str	z8, [x22]
	sub	z8.s, z2.s, z5.s
	add	z5.s, z3.s, z9.s
	sub	z9.s, z3.s, z9.s
	add	z2.s, z5.s, z30.s
	sqrshrnb	z3.h, z2.s, #12
	uzp1	z6.h, z3.h, z3.h
	ptrue	p0.h, vl8
	add	x14, x14, 128
	add	x23, x23, 128
	addvl	x22, sp, #2
	str	z5, [x23]
	movprfx	z5, z0
	splice	z5.h, p0, z5.h, z6.h
	sub	z6.s, z4.s, z10.s
	str	z9, [x14]
	add	z9.s, z4.s, z10.s
	add	z10.s, z16.s, z7.s
	add	z0.s, z9.s, z18.s
	sqrshrnb	z2.h, z0.s, #12
	sub	z16.s, z16.s, z7.s
	add	z0.s, z10.s, z11.s
	sub	z7.s, z10.s, z11.s
	add	x22, x22, 128
	add	z11.s, z0.s, z19.s
	addvl	x6, sp, #10
	sqrshrnb	z3.h, z11.s, #12
	addvl	x23, sp, #3
	uzp1	z4.h, z2.h, z2.h
	add	z2.s, z16.s, z12.s
	sub	z16.s, z16.s, z12.s
	add	z12.s, z2.s, z20.s
	sqrshrnb	z10.h, z12.s, #12
	str	z9, [x22]
	uzp1	z9.h, z3.h, z3.h
	splice	z4.h, p0, z4.h, z9.h
	add	z12.s, z31.s, z13.s
	uzp1	z11.h, z10.h, z10.h
	sub	z31.s, z31.s, z13.s
	add	z10.s, z8.s, z14.s
	add	z13.s, z12.s, z21.s
	sub	z8.s, z8.s, z14.s
	add	x6, x6, 128
	add	z14.s, z10.s, z22.s
	add	x23, x23, 128
	str	z4, [x6]
	sqrshrnb	z4.h, z13.s, #12
	sqrshrnb	z9.h, z14.s, #12
	uzp1	z3.h, z4.h, z4.h
	add	z14.s, z1.s, z15.s
	movprfx	z4, z11
	splice	z4.h, p0, z4.h, z3.h
	sub	z1.s, z1.s, z15.s
	add	z15.s, z14.s, z23.s
	sqrshrnb	z11.h, z15.s, #12
	str	z7, [x23]
	addvl	x23, sp, #4
	uzp1	z13.h, z9.h, z9.h
	uzp1	z3.h, z11.h, z11.h
	add	z9.s, z1.s, z24.s
	add	z11.s, z8.s, z25.s
	add	x23, x23, 128
	movprfx	z15, z13
	splice	z15.h, p0, z15.h, z3.h
	sqrshrnb	z3.h, z11.s, #12
	sqrshrnb	z13.h, z9.s, #12
	add	z11.s, z31.s, z26.s
	uzp1	z9.h, z3.h, z3.h
	str	z6, [x23]
	addvl	x23, sp, #5
	add	z7.s, z7.s, z28.s
	add	z6.s, z6.s, z29.s
	add	x23, x23, 128
	sqrshrnb	z3.h, z11.s, #12
	uzp1	z13.h, z13.h, z13.h
	splice	z13.h, p0, z13.h, z9.h
	add	z9.s, z16.s, z27.s
	sqrshrnb	z11.h, z9.s, #12
	uzp1	z3.h, z3.h, z3.h
	uzp1	z9.h, z11.h, z11.h
	sqrshrnb	z11.h, z7.s, #12
	sqrshrnb	z7.h, z6.s, #12
	ldr	z6, [x23]
	addvl	x23, sp, #8
	splice	z3.h, p0, z3.h, z9.h
	add	x23, x23, 128
	uzp1	z9.h, z11.h, z11.h
	uzp1	z11.h, z7.h, z7.h
	ldr	z7, [x23]
	addvl	x23, sp, #6
	splice	z9.h, p0, z9.h, z11.h
	add	x23, x23, 128
	add	z11.s, z6.s, z7.s
	sqrshrnb	z6.h, z11.s, #12
	uzp1	z11.h, z6.h, z6.h
	ldr	z6, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 128
	ldr	z7, [x23]
	add	z6.s, z6.s, z7.s
	addvl	x23, sp, #10
	sqrshrnb	z7.h, z6.s, #12
	uzp1	z6.h, z7.h, z7.h
	add	x23, x23, 128
	splice	z11.h, p0, z11.h, z6.h
	ldr	z6, [x23]
	uzp1	z7.h, z5.h, z6.h
	uzp2	z5.h, z5.h, z6.h
	uzp1	z6.h, z4.h, z15.h
	uzp2	z15.h, z4.h, z15.h
	uzp1	z4.h, z7.h, z6.h
	uzp2	z7.h, z7.h, z6.h
	uzp1	z6.h, z13.h, z3.h
	uzp2	z13.h, z13.h, z3.h
	uzp1	z3.h, z9.h, z11.h
	add	x22, x1, x2, lsl 1
	uzp2	z11.h, z9.h, z11.h
	uzp1	z9.h, z6.h, z3.h
	uzp2	z6.h, z6.h, z3.h
	uzp1	z3.h, z4.h, z9.h
	str	z3, [x1]
	add	x6, x22, x2, lsl 1
	uzp2	z9.h, z4.h, z9.h
	uzp1	z4.h, z5.h, z15.h
	uzp2	z15.h, z5.h, z15.h
	uzp1	z5.h, z13.h, z11.h
	uzp2	z13.h, z13.h, z11.h
	uzp1	z11.h, z4.h, z5.h
	str	z11, [x22]
	add	x14, x6, x2, lsl 1
	uzp2	z3.h, z4.h, z5.h
	uzp1	z4.h, z7.h, z6.h
	str	z4, [x6]
	uzp2	z7.h, z7.h, z6.h
	add	x6, x14, x2, lsl 1
	uzp1	z6.h, z15.h, z13.h
	str	z6, [x14]
	add	x14, x6, x2, lsl 1
	add	x23, sp, 128
	str	z9, [x6]
	add	x6, x14, x2, lsl 1
	uzp2	z9.h, z15.h, z13.h
	str	z3, [x14]
	add	x14, x6, x2, lsl 1
	ldr	z15, [x23]
	str	z7, [x6]
	addvl	x6, sp, #1
	addvl	x23, sp, #2
	add	x6, x6, 128
	ldr	z5, [x6]
	add	x23, x23, 128
	addvl	x6, sp, #3
	ldr	z3, [x23]
	addvl	x23, sp, #4
	add	x6, x6, 128
	sub	z16.s, z16.s, z27.s
	ldr	z27, [x6]
	add	x23, x23, 128
	addvl	x6, sp, #5
	sub	z20.s, z2.s, z20.s
	add	x6, x6, 128
	sqrshrnb	z2.h, z20.s, #12
	ldr	z20, [x23]
	sub	z19.s, z0.s, z19.s
	addvl	x23, sp, #8
	sqrshrnb	z0.h, z19.s, #12
	sub	z17.s, z15.s, z17.s
	add	x23, x23, 128
	uzp1	z15.h, z0.h, z0.h
	ldr	z0, [x6]
	addvl	x6, sp, #6
	sqrshrnb	z13.h, z17.s, #12
	sub	z30.s, z5.s, z30.s
	uzp1	z11.h, z13.h, z13.h
	uzp1	z17.h, z2.h, z2.h
	ldr	z2, [x23]
	add	x6, x6, 128
	addvl	x23, sp, #9
	sub	z22.s, z10.s, z22.s
	sqrshrnb	z10.h, z22.s, #12
	uzp1	z5.h, z10.h, z10.h
	sqrshrnb	z4.h, z30.s, #12
	sub	z18.s, z3.s, z18.s
	sub	z28.s, z27.s, z28.s
	sqrshrnb	z7.h, z18.s, #12
	add	x23, x23, 128
	uzp1	z6.h, z7.h, z7.h
	sub	z21.s, z12.s, z21.s
	sub	z23.s, z14.s, z23.s
	sqrshrnb	z12.h, z21.s, #12
	sqrshrnb	z14.h, z23.s, #12
	sub	z24.s, z1.s, z24.s
	uzp1	z30.h, z14.h, z14.h
	sqrshrnb	z1.h, z24.s, #12
	splice	z30.h, p0, z30.h, z5.h
	ldr	z5, [x6]
	sub	z25.s, z8.s, z25.s
	add	x6, x1, 32
	sqrshrnb	z8.h, z25.s, #12
	sub	z26.s, z31.s, z26.s
	sqrshrnb	z31.h, z26.s, #12
	uzp1	z3.h, z31.h, z31.h
	str	z9, [x14]
	uzp1	z9.h, z4.h, z4.h
	splice	z9.h, p0, z9.h, z11.h
	uzp1	z11.h, z1.h, z1.h
	ldr	z23, [x23]
	splice	z15.h, p0, z15.h, z6.h
	sub	z24.s, z5.s, z23.s
	add	x23, x1, x2, lsl 2
	sqrshrnb	z18.h, z16.s, #12
	sqrshrnb	z7.h, z28.s, #12
	sub	z29.s, z20.s, z29.s
	uzp1	z6.h, z7.h, z7.h
	sqrshrnb	z21.h, z29.s, #12
	sqrshrnb	z14.h, z24.s, #12
	add	x22, x22, 32
	uzp1	z13.h, z12.h, z12.h
	uzp1	z4.h, z8.h, z8.h
	splice	z13.h, p0, z13.h, z17.h
	splice	z4.h, p0, z4.h, z11.h
	sub	z17.s, z0.s, z2.s
	uzp1	z11.h, z30.h, z13.h
	sqrshrnb	z22.h, z17.s, #12
	uzp1	z19.h, z18.h, z18.h
	uzp1	z10.h, z22.h, z22.h
	splice	z19.h, p0, z19.h, z3.h
	uzp1	z12.h, z21.h, z21.h
	uzp1	z1.h, z19.h, z4.h
	splice	z12.h, p0, z12.h, z6.h
	uzp1	z3.h, z15.h, z9.h
	uzp1	z8.h, z14.h, z14.h
	uzp1	z27.h, z11.h, z3.h
	splice	z8.h, p0, z8.h, z10.h
	uzp1	z28.h, z8.h, z12.h
	uzp1	z25.h, z28.h, z1.h
	uzp1	z26.h, z25.h, z27.h
	str	z26, [x6]
	add	x6, x2, x2, lsl 1
	uzp2	z31.h, z8.h, z12.h
	uzp2	z4.h, z19.h, z4.h
	uzp2	z13.h, z30.h, z13.h
	uzp2	z9.h, z15.h, z9.h
	uzp1	z15.h, z31.h, z4.h
	uzp1	z16.h, z13.h, z9.h
	uzp1	z30.h, z15.h, z16.h
	str	z30, [x22]
	add	x22, x23, 32
	uzp2	z18.h, z28.h, z1.h
	uzp2	z7.h, z11.h, z3.h
	uzp1	z19.h, z18.h, z7.h
	str	z19, [x22]
	add	x22, x1, x6, lsl 1
	add	x22, x22, 32
	uzp2	z6.h, z31.h, z4.h
	uzp2	z20.h, z13.h, z9.h
	uzp1	z29.h, z6.h, z20.h
	str	z29, [x22]
	add	x22, x1, x2, lsl 3
	add	x22, x22, 32
	uzp2	z0.h, z25.h, z27.h
	add	x23, x2, x2, lsl 2
	str	z0, [x22]
	lsl	x22, x2, 3
	uzp2	z2.h, z15.h, z16.h
	sub	x22, x22, x2
	add	x23, x1, x23, lsl 1
	uzp2	z17.h, z18.h, z7.h
	add	x6, x1, x6, lsl 2
	add	x23, x23, 32
	str	z2, [x23]
	add	x22, x1, x22, lsl 1
	add	x6, x6, 32
	str	z17, [x6]
	add	x23, x22, 32
	uzp2	z21.h, z6.h, z20.h
	addvl	x22, sp, #12
	str	z21, [x23]
	addvl	x23, sp, #12
	add	x22, x22, 208
	add	x23, x23, 336
	ldr	z22, [x22]
	ldr	z12, [x23]
	addvl	x22, sp, #12
	addvl	x23, sp, #12
	zip1	z5.h, z22.h, z12.h
	add	x22, x22, 464
	add	x23, x23, 592
	ldr	z10, [x22]
	ldr	z23, [x23]
	addvl	x22, sp, #12
	addvl	x23, sp, #12
	add	x22, x22, 720
	add	x23, x23, 848
	ldr	z24, [x22]
	ldr	z14, [x23]
	addvl	x22, sp, #12
	addvl	x23, sp, #12
	add	x22, x22, 976
	add	x23, x23, 1104
	ldr	z8, [x22]
	ldr	z3, [x23]
	addvl	x22, sp, #12
	addvl	x23, sp, #12
	add	x22, x22, 1232
	add	x23, x23, 1360
	ldr	z27, [x22]
	ldr	z28, [x23]
	addvl	x22, sp, #12
	addvl	x23, sp, #12
	add	x22, x22, 1488
	add	x23, x23, 1616
	ldr	z25, [x22]
	ldr	z26, [x23]
	addvl	x22, sp, #12
	addvl	x23, sp, #12
	add	x22, x22, 1744
	add	x23, x23, 1872
	ldr	z9, [x22]
	ldr	z31, [x23]
	addvl	x22, sp, #12
	addvl	x23, sp, #12
	add	x22, x22, 2000
	ldr	z16, [x22]
	add	x23, x23, 2128
	ldr	z30, [x23]
	adrp	x6, _ZL6CDOT_O
	zip1	z1.h, z10.h, z23.h
	add	x6, x6, :lo12:_ZL6CDOT_O
	zip1	z11.h, z24.h, z14.h
	zip1	z4.h, z8.h, z3.h
	zip1	z13.h, z27.h, z28.h
	zip1	z6.h, z25.h, z26.h
	zip1	z15.h, z9.h, z31.h
	zip1	z0.h, z16.h, z30.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d18, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+256
	add	x22, x6, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z11.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z4.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z13.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z15.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z0.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+512
	add	x6, x23, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d20, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x22, _ZL6CDOT_O+768
	add	x23, x22, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+1024
	add	x22, x6, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+1280
	add	x6, x23, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x22, _ZL6CDOT_O+1536
	add	x23, x22, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+1792
	add	x22, x6, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+2048
	add	x6, x23, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x22, _ZL6CDOT_O+2304
	add	x23, x22, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+2560
	add	x22, x6, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+2816
	add	x6, x23, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z3.h
// 0 "" 2
#NO_APP
	adrp	x22, _ZL6CDOT_O+3072
	add	x23, x22, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d3, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z11.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z13.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z6.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z0.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #8
	add	x5, x5, 128
	str	z3, [x5]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d7, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z11.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z4.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z15.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x4, sp, #9
	add	x4, x4, 128
	str	z7, [x4]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z11.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z15.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #10
	addvl	x6, sp, #12
	addvl	x22, sp, #12
	add	x3, x3, 128
	str	z17, [x3]
	add	x6, x6, 272
	add	x22, x22, 528
	ldr	z0, [x6]
	ldr	z12, [x22]
	addvl	x23, sp, #12
	addvl	x5, sp, #12
	addvl	x4, sp, #12
	addvl	x3, sp, #12
	zip1	z3.h, z0.h, z12.h
	addvl	x6, sp, #12
	addvl	x22, sp, #12
	add	x23, x23, 784
	ldr	z10, [x23]
	add	x5, x5, 1040
	ldr	z14, [x5]
	add	x4, x4, 1296
	ldr	z8, [x4]
	add	x3, x3, 1552
	ldr	z9, [x3]
	add	x6, x6, 1808
	ldr	z7, [x6]
	add	x22, x22, 2064
	ldr	z16, [x22]
	zip1	z19.h, z10.h, z14.h
	zip1	z2.h, z8.h, z9.h
	zip1	z1.h, z7.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d9, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z19.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d10, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z19.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d11, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z19.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d12, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z19.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d13, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z19.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d14, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z19.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d15, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z19.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d16, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z19.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z2.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #12
	addvl	x13, sp, #12
	addvl	x12, sp, #12
	addvl	x11, sp, #12
	add	x0, x0, 400
	ldr	z1, [x0]
	add	x13, x13, 912
	ldr	z7, [x13]
	add	x12, x12, 1424
	ldr	z5, [x12]
	add	x11, x11, 1936
	ldr	z4, [x11]
	zip1	z0.h, z1.h, z7.h
	zip1	z17.h, z5.h, z4.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d19, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z0.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z17.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z0.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z17.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d7, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z17.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #12
	addvl	x9, sp, #12
	add	x10, x10, 656
	ldr	z17, [x10]
	add	x9, x9, 1680
	ldr	z8, [x9]
	zip1	z1.h, z17.h, z8.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d2, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z1.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d3, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z1.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x8, sp, #12
	addvl	x7, sp, #12
	add	x8, x8, 144
	ldr	z0, [x8]
	add	x7, x7, 1168
	ldr	z17, [x7]
	zip1	z1.h, z0.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d8, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	z1.s, z8.s, z2.s
	sub	z8.s, z8.s, z2.s
	add	z2.s, z1.s, z19.s
	addvl	x16, sp, #6
	add	z4.s, z2.s, z9.s
	sub	z19.s, z1.s, z19.s
	add	z0.s, z4.s, z18.s
	add	z1.s, z17.s, z3.s
	sub	z9.s, z2.s, z9.s
	sqrshrnb	z2.h, z0.s, #12
	add	x17, x14, x2, lsl 1
	add	x15, sp, 128
	sub	z17.s, z17.s, z3.s
	add	x16, x16, 128
	add	z3.s, z1.s, z5.s
	addvl	x14, sp, #5
	addvl	x5, sp, #11
	str	z9, [x16]
	sub	z9.s, z1.s, z5.s
	add	z5.s, z3.s, z10.s
	sub	z10.s, z3.s, z10.s
	add	z0.s, z5.s, z31.s
	sqrshrnb	z1.h, z0.s, #12
	str	z4, [x15]
	uzp1	z4.h, z2.h, z2.h
	uzp1	z2.h, z1.h, z1.h
	splice	z4.h, p0, z4.h, z2.h
	add	x14, x14, 128
	addvl	x23, sp, #1
	str	z10, [x14]
	add	x5, x5, 128
	add	z10.s, z8.s, z7.s
	addvl	x4, sp, #2
	sub	z8.s, z8.s, z7.s
	add	z0.s, z10.s, z12.s
	sub	z10.s, z10.s, z12.s
	add	z12.s, z0.s, z21.s
	sqrshrnb	z7.h, z12.s, #12
	uzp1	z2.h, z7.h, z7.h
	str	z4, [x5]
	add	z4.s, z17.s, z6.s
	add	z3.s, z4.s, z11.s
	sub	z17.s, z17.s, z6.s
	add	x23, x23, 128
	sub	z6.s, z4.s, z11.s
	add	x4, x4, 128
	add	z11.s, z3.s, z20.s
	str	z3, [x4]
	sub	z3.s, z8.s, z13.s
	str	z5, [x23]
	sqrshrnb	z5.h, z11.s, #12
	uzp1	z1.h, z5.h, z5.h
	movprfx	z7, z1
	splice	z7.h, p0, z7.h, z2.h
	add	z2.s, z8.s, z13.s
	add	z13.s, z2.s, z22.s
	sqrshrnb	z4.h, z13.s, #12
	uzp1	z11.h, z4.h, z4.h
	add	z13.s, z17.s, z14.s
	sub	z17.s, z17.s, z14.s
	add	z14.s, z13.s, z23.s
	sqrshrnb	z5.h, z14.s, #12
	uzp1	z1.h, z5.h, z5.h
	addvl	x13, sp, #4
	movprfx	z5, z11
	splice	z5.h, p0, z5.h, z1.h
	add	z11.s, z9.s, z15.s
	sub	z9.s, z9.s, z15.s
	add	z15.s, z11.s, z24.s
	sqrshrnb	z8.h, z15.s, #12
	sub	z1.s, z19.s, z16.s
	add	z15.s, z19.s, z16.s
	add	z14.s, z1.s, z26.s
	add	z16.s, z15.s, z25.s
	uzp1	z4.h, z8.h, z8.h
	sqrshrnb	z19.h, z16.s, #12
	sqrshrnb	z8.h, z14.s, #12
	uzp1	z12.h, z19.h, z19.h
	uzp1	z19.h, z8.h, z8.h
	movprfx	z16, z4
	splice	z16.h, p0, z16.h, z12.h
	add	z8.s, z17.s, z28.s
	add	z4.s, z9.s, z27.s
	sqrshrnb	z12.h, z4.s, #12
	addvl	x10, sp, #8
	uzp1	z14.h, z12.h, z12.h
	sqrshrnb	z4.h, z8.s, #12
	add	z12.s, z3.s, z29.s
	sqrshrnb	z8.h, z12.s, #12
	splice	z19.h, p0, z19.h, z14.h
	addvl	x3, sp, #3
	add	x13, x13, 128
	uzp1	z14.h, z4.h, z4.h
	add	x10, x10, 128
	uzp1	z4.h, z8.h, z8.h
	ldr	z8, [x10]
	addvl	x9, sp, #5
	addvl	x8, sp, #9
	str	z6, [x13]
	add	z6.s, z6.s, z8.s
	splice	z14.h, p0, z14.h, z4.h
	add	x3, x3, 128
	sqrshrnb	z4.h, z6.s, #12
	add	x9, x9, 128
	ldr	z6, [x9]
	add	x8, x8, 128
	ldr	z8, [x8]
	addvl	x16, sp, #6
	addvl	x15, sp, #10
	str	z10, [x3]
	add	z10.s, z10.s, z30.s
	sqrshrnb	z12.h, z10.s, #12
	add	x16, x16, 128
	add	x15, x15, 128
	uzp1	z10.h, z12.h, z12.h
	uzp1	z12.h, z4.h, z4.h
	add	z4.s, z6.s, z8.s
	ldr	z8, [x16]
	ldr	z6, [x15]
	splice	z10.h, p0, z10.h, z12.h
	addvl	x5, sp, #11
	sqrshrnb	z12.h, z4.s, #12
	add	z4.s, z8.s, z6.s
	sqrshrnb	z8.h, z4.s, #12
	uzp1	z6.h, z8.h, z8.h
	add	x5, x5, 128
	ldr	z4, [x5]
	uzp1	z12.h, z12.h, z12.h
	uzp1	z8.h, z4.h, z7.h
	splice	z12.h, p0, z12.h, z6.h
	uzp2	z6.h, z4.h, z7.h
	uzp1	z7.h, z5.h, z16.h
	uzp2	z16.h, z5.h, z16.h
	uzp1	z5.h, z8.h, z7.h
	uzp2	z8.h, z8.h, z7.h
	uzp1	z7.h, z19.h, z14.h
	uzp2	z19.h, z19.h, z14.h
	uzp1	z14.h, z10.h, z12.h
	uzp2	z12.h, z10.h, z12.h
	uzp1	z10.h, z7.h, z14.h
	uzp1	z4.h, z5.h, z10.h
	str	z4, [x17]
	add	x22, x17, x2, lsl 1
	uzp2	z7.h, z7.h, z14.h
	uzp2	z10.h, z5.h, z10.h
	uzp1	z5.h, z6.h, z16.h
	uzp2	z16.h, z6.h, z16.h
	uzp1	z6.h, z19.h, z12.h
	uzp1	z14.h, z5.h, z6.h
	str	z14, [x22]
	add	x0, x22, x2, lsl 1
	uzp2	z19.h, z19.h, z12.h
	uzp1	z12.h, z8.h, z7.h
	str	z12, [x0]
	add	x6, x0, x2, lsl 1
	uzp2	z8.h, z8.h, z7.h
	uzp1	z7.h, z16.h, z19.h
	str	z7, [x6]
	add	x12, x6, x2, lsl 1
	add	x23, x2, x2, lsl 2
	str	z10, [x12]
	add	x11, x12, x2, lsl 1
	uzp2	z4.h, z5.h, z6.h
	add	x14, x2, x2, lsl 3
	addvl	x0, sp, #1
	addvl	x6, sp, #2
	str	z4, [x11]
	add	x7, x11, x2, lsl 1
	uzp2	z10.h, z16.h, z19.h
	add	x17, x1, x2, lsl 4
	add	x4, sp, 128
	ldr	z5, [x4]
	add	x0, x0, 128
	ldr	z6, [x0]
	sub	z18.s, z5.s, z18.s
	sub	z31.s, z6.s, z31.s
	sqrshrnb	z16.h, z18.s, #12
	sqrshrnb	z19.h, z31.s, #12
	add	x6, x6, 128
	ldr	z4, [x6]
	addvl	x12, sp, #3
	add	x15, x2, x23, lsl 1
	str	z8, [x7]
	add	x22, x7, x2, lsl 1
	add	x16, x1, x14, lsl 1
	uzp1	z14.h, z16.h, z16.h
	add	x7, x17, 32
	sub	z20.s, z4.s, z20.s
	add	x17, x2, x2, lsl 1
	sqrshrnb	z12.h, z20.s, #12
	sub	z29.s, z3.s, z29.s
	uzp1	z8.h, z12.h, z12.h
	sqrshrnb	z4.h, z29.s, #12
	add	x12, x12, 128
	ldr	z3, [x12]
	addvl	x3, sp, #4
	sub	z30.s, z3.s, z30.s
	addvl	x11, sp, #8
	addvl	x13, sp, #5
	addvl	x10, sp, #9
	uzp1	z7.h, z19.h, z19.h
	addvl	x9, sp, #6
	addvl	x8, sp, #10
	sub	z21.s, z0.s, z21.s
	sub	z22.s, z2.s, z22.s
	sqrshrnb	z0.h, z21.s, #12
	sqrshrnb	z2.h, z22.s, #12
	uzp1	z5.h, z0.h, z0.h
	sub	z23.s, z13.s, z23.s
	splice	z5.h, p0, z5.h, z8.h
	sqrshrnb	z13.h, z23.s, #12
	sub	z24.s, z11.s, z24.s
	sub	z25.s, z15.s, z25.s
	sqrshrnb	z11.h, z24.s, #12
	sqrshrnb	z15.h, z25.s, #12
	uzp1	z16.h, z11.h, z11.h
	sub	z26.s, z1.s, z26.s
	uzp1	z31.h, z15.h, z15.h
	sqrshrnb	z1.h, z26.s, #12
	splice	z31.h, p0, z31.h, z16.h
	uzp1	z6.h, z1.h, z1.h
	sub	z27.s, z9.s, z27.s
	sub	z28.s, z17.s, z28.s
	sqrshrnb	z9.h, z27.s, #12
	sqrshrnb	z17.h, z28.s, #12
	uzp1	z19.h, z17.h, z17.h
	str	z10, [x22]
	uzp1	z10.h, z2.h, z2.h
	splice	z7.h, p0, z7.h, z14.h
	add	x5, x16, 32
	uzp1	z17.h, z5.h, z7.h
	add	x4, x1, x23, lsl 2
	uzp2	z7.h, z5.h, z7.h
	add	x12, x1, x15, lsl 1
	sqrshrnb	z20.h, z30.s, #12
	add	x3, x3, 128
	ldr	z8, [x3]
	uzp1	z21.h, z20.h, z20.h
	add	x11, x11, 128
	ldr	z12, [x11]
	add	x13, x13, 128
	ldr	z2, [x13]
	sub	z22.s, z8.s, z12.s
	add	x10, x10, 128
	sqrshrnb	z24.h, z22.s, #12
	add	x9, x9, 128
	ldr	z25, [x9]
	add	x8, x8, 128
	ldr	z26, [x8]
	uzp1	z18.h, z13.h, z13.h
	sub	z15.s, z25.s, z26.s
	splice	z18.h, p0, z18.h, z10.h
	ldr	z10, [x10]
	uzp1	z27.h, z31.h, z18.h
	sub	z23.s, z2.s, z10.s
	uzp2	z18.h, z31.h, z18.h
	sqrshrnb	z13.h, z23.s, #12
	uzp1	z31.h, z18.h, z7.h
	uzp1	z16.h, z13.h, z13.h
	uzp1	z14.h, z9.h, z9.h
	uzp1	z0.h, z4.h, z4.h
	splice	z14.h, p0, z14.h, z6.h
	splice	z0.h, p0, z0.h, z19.h
	sqrshrnb	z6.h, z15.s, #12
	uzp1	z1.h, z0.h, z14.h
	uzp1	z19.h, z27.h, z17.h
	uzp2	z14.h, z0.h, z14.h
	uzp1	z11.h, z24.h, z24.h
	uzp1	z9.h, z6.h, z6.h
	splice	z11.h, p0, z11.h, z21.h
	splice	z9.h, p0, z9.h, z16.h
	uzp1	z28.h, z9.h, z11.h
	uzp2	z30.h, z9.h, z11.h
	uzp1	z4.h, z28.h, z1.h
	uzp1	z5.h, z30.h, z14.h
	uzp1	z29.h, z4.h, z19.h
	uzp1	z3.h, z5.h, z31.h
	str	z29, [x7]
	str	z3, [x5]
	uzp2	z20.h, z28.h, z1.h
	uzp2	z0.h, z27.h, z17.h
	add	x11, x2, x17, lsl 2
	add	x6, x4, 32
	lsl	x0, x2, 3
	uzp1	z21.h, z20.h, z0.h
	add	x13, x12, 32
	lsl	x12, x2, 4
	str	z21, [x6]
	uzp2	z8.h, z30.h, z14.h
	uzp2	z12.h, z18.h, z7.h
	add	x3, x1, x17, lsl 3
	sub	x10, x0, x2
	sub	x7, x12, x2
	uzp1	z22.h, z8.h, z12.h
	str	z22, [x13]
	add	x8, x1, x11, lsl 1
	uzp2	z2.h, z4.h, z19.h
	add	x9, x3, 32
	str	z2, [x9]
	add	x5, x1, x10, lsl 2
	add	x6, x1, x7, lsl 1
	add	x16, x8, 32
	uzp2	z10.h, z5.h, z31.h
	addvl	x13, sp, #12
	addvl	x3, sp, #12
	str	z10, [x16]
	addvl	x9, sp, #7
	addvl	x8, sp, #12
	uzp2	z23.h, z20.h, z0.h
	addvl	x7, sp, #12
	add	x4, x5, 32
	str	z23, [x4]
	lsl	x11, x17, 3
	add	x13, x13, 2016
	uzp2	z24.h, z8.h, z12.h
	add	x17, x6, 32
	add	x3, x3, 224
	str	z24, [x17]
	add	x9, x9, 128
	add	x8, x8, 352
	ldr	z16, [x9]
	add	x7, x7, 480
	adrp	x0, _ZL6CDOT_O
	ldr	z13, [x13]
	ldr	z11, [x3]
	ldr	z25, [x8]
	ldr	z26, [x7]
	add	x10, x0, :lo12:_ZL6CDOT_O
	addvl	x16, sp, #12
	zip1	z1.h, z13.h, z16.h
	addvl	x5, sp, #12
	addvl	x4, sp, #12
	zip1	z6.h, z11.h, z25.h
	addvl	x6, sp, #12
	addvl	x17, sp, #12
	addvl	x0, sp, #12
	addvl	x13, sp, #12
	addvl	x3, sp, #12
	addvl	x9, sp, #12
	addvl	x8, sp, #12
	addvl	x7, sp, #12
	add	x16, x16, 608
	ldr	z15, [x16]
	add	x5, x5, 736
	ldr	z27, [x5]
	add	x4, x4, 864
	ldr	z9, [x4]
	add	x6, x6, 992
	ldr	z17, [x6]
	add	x17, x17, 1120
	ldr	z19, [x17]
	add	x0, x0, 1248
	ldr	z28, [x0]
	add	x13, x13, 1376
	ldr	z29, [x13]
	add	x3, x3, 1504
	ldr	z14, [x3]
	add	x9, x9, 1632
	ldr	z30, [x9]
	add	x8, x8, 1760
	ldr	z18, [x8]
	add	x7, x7, 1888
	ldr	z7, [x7]
	zip1	z4.h, z26.h, z15.h
	zip1	z5.h, z27.h, z9.h
	zip1	z3.h, z17.h, z19.h
	zip1	z0.h, z28.h, z29.h
	zip1	z2.h, z14.h, z30.h
	zip1	z16.h, z18.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x16, _ZL6CDOT_O+256
	add	x9, x16, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+512
	add	x8, x5, :lo12:_ZL6CDOT_O+512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+768
	add	x7, x4, :lo12:_ZL6CDOT_O+768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+1024
	add	x6, x6, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+1280
	add	x5, x17, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1536
	add	x4, x0, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x13, _ZL6CDOT_O+1792
	add	x3, x13, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x16, _ZL6CDOT_O+2048
	add	x17, x16, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2304
	add	x13, x0, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x16, _ZL6CDOT_O+2560
	add	x17, x16, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2816
	add	x13, x0, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x16, _ZL6CDOT_O+3072
	add	x17, x16, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3328
	add	x13, x0, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z16.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x16, sp, #7
	adrp	x17, _ZL6CDOT_O+3584
	add	x16, x16, 128
	add	x0, x17, :lo12:_ZL6CDOT_O+3584
	str	z7, [x16]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x0, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x0, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x0, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z16.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x0, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x13, sp, #8
	adrp	x16, _ZL6CDOT_O+3840
	add	x13, x13, 128
	add	x17, x16, :lo12:_ZL6CDOT_O+3840
	str	z7, [x13]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x17, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x17, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z16.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x17, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	addvl	x16, sp, #12
	addvl	x17, sp, #12
	add	x0, x0, 128
	str	z17, [x0]
	add	x16, x16, 288
	add	x17, x17, 544
	ldr	z1, [x16]
	ldr	z14, [x17]
	addvl	x0, sp, #12
	addvl	x16, sp, #12
	addvl	x17, sp, #12
	add	x0, x0, 800
	ldr	z12, [x0]
	add	x16, x16, 1056
	add	x17, x17, 1312
	ldr	z10, [x16]
	ldr	z8, [x17]
	addvl	x0, sp, #12
	addvl	x16, sp, #12
	addvl	x17, sp, #12
	add	x0, x0, 1568
	ldr	z13, [x0]
	add	x16, x16, 1824
	ldr	z11, [x16]
	add	x17, x17, 2080
	ldr	z15, [x17]
	adrp	x13, .LANCHOR0
	zip1	z6.h, z1.h, z14.h
	zip1	z7.h, z12.h, z10.h
	zip1	z4.h, z8.h, z13.h
	add	x13, x13, :lo12:.LANCHOR0
	zip1	z3.h, z11.h, z15.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z7.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z4.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z16.h
// 0 "" 2
#NO_APP
	add	x0, x13, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z7.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z12.h
// 0 "" 2
#NO_APP
	add	x16, x13, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z5.h
// 0 "" 2
#NO_APP
	add	x17, x13, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z7.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z17.h
// 0 "" 2
#NO_APP
	add	x0, x13, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z7.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z15.h
// 0 "" 2
#NO_APP
	add	x16, x13, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z7.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z4.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z16.h
// 0 "" 2
#NO_APP
	add	x17, x13, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z7.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z5.h
// 0 "" 2
#NO_APP
	add	x0, x13, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z4.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x16, sp, #12
	addvl	x17, sp, #12
	add	x16, x16, 416
	ldr	z3, [x16]
	addvl	x0, sp, #12
	addvl	x16, sp, #12
	add	x17, x17, 928
	ldr	z2, [x17]
	add	x0, x0, 1440
	ldr	z17, [x0]
	add	x16, x16, 1952
	ldr	z8, [x16]
	zip1	z1.h, z3.h, z2.h
	zip1	z0.h, z17.h, z8.h
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
	sdot z4.s, z0.h, z6.h
// 0 "" 2
#NO_APP
	add	x18, x13, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z0.h, z3.h
// 0 "" 2
#NO_APP
	add	x17, x13, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z0.h, z17.h
// 0 "" 2
#NO_APP
	add	x13, x13, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #12
	addvl	x16, sp, #12
	add	x0, x0, 672
	ldr	z0, [x0]
	add	x16, x16, 1696
	ldr	z3, [x16]
	zip1	z17.h, z0.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z17.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z17.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x21, sp, #12
	addvl	x20, sp, #12
	add	x21, x21, 160
	ldr	z0, [x21]
	add	x20, x20, 1184
	ldr	z17, [x20]
	zip1	z1.h, z0.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	z1.s, z8.s, z2.s
	sub	z8.s, z8.s, z2.s
	add	z2.s, z1.s, z4.s
	sub	z1.s, z1.s, z4.s
	add	z4.s, z2.s, z9.s
	add	x18, sp, 128
	sub	z9.s, z2.s, z9.s
	add	z0.s, z4.s, z30.s
	add	z2.s, z17.s, z3.s
	addvl	x19, sp, #6
	sub	z17.s, z17.s, z3.s
	add	z3.s, z2.s, z5.s
	str	z4, [x18]
	sqrshrnb	z4.h, z0.s, #12
	add	x19, x19, 128
	addvl	x13, sp, #1
	addvl	x0, sp, #10
	uzp1	z0.h, z4.h, z4.h
	add	z4.s, z17.s, z6.s
	sub	z17.s, z17.s, z6.s
	str	z9, [x19]
	sub	z9.s, z2.s, z5.s
	add	z5.s, z3.s, z10.s
	sub	z10.s, z3.s, z10.s
	add	z2.s, z5.s, z29.s
	sqrshrnb	z3.h, z2.s, #12
	uzp1	z6.h, z3.h, z3.h
	splice	z0.h, p0, z0.h, z6.h
	addvl	x17, sp, #5
	add	x13, x13, 128
	add	x0, x0, 128
	str	z5, [x13]
	add	z5.s, z4.s, z11.s
	str	z0, [x0]
	add	z0.s, z5.s, z18.s
	sub	z6.s, z4.s, z11.s
	add	x17, x17, 128
	add	z11.s, z8.s, z7.s
	addvl	x16, sp, #2
	sub	z8.s, z8.s, z7.s
	addvl	x21, sp, #3
	add	z7.s, z11.s, z12.s
	str	z10, [x17]
	sqrshrnb	z10.h, z0.s, #12
	sub	z0.s, z11.s, z12.s
	add	z12.s, z7.s, z19.s
	sqrshrnb	z2.h, z12.s, #12
	uzp1	z3.h, z2.h, z2.h
	uzp1	z4.h, z10.h, z10.h
	add	z2.s, z8.s, z13.s
	add	x16, x16, 128
	add	x21, x21, 128
	str	z5, [x16]
	str	z7, [x21]
	movprfx	z7, z4
	splice	z7.h, p0, z7.h, z3.h
	sub	z3.s, z8.s, z13.s
	add	z13.s, z2.s, z20.s
	sqrshrnb	z5.h, z13.s, #12
	uzp1	z11.h, z5.h, z5.h
	add	z13.s, z17.s, z14.s
	sub	z17.s, z17.s, z14.s
	add	z14.s, z13.s, z21.s
	sqrshrnb	z10.h, z14.s, #12
	uzp1	z8.h, z10.h, z10.h
	movprfx	z5, z11
	splice	z5.h, p0, z5.h, z8.h
	add	z11.s, z9.s, z15.s
	sub	z9.s, z9.s, z15.s
	add	z15.s, z11.s, z22.s
	sqrshrnb	z4.h, z15.s, #12
	add	z15.s, z1.s, z16.s
	sub	z1.s, z1.s, z16.s
	add	z16.s, z15.s, z23.s
	sqrshrnb	z12.h, z16.s, #12
	add	z8.s, z1.s, z24.s
	uzp1	z14.h, z4.h, z4.h
	uzp1	z10.h, z12.h, z12.h
	sqrshrnb	z4.h, z8.s, #12
	add	z12.s, z9.s, z25.s
	movprfx	z16, z14
	splice	z16.h, p0, z16.h, z10.h
	sqrshrnb	z10.h, z12.s, #12
	uzp1	z14.h, z4.h, z4.h
	uzp1	z8.h, z10.h, z10.h
	add	z4.s, z17.s, z26.s
	sqrshrnb	z12.h, z4.s, #12
	splice	z14.h, p0, z14.h, z8.h
	add	z10.s, z3.s, z27.s
	addvl	x18, sp, #4
	sqrshrnb	z8.h, z10.s, #12
	addvl	x0, sp, #7
	uzp1	z4.h, z12.h, z12.h
	uzp1	z12.h, z8.h, z8.h
	add	z10.s, z0.s, z28.s
	splice	z4.h, p0, z4.h, z12.h
	add	x18, x18, 128
	add	x0, x0, 128
	ldr	z12, [x0]
	addvl	x16, sp, #5
	sqrshrnb	z8.h, z10.s, #12
	str	z6, [x18]
	add	z6.s, z6.s, z12.s
	add	x16, x16, 128
	addvl	x21, sp, #8
	uzp1	z10.h, z8.h, z8.h
	sqrshrnb	z8.h, z6.s, #12
	ldr	z6, [x16]
	uzp1	z12.h, z8.h, z8.h
	add	x21, x21, 128
	ldr	z8, [x21]
	splice	z10.h, p0, z10.h, z12.h
	addvl	x0, sp, #6
	add	z12.s, z6.s, z8.s
	addvl	x16, sp, #9
	sqrshrnb	z6.h, z12.s, #12
	add	x0, x0, 128
	add	x16, x16, 128
	ldr	z8, [x16]
	uzp1	z12.h, z6.h, z6.h
	ldr	z6, [x0]
	add	z6.s, z6.s, z8.s
	addvl	x21, sp, #10
	sqrshrnb	z8.h, z6.s, #12
	uzp1	z6.h, z8.h, z8.h
	add	x21, x21, 128
	splice	z12.h, p0, z12.h, z6.h
	ldr	z6, [x21]
	uzp1	z8.h, z6.h, z7.h
	uzp2	z6.h, z6.h, z7.h
	uzp1	z7.h, z5.h, z16.h
	uzp2	z16.h, z5.h, z16.h
	uzp1	z5.h, z8.h, z7.h
	uzp2	z8.h, z8.h, z7.h
	uzp1	z7.h, z14.h, z4.h
	uzp2	z14.h, z14.h, z4.h
	uzp1	z4.h, z10.h, z12.h
	add	x22, x22, x2, lsl 1
	uzp2	z12.h, z10.h, z12.h
	uzp1	z10.h, z7.h, z4.h
	uzp2	z7.h, z7.h, z4.h
	uzp1	z4.h, z5.h, z10.h
	str	z4, [x22]
	add	x20, x22, x2, lsl 1
	uzp2	z10.h, z5.h, z10.h
	uzp1	z5.h, z6.h, z16.h
	uzp2	z16.h, z6.h, z16.h
	uzp1	z6.h, z14.h, z12.h
	uzp2	z14.h, z14.h, z12.h
	uzp1	z12.h, z5.h, z6.h
	str	z12, [x20]
	add	x13, x20, x2, lsl 1
	uzp2	z4.h, z5.h, z6.h
	uzp1	z5.h, z8.h, z7.h
	str	z5, [x13]
	add	x19, x13, x2, lsl 1
	uzp2	z8.h, z8.h, z7.h
	uzp1	z7.h, z16.h, z14.h
	str	z7, [x19]
	add	x17, x19, x2, lsl 1
	str	z10, [x17]
	add	x22, x12, x2
	add	x18, x17, x2, lsl 1
	str	z4, [x18]
	uzp2	z10.h, z16.h, z14.h
	add	x20, x18, x2, lsl 1
	add	x17, sp, 128
	ldr	z16, [x17]
	addvl	x18, sp, #1
	addvl	x0, sp, #2
	str	z8, [x20]
	addvl	x16, sp, #3
	add	x12, x20, x2, lsl 1
	sub	z30.s, z16.s, z30.s
	add	x13, x2, 1
	sqrshrnb	z14.h, z30.s, #12
	add	x18, x18, 128
	ldr	z6, [x18]
	uzp1	z4.h, z14.h, z14.h
	sub	z29.s, z6.s, z29.s
	add	x0, x0, 128
	ldr	z8, [x0]
	sqrshrnb	z12.h, z29.s, #12
	sub	z18.s, z8.s, z18.s
	add	x16, x16, 128
	sqrshrnb	z7.h, z18.s, #12
	str	z10, [x12]
	ldr	z10, [x16]
	sub	z16.s, z10.s, z19.s
	add	x16, x2, x14, lsl 1
	add	x19, x1, x22, lsl 1
	uzp1	z19.h, z7.h, z7.h
	sqrshrnb	z30.h, z16.s, #12
	sub	z2.s, z2.s, z20.s
	addvl	x21, sp, #4
	sqrshrnb	z6.h, z2.s, #12
	addvl	x22, sp, #7
	uzp1	z29.h, z6.h, z6.h
	addvl	x20, sp, #5
	addvl	x17, sp, #8
	uzp1	z5.h, z12.h, z12.h
	addvl	x18, sp, #6
	splice	z5.h, p0, z5.h, z4.h
	addvl	x0, sp, #9
	uzp1	z20.h, z30.h, z30.h
	sub	z21.s, z13.s, z21.s
	splice	z20.h, p0, z20.h, z19.h
	sqrshrnb	z13.h, z21.s, #12
	sub	z22.s, z11.s, z22.s
	sub	z23.s, z15.s, z23.s
	sqrshrnb	z11.h, z22.s, #12
	sqrshrnb	z15.h, z23.s, #12
	uzp1	z12.h, z11.h, z11.h
	sub	z24.s, z1.s, z24.s
	uzp1	z4.h, z15.h, z15.h
	sqrshrnb	z1.h, z24.s, #12
	splice	z4.h, p0, z4.h, z12.h
	uzp1	z8.h, z1.h, z1.h
	sub	z25.s, z9.s, z25.s
	sub	z26.s, z17.s, z26.s
	sqrshrnb	z9.h, z25.s, #12
	sqrshrnb	z17.h, z26.s, #12
	sub	z27.s, z3.s, z27.s
	uzp1	z7.h, z17.h, z17.h
	sub	z28.s, z0.s, z28.s
	sqrshrnb	z0.h, z28.s, #12
	uzp1	z16.h, z0.h, z0.h
	uzp1	z17.h, z20.h, z5.h
	add	x13, x1, x13, lsl 5
	uzp2	z5.h, z20.h, z5.h
	add	x14, x1, x14, lsl 2
	sqrshrnb	z3.h, z27.s, #12
	add	x21, x21, 128
	ldr	z19, [x21]
	add	x22, x22, 128
	ldr	z30, [x22]
	add	x20, x20, 128
	ldr	z6, [x20]
	sub	z2.s, z19.s, z30.s
	add	x17, x17, 128
	sqrshrnb	z22.h, z2.s, #12
	add	x18, x18, 128
	ldr	z23, [x18]
	add	x0, x0, 128
	ldr	z24, [x0]
	add	x19, x19, 32
	sub	z15.s, z23.s, z24.s
	uzp1	z14.h, z13.h, z13.h
	uzp1	z18.h, z9.h, z9.h
	splice	z14.h, p0, z14.h, z29.h
	ldr	z29, [x17]
	uzp1	z26.h, z4.h, z14.h
	splice	z18.h, p0, z18.h, z8.h
	sub	z21.s, z6.s, z29.s
	sqrshrnb	z8.h, z15.s, #12
	sqrshrnb	z13.h, z21.s, #12
	uzp2	z14.h, z4.h, z14.h
	uzp1	z12.h, z13.h, z13.h
	uzp1	z4.h, z14.h, z5.h
	uzp1	z10.h, z3.h, z3.h
	uzp1	z11.h, z22.h, z22.h
	splice	z10.h, p0, z10.h, z7.h
	splice	z11.h, p0, z11.h, z16.h
	uzp1	z1.h, z10.h, z18.h
	uzp1	z7.h, z26.h, z17.h
	uzp2	z18.h, z10.h, z18.h
	uzp1	z9.h, z8.h, z8.h
	splice	z9.h, p0, z9.h, z12.h
	uzp1	z27.h, z9.h, z11.h
	uzp2	z16.h, z9.h, z11.h
	uzp1	z0.h, z27.h, z1.h
	uzp1	z20.h, z16.h, z18.h
	uzp1	z25.h, z0.h, z7.h
	uzp1	z28.h, z20.h, z4.h
	str	z25, [x13]
	str	z28, [x19]
	uzp2	z3.h, z27.h, z1.h
	uzp2	z10.h, z26.h, z17.h
	add	x22, x1, x16, lsl 1
	add	x20, x2, x23, lsl 2
	add	x21, x14, 32
	uzp1	z19.h, z3.h, z10.h
	str	z19, [x21]
	uzp2	z30.h, z16.h, z18.h
	uzp2	z2.h, z14.h, z5.h
	add	x17, x22, 32
	uzp1	z6.h, z30.h, z2.h
	add	x23, x1, x23, lsl 3
	sub	x11, x11, x2
	str	z6, [x17]
	add	x0, x1, x20, lsl 1
	uzp2	z29.h, z0.h, z7.h
	add	x18, x23, 32
	str	z29, [x18]
	add	x16, x1, x11, lsl 1
	uzp2	z21.h, z20.h, z4.h
	add	x15, x1, x15, lsl 2
	add	x13, x0, 32
	addvl	x21, sp, #12
	str	z21, [x13]
	addvl	x22, sp, #12
	addvl	x20, sp, #12
	uzp2	z22.h, z3.h, z10.h
	add	x19, x15, 32
	add	x14, x16, 32
	str	z22, [x19]
	add	x21, x21, 240
	add	x22, x22, 368
	uzp2	z13.h, z30.h, z2.h
	add	x20, x20, 496
	addvl	x17, sp, #12
	str	z13, [x14]
	ldr	z11, [x21]
	ldr	z12, [x22]
	ldr	z23, [x20]
	addvl	x23, sp, #12
	addvl	x11, sp, #12
	zip1	z1.h, z11.h, z12.h
	addvl	x18, sp, #12
	addvl	x0, sp, #12
	addvl	x15, sp, #12
	addvl	x13, sp, #12
	addvl	x16, sp, #12
	addvl	x19, sp, #12
	addvl	x14, sp, #12
	addvl	x21, sp, #12
	addvl	x22, sp, #12
	addvl	x20, sp, #12
	add	x17, x17, 624
	ldr	z24, [x17]
	add	x23, x23, 752
	ldr	z15, [x23]
	add	x11, x11, 880
	ldr	z8, [x11]
	add	x18, x18, 1008
	ldr	z26, [x18]
	add	x0, x0, 1136
	ldr	z17, [x0]
	add	x15, x15, 1264
	ldr	z7, [x15]
	add	x13, x13, 1392
	ldr	z27, [x13]
	add	x16, x16, 1520
	ldr	z25, [x16]
	add	x19, x19, 1648
	ldr	z16, [x19]
	add	x14, x14, 1776
	ldr	z18, [x14]
	add	x21, x21, 1904
	ldr	z14, [x21]
	add	x22, x22, 2032
	ldr	z20, [x22]
	add	x20, x20, 2160
	ldr	z28, [x20]
	zip1	z9.h, z23.h, z24.h
	zip1	z0.h, z15.h, z8.h
	zip1	z5.h, z26.h, z17.h
	zip1	z4.h, z7.h, z27.h
	zip1	z3.h, z25.h, z16.h
	zip1	z2.h, z18.h, z14.h
	zip1	z6.h, z20.h, z28.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z9.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+2048
	add	x9, x10, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+2304
	add	x7, x8, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+2560
	add	x5, x6, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+2816
	add	x3, x4, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+3072
	add	x23, x17, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+3328
	add	x18, x11, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3584
	add	x15, x0, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x13, sp, #8
	adrp	x16, _ZL6CDOT_O+3840
	add	x13, x13, 128
	add	x19, x16, :lo12:_ZL6CDOT_O+3840
	str	z10, [x13]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z9.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x19, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x19, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x19, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z4.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x19, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x19, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x19, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z15.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x14, sp, #9
	addvl	x22, sp, #12
	addvl	x20, sp, #12
	addvl	x10, sp, #12
	addvl	x9, sp, #12
	addvl	x8, sp, #12
	addvl	x7, sp, #12
	addvl	x6, sp, #12
	addvl	x5, sp, #12
	add	x14, x14, 128
	str	z10, [x14]
	add	x22, x22, 304
	ldr	z13, [x22]
	add	x20, x20, 560
	ldr	z11, [x20]
	add	x10, x10, 816
	ldr	z6, [x10]
	add	x9, x9, 1072
	ldr	z12, [x9]
	add	x8, x8, 1328
	ldr	z8, [x8]
	add	x7, x7, 1584
	ldr	z7, [x7]
	add	x6, x6, 1840
	ldr	z16, [x6]
	add	x5, x5, 2096
	ldr	z14, [x5]
	adrp	x21, .LANCHOR0
	zip1	z1.h, z13.h, z11.h
	zip1	z0.h, z6.h, z12.h
	zip1	z3.h, z8.h, z7.h
	add	x4, x21, :lo12:.LANCHOR0
	zip1	z2.h, z16.h, z14.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z4.h
// 0 "" 2
#NO_APP
	add	x3, x4, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z6.h
// 0 "" 2
#NO_APP
	add	x17, x4, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z14.h
// 0 "" 2
#NO_APP
	add	x23, x4, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z13.h
// 0 "" 2
#NO_APP
	add	x11, x4, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z14.h
// 0 "" 2
#NO_APP
	add	x18, x4, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z6.h
// 0 "" 2
#NO_APP
	add	x0, x4, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z2.h, z5.h
// 0 "" 2
#NO_APP
	add	x15, x4, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x13, sp, #12
	addvl	x16, sp, #12
	addvl	x19, sp, #12
	addvl	x14, sp, #12
	add	x13, x13, 432
	ldr	z2, [x13]
	add	x16, x16, 944
	ldr	z6, [x16]
	add	x19, x19, 1456
	ldr	z16, [x19]
	add	x14, x14, 1968
	ldr	z7, [x14]
	zip1	z1.h, z2.h, z6.h
	add	x21, x4, 1024
	zip1	z0.h, z16.h, z7.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z0.h, z3.h
// 0 "" 2
#NO_APP
	add	x22, x4, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z1.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z0.h, z6.h
// 0 "" 2
#NO_APP
	add	x20, x4, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z0.h, z7.h
// 0 "" 2
#NO_APP
	add	x10, x4, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x9, sp, #12
	addvl	x8, sp, #12
	add	x9, x9, 688
	ldr	z0, [x9]
	add	x8, x8, 1712
	ldr	z2, [x8]
	add	x7, x4, 1280
	zip1	z16.h, z0.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z16.h, z3.h
// 0 "" 2
#NO_APP
	add	x6, x4, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z16.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #12
	addvl	x3, sp, #12
	add	x5, x5, 176
	ldr	z0, [x5]
	add	x3, x3, 1200
	ldr	z16, [x3]
	add	x4, x4, 1344
	zip1	z1.h, z0.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	x30, x12, x2, lsl 1
	add	z1.s, z16.s, z2.s
	addvl	x12, sp, #7
	sub	z16.s, z16.s, z2.s
	add	z2.s, z1.s, z4.s
	sub	z1.s, z1.s, z4.s
	add	z4.s, z2.s, z8.s
	sub	z8.s, z2.s, z8.s
	add	z0.s, z4.s, z17.s
	add	z2.s, z31.s, z3.s
	add	x17, sp, 128
	sub	z31.s, z31.s, z3.s
	add	x12, x12, 128
	add	z3.s, z2.s, z5.s
	addvl	x23, sp, #6
	addvl	x11, sp, #1
	str	z8, [x12]
	sub	z8.s, z2.s, z5.s
	add	z5.s, z3.s, z9.s
	sub	z9.s, z3.s, z9.s
	str	z4, [x17]
	sqrshrnb	z4.h, z0.s, #12
	add	z0.s, z5.s, z18.s
	add	z2.s, z31.s, z6.s
	sqrshrnb	z3.h, z0.s, #12
	add	x23, x23, 128
	add	x11, x11, 128
	addvl	x18, sp, #2
	str	z9, [x23]
	add	z9.s, z2.s, z10.s
	str	z5, [x11]
	sub	z5.s, z2.s, z10.s
	add	z10.s, z9.s, z19.s
	sqrshrnb	z0.h, z10.s, #12
	add	z2.s, z16.s, z7.s
	sub	z6.s, z31.s, z6.s
	sub	z7.s, z16.s, z7.s
	uzp1	z31.h, z3.h, z3.h
	add	x18, x18, 128
	uzp1	z10.h, z0.h, z0.h
	add	z0.s, z2.s, z11.s
	str	z9, [x18]
	sub	z9.s, z2.s, z11.s
	add	z11.s, z0.s, z20.s
	sub	z16.s, z7.s, z12.s
	add	z2.s, z7.s, z12.s
	sqrshrnb	z3.h, z11.s, #12
	add	z12.s, z2.s, z21.s
	uzp1	z4.h, z4.h, z4.h
	sqrshrnb	z7.h, z12.s, #12
	splice	z4.h, p0, z4.h, z31.h
	uzp1	z11.h, z7.h, z7.h
	uzp1	z31.h, z3.h, z3.h
	add	z12.s, z6.s, z13.s
	splice	z10.h, p0, z10.h, z31.h
	addvl	x0, sp, #3
	sub	z31.s, z6.s, z13.s
	add	z13.s, z12.s, z22.s
	sqrshrnb	z6.h, z13.s, #12
	uzp1	z7.h, z6.h, z6.h
	movprfx	z3, z11
	splice	z3.h, p0, z3.h, z7.h
	add	z11.s, z8.s, z14.s
	sub	z8.s, z8.s, z14.s
	add	z14.s, z11.s, z23.s
	add	x0, x0, 128
	sqrshrnb	z13.h, z14.s, #12
	add	z14.s, z1.s, z15.s
	uzp1	z6.h, z13.h, z13.h
	sub	z1.s, z1.s, z15.s
	add	z15.s, z14.s, z24.s
	sqrshrnb	z7.h, z15.s, #12
	str	z11, [x0]
	uzp1	z11.h, z7.h, z7.h
	add	z13.s, z1.s, z25.s
	movprfx	z15, z6
	splice	z15.h, p0, z15.h, z11.h
	add	z11.s, z8.s, z26.s
	sqrshrnb	z6.h, z13.s, #12
	sqrshrnb	z13.h, z11.s, #12
	uzp1	z7.h, z6.h, z6.h
	add	z11.s, z31.s, z27.s
	uzp1	z6.h, z13.h, z13.h
	addvl	x16, sp, #4
	splice	z7.h, p0, z7.h, z6.h
	addvl	x14, sp, #5
	add	z6.s, z16.s, z28.s
	sqrshrnb	z13.h, z11.s, #12
	sqrshrnb	z11.h, z6.s, #12
	add	x16, x16, 128
	uzp1	z6.h, z11.h, z11.h
	add	x14, x14, 128
	addvl	x21, sp, #6
	str	z9, [x16]
	add	z9.s, z9.s, z29.s
	sqrshrnb	z11.h, z9.s, #12
	str	z5, [x14]
	add	z5.s, z5.s, z30.s
	add	x21, x21, 128
	addvl	x22, sp, #8
	uzp1	z9.h, z11.h, z11.h
	uzp1	z13.h, z13.h, z13.h
	splice	z13.h, p0, z13.h, z6.h
	sqrshrnb	z6.h, z5.s, #12
	ldr	z5, [x21]
	uzp1	z11.h, z6.h, z6.h
	add	x22, x22, 128
	ldr	z6, [x22]
	splice	z9.h, p0, z9.h, z11.h
	addvl	x9, sp, #7
	add	z11.s, z5.s, z6.s
	addvl	x8, sp, #9
	sqrshrnb	z5.h, z11.s, #12
	add	x9, x9, 128
	add	x8, x8, 128
	ldr	z6, [x8]
	uzp1	z11.h, z5.h, z5.h
	ldr	z5, [x9]
	add	z5.s, z5.s, z6.s
	sqrshrnb	z6.h, z5.s, #12
	uzp1	z5.h, z6.h, z6.h
	splice	z11.h, p0, z11.h, z5.h
	uzp1	z5.h, z4.h, z10.h
	uzp2	z4.h, z4.h, z10.h
	uzp1	z10.h, z3.h, z15.h
	uzp2	z15.h, z3.h, z15.h
	uzp2	z6.h, z5.h, z10.h
	uzp1	z3.h, z5.h, z10.h
	uzp1	z5.h, z7.h, z13.h
	uzp2	z13.h, z7.h, z13.h
	uzp1	z7.h, z9.h, z11.h
	uzp2	z11.h, z9.h, z11.h
	uzp2	z10.h, z5.h, z7.h
	uzp1	z9.h, z5.h, z7.h
	uzp1	z5.h, z3.h, z9.h
	str	z5, [x30]
	add	x15, x30, x2, lsl 1
	uzp1	z7.h, z4.h, z15.h
	uzp2	z15.h, z4.h, z15.h
	uzp1	z4.h, z13.h, z11.h
	uzp2	z13.h, z13.h, z11.h
	uzp1	z11.h, z7.h, z4.h
	str	z11, [x15]
	add	x13, x15, x2, lsl 1
	uzp1	z5.h, z6.h, z10.h
	str	z5, [x13]
	add	x19, x13, x2, lsl 1
	uzp2	z6.h, z6.h, z10.h
	uzp1	z10.h, z15.h, z13.h
	str	z10, [x19]
	add	x20, x19, x2, lsl 1
	add	x10, x2, x2, lsl 2
	uzp2	z3.h, z3.h, z9.h
	str	z3, [x20]
	add	x7, x20, x2, lsl 1
	add	x30, x2, x2, lsl 1
	uzp2	z9.h, z7.h, z4.h
	addvl	x11, sp, #1
	addvl	x18, sp, #2
	str	z9, [x7]
	add	x6, x7, x2, lsl 1
	uzp2	z3.h, z15.h, z13.h
	add	x4, x10, x10, lsl 2
	lsl	x3, x2, 3
	add	x23, sp, 128
	ldr	z7, [x23]
	add	x11, x11, 128
	ldr	z15, [x11]
	sub	z17.s, z7.s, z17.s
	sub	z18.s, z15.s, z18.s
	sqrshrnb	z4.h, z17.s, #12
	sqrshrnb	z13.h, z18.s, #12
	uzp1	z11.h, z4.h, z4.h
	uzp1	z9.h, z13.h, z13.h
	add	x18, x18, 128
	ldr	z5, [x18]
	addvl	x0, sp, #3
	str	z6, [x6]
	add	x12, x6, x2, lsl 1
	add	x17, x1, x30, lsl 4
	add	x5, x2, x30, lsl 2
	sub	z6.s, z5.s, z19.s
	sub	x9, x3, x2
	movprfx	z19, z9
	splice	z19.h, p0, z19.h, z11.h
	add	x10, x30, x30, lsl 3
	sqrshrnb	z10.h, z6.s, #12
	sub	z22.s, z12.s, z22.s
	sub	z28.s, z16.s, z28.s
	sqrshrnb	z7.h, z22.s, #12
	sqrshrnb	z9.h, z28.s, #12
	add	x0, x0, 128
	ldr	z12, [x0]
	addvl	x15, sp, #4
	sub	z23.s, z12.s, z23.s
	addvl	x13, sp, #5
	sqrshrnb	z18.h, z23.s, #12
	addvl	x16, sp, #6
	uzp1	z13.h, z18.h, z18.h
	addvl	x19, sp, #8
	addvl	x14, sp, #7
	addvl	x21, sp, #9
	sub	z20.s, z0.s, z20.s
	sub	z21.s, z2.s, z21.s
	sqrshrnb	z0.h, z20.s, #12
	sqrshrnb	z2.h, z21.s, #12
	sub	z24.s, z14.s, z24.s
	uzp1	z15.h, z2.h, z2.h
	sqrshrnb	z14.h, z24.s, #12
	sub	z25.s, z1.s, z25.s
	sub	z26.s, z8.s, z26.s
	sqrshrnb	z1.h, z25.s, #12
	sqrshrnb	z8.h, z26.s, #12
	uzp1	z11.h, z1.h, z1.h
	sub	z27.s, z31.s, z27.s
	sqrshrnb	z31.h, z27.s, #12
	uzp1	z5.h, z31.h, z31.h
	str	z3, [x12]
	uzp1	z3.h, z10.h, z10.h
	add	x20, x1, x4, lsl 1
	add	x22, x17, 32
	uzp1	z17.h, z0.h, z0.h
	add	x15, x15, 128
	ldr	z16, [x15]
	splice	z17.h, p0, z17.h, z3.h
	sub	z29.s, z16.s, z29.s
	add	x13, x13, 128
	ldr	z21, [x13]
	sqrshrnb	z6.h, z29.s, #12
	sub	z30.s, z21.s, z30.s
	uzp1	z0.h, z6.h, z6.h
	sqrshrnb	z12.h, z30.s, #12
	add	x16, x16, 128
	ldr	z2, [x16]
	add	x19, x19, 128
	add	x14, x14, 128
	uzp1	z4.h, z7.h, z7.h
	add	x21, x21, 128
	ldr	z24, [x21]
	splice	z4.h, p0, z4.h, z15.h
	ldr	z15, [x19]
	uzp1	z10.h, z14.h, z14.h
	sub	z22.s, z2.s, z15.s
	splice	z10.h, p0, z10.h, z13.h
	ldr	z13, [x14]
	sqrshrnb	z23.h, z22.s, #12
	sub	z25.s, z13.s, z24.s
	uzp1	z20.h, z8.h, z8.h
	sqrshrnb	z14.h, z25.s, #12
	splice	z20.h, p0, z20.h, z11.h
	uzp1	z3.h, z9.h, z9.h
	uzp1	z11.h, z10.h, z4.h
	splice	z3.h, p0, z3.h, z5.h
	uzp1	z7.h, z12.h, z12.h
	uzp1	z1.h, z3.h, z20.h
	uzp1	z5.h, z17.h, z19.h
	splice	z7.h, p0, z7.h, z0.h
	uzp1	z9.h, z11.h, z5.h
	uzp1	z18.h, z23.h, z23.h
	uzp1	z8.h, z14.h, z14.h
	splice	z8.h, p0, z8.h, z18.h
	uzp1	z28.h, z8.h, z7.h
	uzp1	z26.h, z28.h, z1.h
	uzp1	z27.h, z26.h, z9.h
	str	z27, [x22]
	add	x7, x1, x5, lsl 2
	uzp2	z31.h, z8.h, z7.h
	uzp2	z20.h, z3.h, z20.h
	uzp2	z19.h, z17.h, z19.h
	add	x8, x20, 32
	add	x4, x1, x10, lsl 1
	add	x6, x2, x9, lsl 2
	uzp2	z4.h, z10.h, z4.h
	lsl	x12, x2, 4
	uzp1	z10.h, z4.h, z19.h
	uzp1	z17.h, z31.h, z20.h
	uzp1	z16.h, z17.h, z10.h
	str	z16, [x8]
	uzp2	z29.h, z11.h, z5.h
	add	x30, x7, 32
	add	x3, x1, x9, lsl 3
	uzp2	z6.h, z28.h, z1.h
	sub	x5, x12, x2
	uzp2	z0.h, z31.h, z20.h
	uzp2	z21.h, z4.h, z19.h
	add	x17, x4, 32
	lsl	x23, x2, 5
	uzp1	z3.h, z6.h, z29.h
	uzp1	z30.h, z0.h, z21.h
	str	z3, [x30]
	str	z30, [x17]
	add	x18, x1, x6, lsl 1
	sub	x2, x23, x2
	uzp2	z2.h, z26.h, z9.h
	add	x11, x3, 32
	str	z2, [x11]
	uzp2	z15.h, z17.h, z10.h
	add	x15, x1, x5, lsl 2
	add	x0, x18, 32
	str	z15, [x0]
	add	x13, x15, 32
	add	x1, x1, x2, lsl 1
	uzp2	z22.h, z6.h, z29.h
	str	z22, [x13]
	uzp2	z12.h, z0.h, z21.h
	add	x16, x1, 32
	str	z12, [x16]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	d8, d9, [sp, 64]
	ldp	d10, d11, [sp, 80]
	ldp	d12, d13, [sp, 96]
	ldp	d14, d15, [sp, 112]
	.cfi_restore 23
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
	addvl	sp, sp, #12
	.cfi_def_cfa_offset 2176
	add	sp, sp, 2176
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
