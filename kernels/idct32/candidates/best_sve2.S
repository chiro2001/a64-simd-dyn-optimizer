	.arch armv9.4-a+crc
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_idct32_sve2_shared
	.type	dynopt_idct32_sve2_shared, %function
dynopt_idct32_sve2_shared:
.LFB6:
	.cfi_startproc
	addvl	sp, sp, #-9
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x48,0x1e,0x22
	add	x4, x0, 192
	ptrue	p7.h, all
	sub	sp, sp, #2192
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0x48,0x1e,0x23,0x90,0x11,0x22
	add	x6, x0, 448
	add	x10, x0, 960
	add	x3, x0, 64
	add	x5, x0, 320
	add	x7, x0, 576
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	add	x8, x0, 704
	add	x9, x0, 832
	add	x11, x0, 1088
	stp	x19, x20, [sp, 16]
	add	x12, x0, 1216
	add	x13, x0, 1344
	stp	x21, x22, [sp, 32]
	add	x14, x0, 1472
	add	x15, x0, 1600
	stp	x23, x24, [sp, 48]
	add	x16, x0, 1728
	add	x17, x0, 1856
	stp	x25, x26, [sp, 64]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x16,0x2,0x8f,0x28
	.cfi_escape 0x10,0x17,0x2,0x8f,0x30
	.cfi_escape 0x10,0x18,0x2,0x8f,0x38
	.cfi_escape 0x10,0x19,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x1a,0x3,0x8f,0xc8,0
	add	x19, x0, 1984
	adrp	x18, _ZL6CDOT_O
	stp	d8, d9, [sp, 80]
	add	x23, x18, :lo12:_ZL6CDOT_O
	stp	d10, d11, [sp, 96]
	stp	d12, d13, [sp, 112]
	stp	d14, d15, [sp, 128]
	.cfi_escape 0x10,0x48,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x49,0x3,0x8f,0xd8,0
	.cfi_escape 0x10,0x4a,0x3,0x8f,0xe0,0
	.cfi_escape 0x10,0x4b,0x3,0x8f,0xe8,0
	.cfi_escape 0x10,0x4c,0x3,0x8f,0xf0,0
	.cfi_escape 0x10,0x4d,0x3,0x8f,0xf8,0
	.cfi_escape 0x10,0x4e,0x3,0x8f,0x80,0x1
	.cfi_escape 0x10,0x4f,0x3,0x8f,0x88,0x1
	ldr	z31, [x4]
	ldr	z1, [x6]
	ldr	z5, [x10]
	ldr	z11, [x3]
	ldr	z12, [x5]
	ldr	z13, [x7]
	ldr	z2, [x8]
	ldr	z14, [x9]
	ldr	z15, [x11]
	ldr	z7, [x12]
	ldr	z16, [x13]
	ldr	z9, [x14]
	ldr	z17, [x15]
	ldr	z30, [x16]
	ldr	z10, [x17]
	ldr	z18, [x19]
	zip1	z0.h, z11.h, z31.h
	zip1	z3.h, z12.h, z1.h
	zip1	z6.h, z14.h, z5.h
	zip1	z4.h, z13.h, z2.h
	zip1	z8.h, z15.h, z7.h
	zip1	z1.h, z16.h, z9.h
	zip1	z5.h, z17.h, z30.h
	zip1	z31.h, z10.h, z18.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d29, #0
	mov	z2.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z3.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z4.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z6.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z8.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z1.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z5.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z31.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+256
	add	x24, x20, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z31.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x21, sp, #5
	adrp	x22, _ZL6CDOT_O+512
	add	x21, x21, 144
	add	x25, x22, :lo12:_ZL6CDOT_O+512
	str	z27, [x21]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z31.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x26, sp, #6
	adrp	x30, _ZL6CDOT_O+768
	add	x26, x26, 144
	add	x15, x30, :lo12:_ZL6CDOT_O+768
	str	z27, [x26]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z31.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	adrp	x4, _ZL6CDOT_O+1024
	add	x3, x3, 144
	add	x14, x4, :lo12:_ZL6CDOT_O+1024
	str	z26, [x3]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z8.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z31.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+1280
	add	x13, x5, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z31.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+1536
	add	x12, x6, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z31.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+1792
	add	x11, x7, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z31.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+2048
	add	x10, x8, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z31.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+2304
	add	x16, x9, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z31.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+2560
	add	x18, x17, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z8.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z31.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x19, _ZL6CDOT_O+2816
	add	x26, x19, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z8.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z31.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+3072
	add	x30, x20, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z8.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z31.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x21, _ZL6CDOT_O+3328
	add	x5, x21, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z31.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+3584
	add	x22, x4, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z8.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z18.h
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
	sdot z19.s, z31.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3840
	add	x6, x3, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z31.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x7, .LANCHOR0
	add	x8, x0, 128
	ldr	z15, [x8]
	add	x9, x0, 384
	ldr	z31, [x9]
	add	x17, x0, 640
	ldr	z14, [x17]
	add	x20, x0, 896
	ldr	z7, [x20]
	add	x19, x0, 1152
	ldr	z16, [x19]
	add	x21, x0, 1408
	ldr	z9, [x21]
	add	x22, x0, 1664
	ldr	z10, [x22]
	add	x6, x0, 1920
	ldr	z17, [x6]
	zip1	z13.h, z15.h, z31.h
	zip1	z0.h, z14.h, z7.h
	zip1	z3.h, z16.h, z9.h
	add	x3, x7, :lo12:.LANCHOR0
	zip1	z4.h, z10.h, z17.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z13.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z4.h, z8.h
// 0 "" 2
#NO_APP
	add	x7, x3, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z31.h
// 0 "" 2
#NO_APP
	add	x8, x3, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z13.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z4.h, z10.h
// 0 "" 2
#NO_APP
	add	x9, x3, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z13.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z4.h, z5.h
// 0 "" 2
#NO_APP
	add	x17, x3, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z13.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z0.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z4.h, z7.h
// 0 "" 2
#NO_APP
	add	x20, x3, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x20, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x20, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z4.h, z1.h
// 0 "" 2
#NO_APP
	add	x19, x3, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z13.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x19, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x19, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z4.h, z14.h
// 0 "" 2
#NO_APP
	add	x21, x3, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z13.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x21, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x21, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x21, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z4.h, z3.h
// 0 "" 2
#NO_APP
	add	x22, x0, 256
	ldr	z4, [x22]
	add	x6, x0, 768
	ldr	z1, [x6]
	add	x7, x0, 1280
	ldr	z5, [x7]
	add	x8, x0, 1792
	ldr	z31, [x8]
	zip1	z15.h, z4.h, z1.h
	add	x9, x3, 1024
	zip1	z13.h, z5.h, z31.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z15.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z13.h, z0.h
// 0 "" 2
#NO_APP
	add	x17, x3, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z15.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z13.h, z1.h
// 0 "" 2
#NO_APP
	add	x20, x3, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z13.h, z31.h
// 0 "" 2
#NO_APP
	add	x19, x3, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x21, x0, 512
	ldr	z13, [x21]
	add	x22, x0, 1536
	ldr	z0, [x22]
	add	x6, x3, 1280
	zip1	z31.h, z13.h, z0.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z31.h, z1.h
// 0 "" 2
#NO_APP
	add	x7, x3, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z1.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z31.h, z14.h
// 0 "" 2
#NO_APP
	ldr	z13, [x0]
	add	x8, x0, 1024
	ldr	z15, [x8]
	add	x9, x3, 1344
	zip1	z31.h, z13.h, z15.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z31.h, z13.h
// 0 "" 2
#NO_APP
	add	x3, x3, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z31.h, z13.h
// 0 "" 2
#NO_APP
	add	z13.s, z14.s, z0.s
	add	x20, sp, 144
	add	z31.s, z13.s, z6.s
	addvl	x21, sp, #9
	addvl	x19, sp, #1
	str	z31, [x20]
	addvl	x6, sp, #4
	add	z31.s, z31.s, z16.s
	add	x21, x21, 144
	add	x19, x19, 144
	add	x6, x6, 144
	str	z31, [x19]
	str	z2, [x6]
	add	z2.s, z31.s, z2.s
	sqrshrnb	z31.h, z2.s, #7
	mov	w17, 8
	mov	w22, 32
	whilelo	p6.s, wzr, w17
	uzp1	z2.h, z31.h, z31.h
	index	z31.s, #0, w22
	sunpklo	z2.s, z2.h
	st1h	z2.s, p6, [x21, z31.s, sxtw 1]
	addvl	x21, sp, #5
	add	z2.s, z15.s, z1.s
	sub	z14.s, z14.s, z0.s
	addvl	x9, sp, #3
	sub	z0.s, z15.s, z1.s
	addvl	x3, sp, #2
	add	x21, x21, 144
	ldr	z1, [x21]
	addvl	x7, sp, #9
	add	x9, x9, 144
	str	z0, [x9]
	add	x3, x3, 144
	add	z0.s, z2.s, z4.s
	addvl	x6, sp, #6
	add	z15.s, z0.s, z17.s
	str	z15, [x3]
	add	z15.s, z15.s, z1.s
	sqrshrnb	z1.h, z15.s, #7
	sub	z2.s, z2.s, z4.s
	add	x7, x7, 146
	addvl	x8, sp, #9
	addvl	x19, sp, #3
	uzp1	z15.h, z1.h, z1.h
	add	x6, x6, 144
	sunpklo	z1.s, z15.h
	st1h	z1.s, p6, [x7, z31.s, sxtw 1]
	ldr	z4, [x6]
	add	x19, x19, 144
	ldr	z15, [x19]
	add	x8, x8, 148
	add	z1.s, z15.s, z3.s
	sub	z15.s, z15.s, z3.s
	add	z3.s, z1.s, z12.s
	str	z3, [x19]
	add	z3.s, z3.s, z4.s
	sqrshrnb	z4.h, z3.s, #7
	uzp1	z3.h, z4.h, z4.h
	sub	z13.s, z13.s, z6.s
	sunpklo	z4.s, z3.h
	st1h	z4.s, p6, [x8, z31.s, sxtw 1]
	addvl	x8, sp, #7
	add	x8, x8, 144
	ldr	z6, [x8]
	add	z4.s, z14.s, z5.s
	sub	z14.s, z14.s, z5.s
	add	z3.s, z4.s, z11.s
	add	z5.s, z3.s, z6.s
	sqrshrnb	z6.h, z5.s, #7
	addvl	x17, sp, #9
	uzp1	z5.h, z6.h, z6.h
	sunpklo	z6.s, z5.h
	add	x17, x17, 150
	addvl	x20, sp, #9
	st1h	z6.s, p6, [x17, z31.s, sxtw 1]
	add	z6.s, z14.s, z9.s
	add	z5.s, z6.s, z30.s
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x20, x20, 152
	addvl	x22, sp, #9
	st1h	z5.s, p6, [x20, z31.s, sxtw 1]
	add	z5.s, z15.s, z7.s
	sub	z15.s, z15.s, z7.s
	add	z7.s, z5.s, z28.s
	sqrshrnb	z7.h, z7.s, #7
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	sub	z14.s, z14.s, z9.s
	add	x22, x22, 154
	add	z9.s, z13.s, z10.s
	st1h	z7.s, p6, [x22, z31.s, sxtw 1]
	sub	z13.s, z13.s, z10.s
	add	z7.s, z2.s, z8.s
	add	z10.s, z9.s, z26.s
	sub	z2.s, z2.s, z8.s
	addvl	x7, sp, #9
	add	z8.s, z7.s, z27.s
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	add	x7, x7, 156
	st1h	z8.s, p6, [x7, z31.s, sxtw 1]
	sqrshrnb	z8.h, z10.s, #7
	uzp1	z10.h, z8.h, z8.h
	addvl	x9, sp, #9
	sunpklo	z8.s, z10.h
	add	z10.s, z13.s, z25.s
	add	x9, x9, 158
	addvl	x17, sp, #9
	st1h	z8.s, p6, [x9, z31.s, sxtw 1]
	sqrshrnb	z8.h, z10.s, #7
	uzp1	z10.h, z8.h, z8.h
	sub	z4.s, z4.s, z11.s
	sunpklo	z8.s, z10.h
	add	z11.s, z2.s, z24.s
	add	x17, x17, 160
	sqrshrnb	z10.h, z11.s, #7
	st1h	z8.s, p6, [x17, z31.s, sxtw 1]
	addvl	x21, sp, #9
	uzp1	z8.h, z10.h, z10.h
	add	x21, x21, 162
	add	z10.s, z15.s, z23.s
	sunpklo	z11.s, z8.h
	addvl	x3, sp, #9
	st1h	z11.s, p6, [x21, z31.s, sxtw 1]
	sqrshrnb	z8.h, z10.s, #7
	add	x3, x3, 164
	uzp1	z11.h, z8.h, z8.h
	addvl	x20, sp, #9
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x3, z31.s, sxtw 1]
	sub	z1.s, z1.s, z12.s
	add	x20, x20, 166
	add	z12.s, z14.s, z22.s
	addvl	x19, sp, #9
	sqrshrnb	z8.h, z12.s, #7
	uzp1	z11.h, z8.h, z8.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x20, z31.s, sxtw 1]
	add	z12.s, z4.s, z21.s
	add	x19, x19, 168
	sqrshrnb	z8.h, z12.s, #7
	addvl	x22, sp, #9
	uzp1	z11.h, z8.h, z8.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x19, z31.s, sxtw 1]
	add	z12.s, z1.s, z20.s
	add	x22, x22, 170
	sqrshrnb	z8.h, z12.s, #7
	addvl	x6, sp, #9
	uzp1	z11.h, z8.h, z8.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x22, z31.s, sxtw 1]
	sub	z17.s, z0.s, z17.s
	add	x6, x6, 172
	add	z0.s, z17.s, z19.s
	addvl	x8, sp, #9
	sqrshrnb	z12.h, z0.s, #7
	uzp1	z8.h, z12.h, z12.h
	sunpklo	z11.s, z8.h
	st1h	z11.s, p6, [x6, z31.s, sxtw 1]
	add	x7, sp, 144
	ldr	z10, [x7]
	add	x8, x8, 174
	sub	z16.s, z10.s, z16.s
	addvl	x9, sp, #9
	add	z0.s, z16.s, z18.s
	sqrshrnb	z12.h, z0.s, #7
	uzp1	z8.h, z12.h, z12.h
	sunpklo	z11.s, z8.h
	st1h	z11.s, p6, [x8, z31.s, sxtw 1]
	sub	z18.s, z16.s, z18.s
	add	x9, x9, 176
	sqrshrnb	z10.h, z18.s, #7
	addvl	x17, sp, #9
	uzp1	z16.h, z10.h, z10.h
	sunpklo	z0.s, z16.h
	st1h	z0.s, p6, [x9, z31.s, sxtw 1]
	add	x17, x17, 178
	addvl	x21, sp, #9
	sub	z19.s, z17.s, z19.s
	sqrshrnb	z17.h, z19.s, #7
	uzp1	z12.h, z17.h, z17.h
	sunpklo	z8.s, z12.h
	st1h	z8.s, p6, [x17, z31.s, sxtw 1]
	add	x21, x21, 180
	addvl	x3, sp, #9
	sub	z20.s, z1.s, z20.s
	sqrshrnb	z1.h, z20.s, #7
	uzp1	z11.h, z1.h, z1.h
	sunpklo	z18.s, z11.h
	st1h	z18.s, p6, [x21, z31.s, sxtw 1]
	add	x3, x3, 182
	addvl	x20, sp, #9
	sub	z21.s, z4.s, z21.s
	sqrshrnb	z4.h, z21.s, #7
	uzp1	z10.h, z4.h, z4.h
	sunpklo	z16.s, z10.h
	st1h	z16.s, p6, [x3, z31.s, sxtw 1]
	add	x20, x20, 184
	addvl	x19, sp, #9
	addvl	x22, sp, #9
	sub	z22.s, z14.s, z22.s
	sqrshrnb	z14.h, z22.s, #7
	uzp1	z0.h, z14.h, z14.h
	sunpklo	z19.s, z0.h
	st1h	z19.s, p6, [x20, z31.s, sxtw 1]
	add	x19, x19, 186
	add	x22, x22, 188
	sub	z23.s, z15.s, z23.s
	addvl	x6, sp, #9
	sqrshrnb	z15.h, z23.s, #7
	sub	z24.s, z2.s, z24.s
	uzp1	z17.h, z15.h, z15.h
	sqrshrnb	z2.h, z24.s, #7
	sunpklo	z12.s, z17.h
	uzp1	z8.h, z2.h, z2.h
	st1h	z12.s, p6, [x19, z31.s, sxtw 1]
	sunpklo	z20.s, z8.h
	st1h	z20.s, p6, [x22, z31.s, sxtw 1]
	add	x6, x6, 190
	addvl	x7, sp, #9
	sub	z25.s, z13.s, z25.s
	sqrshrnb	z13.h, z25.s, #7
	uzp1	z1.h, z13.h, z13.h
	sunpklo	z11.s, z1.h
	st1h	z11.s, p6, [x6, z31.s, sxtw 1]
	add	x7, x7, 192
	addvl	x8, sp, #9
	sub	z26.s, z9.s, z26.s
	sqrshrnb	z9.h, z26.s, #7
	uzp1	z18.h, z9.h, z9.h
	sunpklo	z21.s, z18.h
	st1h	z21.s, p6, [x7, z31.s, sxtw 1]
	add	x8, x8, 194
	addvl	x9, sp, #9
	sub	z27.s, z7.s, z27.s
	sqrshrnb	z7.h, z27.s, #7
	uzp1	z4.h, z7.h, z7.h
	sunpklo	z10.s, z4.h
	st1h	z10.s, p6, [x8, z31.s, sxtw 1]
	add	x9, x9, 196
	addvl	x17, sp, #9
	sub	z28.s, z5.s, z28.s
	sqrshrnb	z5.h, z28.s, #7
	uzp1	z16.h, z5.h, z5.h
	sunpklo	z22.s, z16.h
	st1h	z22.s, p6, [x9, z31.s, sxtw 1]
	add	x17, x17, 198
	addvl	x21, sp, #7
	addvl	x3, sp, #9
	sub	z30.s, z6.s, z30.s
	addvl	x19, sp, #6
	sqrshrnb	z6.h, z30.s, #7
	uzp1	z14.h, z6.h, z6.h
	sunpklo	z0.s, z14.h
	st1h	z0.s, p6, [x17, z31.s, sxtw 1]
	add	x21, x21, 144
	ldr	z19, [x21]
	add	x3, x3, 200
	sub	z3.s, z3.s, z19.s
	addvl	x20, sp, #3
	sqrshrnb	z23.h, z3.s, #7
	add	x19, x19, 144
	uzp1	z15.h, z23.h, z23.h
	addvl	x22, sp, #9
	sunpklo	z17.s, z15.h
	addvl	x6, sp, #2
	st1h	z17.s, p6, [x3, z31.s, sxtw 1]
	addvl	x7, sp, #5
	ldr	z24, [x19]
	add	x20, x20, 144
	ldr	z12, [x20]
	add	x22, x22, 202
	sub	z2.s, z12.s, z24.s
	add	x6, x6, 144
	sqrshrnb	z8.h, z2.s, #7
	add	x7, x7, 144
	uzp1	z20.h, z8.h, z8.h
	addvl	x8, sp, #9
	sunpklo	z25.s, z20.h
	addvl	x9, sp, #1
	st1h	z25.s, p6, [x22, z31.s, sxtw 1]
	addvl	x17, sp, #4
	addvl	x19, sp, #9
	ldr	z1, [x7]
	ldr	z13, [x6]
	add	x3, x0, 80
	sub	z11.s, z13.s, z1.s
	add	x21, x0, 208
	add	x20, x0, 336
	add	x22, x0, 464
	add	x6, x0, 592
	sqrshrnb	z26.h, z11.s, #7
	add	x7, x0, 720
	uzp1	z9.h, z26.h, z26.h
	add	x8, x8, 204
	sunpklo	z18.s, z9.h
	add	x9, x9, 144
	st1h	z18.s, p6, [x8, z31.s, sxtw 1]
	ldr	z21, [x9]
	add	x17, x17, 144
	ldr	z27, [x17]
	add	x19, x19, 206
	sub	z7.s, z21.s, z27.s
	sqrshrnb	z4.h, z7.s, #7
	add	x8, x0, 848
	uzp1	z10.h, z4.h, z4.h
	add	x9, x0, 976
	add	x17, x0, 1104
	sunpklo	z28.s, z10.h
	st1h	z28.s, p6, [x19, z31.s, sxtw 1]
	ldr	z5, [x3]
	ldr	z31, [x21]
	ldr	z16, [x20]
	ldr	z22, [x22]
	ldr	z30, [x6]
	ldr	z19, [x7]
	ldr	z14, [x8]
	ldr	z23, [x9]
	ldr	z15, [x17]
	add	x19, x0, 1232
	ldr	z17, [x19]
	add	x3, x0, 1360
	ldr	z12, [x3]
	add	x21, x0, 1488
	ldr	z24, [x21]
	add	x20, x0, 1616
	ldr	z2, [x20]
	add	x22, x0, 1744
	ldr	z20, [x22]
	add	x6, x0, 1872
	ldr	z25, [x6]
	add	x7, x0, 2000
	ldr	z13, [x7]
	zip1	z6.h, z5.h, z31.h
	zip1	z0.h, z16.h, z22.h
	zip1	z3.h, z30.h, z19.h
	zip1	z8.h, z14.h, z23.h
	zip1	z1.h, z15.h, z17.h
	zip1	z9.h, z12.h, z24.h
	zip1	z7.h, z2.h, z20.h
	zip1	z4.h, z25.h, z13.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z0.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z3.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z8.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z1.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z7.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z4.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z0.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z8.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z9.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z7.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z4.h, z17.h
// 0 "" 2
#NO_APP
	addvl	x23, sp, #6
	add	x23, x23, 144
	str	z16, [x23]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x24, sp, #7
	add	x24, x24, 144
	str	z26, [x24]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x25, sp, #8
	add	x25, x25, 144
	str	z25, [x25]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z7.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z7.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z8.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x16, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x16, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z7.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x16, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x18, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x18, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x18, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x18, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x18, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z7.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x18, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z7.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z8.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z8.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z30.h
// 0 "" 2
#NO_APP
	add	x26, x4, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z7.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x15, _ZL6CDOT_O+3840
	add	x30, x15, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z8.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z7.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z7.h
// 0 "" 2
#NO_APP
	adrp	x4, .LANCHOR0
	add	x14, x0, 144
	ldr	z4, [x14]
	add	x13, x0, 400
	ldr	z16, [x13]
	add	x12, x0, 656
	ldr	z14, [x12]
	add	x11, x0, 912
	ldr	z15, [x11]
	add	x10, x0, 1168
	ldr	z30, [x10]
	add	x16, x0, 1424
	ldr	z12, [x16]
	add	x18, x0, 1680
	ldr	z11, [x18]
	add	x5, x0, 1936
	ldr	z10, [x5]
	zip1	z13.h, z4.h, z16.h
	zip1	z5.h, z14.h, z15.h
	zip1	z0.h, z30.h, z12.h
	add	x3, x4, :lo12:.LANCHOR0
	zip1	z31.h, z11.h, z10.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z13.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z31.h, z1.h
// 0 "" 2
#NO_APP
	add	x13, x3, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z13.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z31.h, z14.h
// 0 "" 2
#NO_APP
	add	x12, x3, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z13.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z31.h, z6.h
// 0 "" 2
#NO_APP
	add	x11, x3, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z13.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z5.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z31.h, z9.h
// 0 "" 2
#NO_APP
	add	x10, x3, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z13.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z5.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z31.h, z30.h
// 0 "" 2
#NO_APP
	add	x9, x3, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z13.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z0.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z31.h, z9.h
// 0 "" 2
#NO_APP
	add	x8, x3, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z31.h, z12.h
// 0 "" 2
#NO_APP
	add	x7, x3, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z13.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z31.h, z0.h
// 0 "" 2
#NO_APP
	add	x17, x0, 272
	ldr	z1, [x17]
	add	x19, x0, 784
	ldr	z31, [x19]
	add	x21, x0, 1296
	ldr	z4, [x21]
	add	x20, x0, 1808
	ldr	z30, [x20]
	zip1	z14.h, z1.h, z31.h
	add	x17, x3, 1024
	zip1	z12.h, z4.h, z30.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z13.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z14.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z12.h, z0.h
// 0 "" 2
#NO_APP
	add	x15, x3, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	add	x14, x3, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z14.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z12.h, z14.h
// 0 "" 2
#NO_APP
	add	x22, x0, 528
	ldr	z12, [x22]
	add	x6, x0, 1552
	ldr	z0, [x6]
	add	x21, x3, 1280
	zip1	z30.h, z12.h, z0.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z30.h, z1.h
// 0 "" 2
#NO_APP
	add	x20, x3, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z1.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z30.h, z13.h
// 0 "" 2
#NO_APP
	add	x23, x0, 16
	ldr	z12, [x23]
	add	x24, x0, 1040
	ldr	z14, [x24]
	add	x19, x3, 1344
	zip1	z30.h, z12.h, z14.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	add	x18, x3, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x22, sp, #1
	addvl	x23, sp, #5
	add	z30.s, z13.s, z0.s
	add	x22, x22, 144
	add	z12.s, z30.s, z29.s
	addvl	x6, sp, #2
	add	x23, x23, 144
	str	z12, [x22]
	add	z12.s, z12.s, z15.s
	str	z2, [x23]
	add	z2.s, z12.s, z2.s
	add	x4, sp, 144
	addvl	x5, sp, #9
	add	x6, x6, 144
	str	z30, [x4]
	addvl	x22, sp, #6
	str	z12, [x6]
	sqrshrnb	z12.h, z2.s, #7
	uzp1	z2.h, z12.h, z12.h
	add	x5, x5, 656
	sunpklo	z12.s, z2.h
	addvl	x24, sp, #3
	add	z2.s, z14.s, z1.s
	add	x22, x22, 144
	sub	z14.s, z14.s, z1.s
	mov	w25, 32
	index	z30.s, #0, w25
	st1h	z12.s, p6, [x5, z30.s, sxtw 1]
	ldr	z1, [x22]
	sub	z13.s, z13.s, z0.s
	add	x24, x24, 144
	add	z0.s, z2.s, z4.s
	add	z12.s, z0.s, z16.s
	str	z12, [x24]
	add	z12.s, z12.s, z1.s
	sqrshrnb	z1.h, z12.s, #7
	addvl	x25, sp, #9
	addvl	x6, sp, #4
	uzp1	z12.h, z1.h, z1.h
	addvl	x24, sp, #7
	sunpklo	z1.s, z12.h
	sub	z2.s, z2.s, z4.s
	add	x25, x25, 658
	add	x6, x6, 144
	st1h	z1.s, p6, [x25, z30.s, sxtw 1]
	add	x24, x24, 144
	ldr	z4, [x24]
	add	z1.s, z14.s, z3.s
	sub	z14.s, z14.s, z3.s
	add	z3.s, z1.s, z11.s
	add	z12.s, z3.s, z4.s
	addvl	x5, sp, #9
	str	z3, [x6]
	sqrshrnb	z3.h, z12.s, #7
	addvl	x6, sp, #8
	uzp1	z4.h, z3.h, z3.h
	sunpklo	z12.s, z4.h
	add	x22, sp, 144
	add	z4.s, z13.s, z5.s
	add	x5, x5, 660
	sub	z13.s, z13.s, z5.s
	st1h	z12.s, p6, [x5, z30.s, sxtw 1]
	ldr	z5, [x22]
	add	x6, x6, 144
	sub	z12.s, z5.s, z29.s
	ldr	z29, [x6]
	add	z3.s, z4.s, z10.s
	add	z5.s, z3.s, z29.s
	sqrshrnb	z29.h, z5.s, #7
	addvl	x4, sp, #9
	uzp1	z5.h, z29.h, z29.h
	sunpklo	z29.s, z5.h
	add	x4, x4, 662
	addvl	x23, sp, #9
	st1h	z29.s, p6, [x4, z30.s, sxtw 1]
	add	z29.s, z13.s, z8.s
	add	z5.s, z29.s, z28.s
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x23, x23, 664
	addvl	x25, sp, #9
	st1h	z5.s, p6, [x23, z30.s, sxtw 1]
	add	z5.s, z14.s, z6.s
	sub	z14.s, z14.s, z6.s
	add	z6.s, z5.s, z27.s
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	sub	z13.s, z13.s, z8.s
	add	x25, x25, 666
	add	z8.s, z12.s, z9.s
	st1h	z6.s, p6, [x25, z30.s, sxtw 1]
	sub	z12.s, z12.s, z9.s
	add	z6.s, z2.s, z7.s
	add	z9.s, z8.s, z25.s
	sub	z2.s, z2.s, z7.s
	addvl	x5, sp, #9
	add	z7.s, z6.s, z26.s
	sqrshrnb	z7.h, z7.s, #7
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	add	x5, x5, 668
	st1h	z7.s, p6, [x5, z30.s, sxtw 1]
	sqrshrnb	z7.h, z9.s, #7
	uzp1	z9.h, z7.h, z7.h
	addvl	x4, sp, #9
	sunpklo	z7.s, z9.h
	add	z9.s, z12.s, z24.s
	add	x4, x4, 670
	addvl	x24, sp, #9
	st1h	z7.s, p6, [x4, z30.s, sxtw 1]
	sqrshrnb	z7.h, z9.s, #7
	uzp1	z9.h, z7.h, z7.h
	sub	z4.s, z4.s, z10.s
	sunpklo	z7.s, z9.h
	add	z10.s, z2.s, z23.s
	add	x24, x24, 672
	sqrshrnb	z9.h, z10.s, #7
	st1h	z7.s, p6, [x24, z30.s, sxtw 1]
	addvl	x23, sp, #9
	uzp1	z7.h, z9.h, z9.h
	addvl	x25, sp, #9
	add	z9.s, z14.s, z22.s
	sunpklo	z10.s, z7.h
	add	x23, x23, 674
	st1h	z10.s, p6, [x23, z30.s, sxtw 1]
	sqrshrnb	z7.h, z9.s, #7
	add	x25, x25, 676
	uzp1	z10.h, z7.h, z7.h
	addvl	x5, sp, #9
	sunpklo	z9.s, z10.h
	st1h	z9.s, p6, [x25, z30.s, sxtw 1]
	sub	z1.s, z1.s, z11.s
	add	x5, x5, 678
	add	z11.s, z13.s, z21.s
	addvl	x22, sp, #9
	sqrshrnb	z7.h, z11.s, #7
	uzp1	z10.h, z7.h, z7.h
	sunpklo	z9.s, z10.h
	st1h	z9.s, p6, [x5, z30.s, sxtw 1]
	add	z11.s, z4.s, z20.s
	add	x22, x22, 680
	sqrshrnb	z7.h, z11.s, #7
	addvl	x6, sp, #9
	uzp1	z10.h, z7.h, z7.h
	sunpklo	z9.s, z10.h
	st1h	z9.s, p6, [x22, z30.s, sxtw 1]
	add	z11.s, z1.s, z19.s
	add	x6, x6, 682
	sqrshrnb	z7.h, z11.s, #7
	addvl	x4, sp, #9
	uzp1	z10.h, z7.h, z7.h
	sunpklo	z9.s, z10.h
	st1h	z9.s, p6, [x6, z30.s, sxtw 1]
	sub	z16.s, z0.s, z16.s
	add	x4, x4, 684
	add	z0.s, z16.s, z18.s
	addvl	x24, sp, #1
	sqrshrnb	z11.h, z0.s, #7
	addvl	x23, sp, #9
	uzp1	z7.h, z11.h, z11.h
	sunpklo	z10.s, z7.h
	st1h	z10.s, p6, [x4, z30.s, sxtw 1]
	add	x24, x24, 144
	ldr	z9, [x24]
	add	x23, x23, 686
	sub	z15.s, z9.s, z15.s
	addvl	x25, sp, #9
	add	z0.s, z15.s, z17.s
	sqrshrnb	z11.h, z0.s, #7
	uzp1	z7.h, z11.h, z11.h
	sunpklo	z10.s, z7.h
	st1h	z10.s, p6, [x23, z30.s, sxtw 1]
	sub	z17.s, z15.s, z17.s
	add	x25, x25, 688
	sqrshrnb	z9.h, z17.s, #7
	addvl	x5, sp, #9
	uzp1	z15.h, z9.h, z9.h
	sunpklo	z0.s, z15.h
	st1h	z0.s, p6, [x25, z30.s, sxtw 1]
	add	x5, x5, 690
	addvl	x22, sp, #9
	sub	z18.s, z16.s, z18.s
	sqrshrnb	z16.h, z18.s, #7
	uzp1	z11.h, z16.h, z16.h
	sunpklo	z7.s, z11.h
	st1h	z7.s, p6, [x5, z30.s, sxtw 1]
	add	x22, x22, 692
	addvl	x6, sp, #9
	sub	z19.s, z1.s, z19.s
	sqrshrnb	z1.h, z19.s, #7
	uzp1	z10.h, z1.h, z1.h
	sunpklo	z17.s, z10.h
	st1h	z17.s, p6, [x22, z30.s, sxtw 1]
	add	x6, x6, 694
	addvl	x4, sp, #9
	sub	z20.s, z4.s, z20.s
	sqrshrnb	z4.h, z20.s, #7
	uzp1	z9.h, z4.h, z4.h
	sunpklo	z15.s, z9.h
	st1h	z15.s, p6, [x6, z30.s, sxtw 1]
	add	x4, x4, 696
	addvl	x24, sp, #9
	addvl	x23, sp, #9
	sub	z21.s, z13.s, z21.s
	sqrshrnb	z13.h, z21.s, #7
	uzp1	z0.h, z13.h, z13.h
	sunpklo	z18.s, z0.h
	st1h	z18.s, p6, [x4, z30.s, sxtw 1]
	add	x24, x24, 698
	add	x23, x23, 700
	sub	z22.s, z14.s, z22.s
	addvl	x25, sp, #9
	sqrshrnb	z14.h, z22.s, #7
	sub	z23.s, z2.s, z23.s
	uzp1	z16.h, z14.h, z14.h
	sqrshrnb	z2.h, z23.s, #7
	sunpklo	z11.s, z16.h
	uzp1	z7.h, z2.h, z2.h
	st1h	z11.s, p6, [x24, z30.s, sxtw 1]
	sunpklo	z19.s, z7.h
	st1h	z19.s, p6, [x23, z30.s, sxtw 1]
	add	x25, x25, 702
	addvl	x5, sp, #9
	sub	z24.s, z12.s, z24.s
	sqrshrnb	z12.h, z24.s, #7
	uzp1	z1.h, z12.h, z12.h
	sunpklo	z10.s, z1.h
	st1h	z10.s, p6, [x25, z30.s, sxtw 1]
	add	x5, x5, 704
	addvl	x22, sp, #9
	sub	z25.s, z8.s, z25.s
	sqrshrnb	z8.h, z25.s, #7
	uzp1	z17.h, z8.h, z8.h
	sunpklo	z20.s, z17.h
	st1h	z20.s, p6, [x5, z30.s, sxtw 1]
	add	x22, x22, 706
	addvl	x6, sp, #9
	sub	z26.s, z6.s, z26.s
	sqrshrnb	z6.h, z26.s, #7
	uzp1	z4.h, z6.h, z6.h
	sunpklo	z9.s, z4.h
	st1h	z9.s, p6, [x22, z30.s, sxtw 1]
	add	x6, x6, 708
	addvl	x4, sp, #9
	addvl	x24, sp, #8
	sub	z27.s, z5.s, z27.s
	sqrshrnb	z5.h, z27.s, #7
	uzp1	z15.h, z5.h, z5.h
	sunpklo	z21.s, z15.h
	st1h	z21.s, p6, [x6, z30.s, sxtw 1]
	add	x4, x4, 710
	add	x24, x24, 144
	sub	z28.s, z29.s, z28.s
	addvl	x23, sp, #9
	sqrshrnb	z29.h, z28.s, #7
	addvl	x25, sp, #4
	uzp1	z13.h, z29.h, z29.h
	addvl	x5, sp, #7
	sunpklo	z0.s, z13.h
	st1h	z0.s, p6, [x4, z30.s, sxtw 1]
	ldr	z18, [x24]
	add	x23, x23, 712
	sub	z3.s, z3.s, z18.s
	add	x25, x25, 144
	sqrshrnb	z22.h, z3.s, #7
	add	x5, x5, 144
	uzp1	z14.h, z22.h, z22.h
	addvl	x22, sp, #9
	sunpklo	z16.s, z14.h
	addvl	x6, sp, #3
	st1h	z16.s, p6, [x23, z30.s, sxtw 1]
	addvl	x4, sp, #6
	addvl	x24, sp, #9
	ldr	z11, [x25]
	ldr	z23, [x5]
	add	x22, x22, 714
	sub	z2.s, z11.s, z23.s
	add	x6, x6, 144
	sqrshrnb	z7.h, z2.s, #7
	add	x4, x4, 144
	uzp1	z19.h, z7.h, z7.h
	add	x24, x24, 716
	sunpklo	z24.s, z19.h
	addvl	x23, sp, #2
	st1h	z24.s, p6, [x22, z30.s, sxtw 1]
	addvl	x25, sp, #5
	addvl	x5, sp, #9
	ldr	z12, [x6]
	ldr	z1, [x4]
	add	x6, x0, 96
	sub	z10.s, z12.s, z1.s
	add	x4, x0, 224
	add	x22, x0, 480
	sqrshrnb	z25.h, z10.s, #7
	add	x23, x23, 144
	uzp1	z8.h, z25.h, z25.h
	add	x25, x25, 144
	add	x5, x5, 718
	sunpklo	z17.s, z8.h
	st1h	z17.s, p6, [x24, z30.s, sxtw 1]
	add	x24, x0, 352
	ldr	z20, [x23]
	ldr	z26, [x25]
	add	x23, x0, 608
	add	x25, x0, 736
	sub	z6.s, z20.s, z26.s
	sqrshrnb	z4.h, z6.s, #7
	uzp1	z9.h, z4.h, z4.h
	sunpklo	z27.s, z9.h
	st1h	z27.s, p6, [x5, z30.s, sxtw 1]
	ldr	z5, [x6]
	ldr	z15, [x4]
	ldr	z21, [x24]
	ldr	z28, [x22]
	add	x5, x0, 864
	add	x4, x0, 992
	add	x6, x0, 1120
	add	x24, x0, 1248
	ldr	z13, [x23]
	add	x22, x0, 1376
	ldr	z29, [x25]
	ldr	z18, [x5]
	ldr	z22, [x4]
	ldr	z16, [x6]
	ldr	z23, [x24]
	ldr	z14, [x22]
	add	x23, x0, 1504
	ldr	z19, [x23]
	add	x25, x0, 1632
	ldr	z24, [x25]
	add	x5, x0, 1760
	ldr	z12, [x5]
	add	x4, x0, 1888
	ldr	z10, [x4]
	add	x24, x0, 2016
	ldr	z25, [x24]
	adrp	x6, _ZL6CDOT_O
	zip1	z0.h, z5.h, z15.h
	zip1	z3.h, z21.h, z28.h
	zip1	z11.h, z13.h, z29.h
	zip1	z2.h, z18.h, z22.h
	zip1	z7.h, z16.h, z23.h
	zip1	z1.h, z14.h, z19.h
	zip1	z6.h, z24.h, z12.h
	add	x22, x6, :lo12:_ZL6CDOT_O
	zip1	z4.h, z10.h, z25.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z11.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z7.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x23, sp, #5
	adrp	x25, _ZL6CDOT_O+256
	add	x23, x23, 144
	add	x5, x25, :lo12:_ZL6CDOT_O+256
	str	z17, [x23]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x4, sp, #6
	adrp	x24, _ZL6CDOT_O+512
	add	x4, x4, 144
	add	x6, x24, :lo12:_ZL6CDOT_O+512
	str	z27, [x4]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x22, sp, #7
	adrp	x23, _ZL6CDOT_O+768
	add	x22, x22, 144
	add	x25, x23, :lo12:_ZL6CDOT_O+768
	str	z26, [x22]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z7.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+1024
	add	x4, x5, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z7.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x24, sp, #8
	adrp	x6, _ZL6CDOT_O+1280
	add	x24, x24, 144
	add	x22, x6, :lo12:_ZL6CDOT_O+1280
	str	z23, [x24]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+1536
	add	x25, x23, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+1792
	add	x4, x5, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x24, _ZL6CDOT_O+2048
	add	x6, x24, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z7.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x22, _ZL6CDOT_O+2304
	add	x23, x22, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z7.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x25, _ZL6CDOT_O+2560
	add	x5, x25, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+2816
	add	x24, x4, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+3072
	add	x22, x6, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+3328
	add	x25, x23, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z7.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z7.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z11.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z7.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z6.h
// 0 "" 2
#NO_APP
	add	x26, x0, 160
	ldr	z4, [x26]
	add	x30, x0, 416
	ldr	z28, [x30]
	add	x5, x0, 672
	ldr	z13, [x5]
	add	x24, x0, 928
	ldr	z16, [x24]
	add	x4, x0, 1184
	ldr	z14, [x4]
	add	x6, x0, 1440
	ldr	z8, [x6]
	add	x22, x0, 1696
	ldr	z9, [x22]
	add	x23, x0, 1952
	ldr	z5, [x23]
	zip1	z12.h, z4.h, z28.h
	zip1	z10.h, z13.h, z16.h
	zip1	z6.h, z14.h, z8.h
	zip1	z15.h, z9.h, z5.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z12.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z10.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z15.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z12.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z10.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z15.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z10.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z12.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z10.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z15.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z12.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z10.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z10.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z6.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z15.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z1.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z12.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z10.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z15.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z12.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z10.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z15.h, z6.h
// 0 "" 2
#NO_APP
	add	x13, x0, 288
	ldr	z11, [x13]
	add	x3, x0, 800
	ldr	z15, [x3]
	add	x12, x0, 1312
	ldr	z13, [x12]
	add	x11, x0, 1824
	ldr	z14, [x11]
	zip1	z28.h, z11.h, z15.h
	zip1	z8.h, z13.h, z14.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z28.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z28.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z8.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z28.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z8.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z28.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z8.h, z28.h
// 0 "" 2
#NO_APP
	add	x10, x0, 544
	ldr	z8, [x10]
	add	x9, x0, 1568
	ldr	z10, [x9]
	zip1	z6.h, z8.h, z10.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z28.h
// 0 "" 2
#NO_APP
	add	x8, x0, 32
	ldr	z6, [x8]
	add	x7, x0, 1056
	ldr	z8, [x7]
	zip1	z9.h, z6.h, z8.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z9.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z9.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x30, sp, #5
	addvl	x26, sp, #1
	add	z9.s, z6.s, z11.s
	add	x30, x30, 144
	ldr	z8, [x30]
	add	z28.s, z9.s, z15.s
	add	x25, sp, 144
	addvl	x14, sp, #9
	str	z28, [x25]
	add	x26, x26, 144
	add	z28.s, z28.s, z7.s
	addvl	x4, sp, #6
	str	z28, [x26]
	add	z28.s, z28.s, z8.s
	sqrshrnb	z8.h, z28.s, #7
	sub	z6.s, z6.s, z11.s
	add	x14, x14, 1168
	addvl	x5, sp, #2
	add	x4, x4, 144
	uzp1	z28.h, z8.h, z8.h
	sunpklo	z8.s, z28.h
	st1h	z8.s, p6, [x14, z30.s, sxtw 1]
	ldr	z11, [x4]
	add	z8.s, z31.s, z10.s
	add	x5, x5, 144
	sub	z31.s, z31.s, z10.s
	add	z10.s, z8.s, z13.s
	mov	z28.d, z10.d
	add	z10.s, z10.s, z16.s
	str	z10, [x5]
	add	z10.s, z10.s, z11.s
	sqrshrnb	z11.h, z10.s, #7
	addvl	x24, sp, #9
	addvl	x3, sp, #7
	uzp1	z10.h, z11.h, z11.h
	sunpklo	z11.s, z10.h
	add	x24, x24, 1170
	addvl	x6, sp, #3
	st1h	z11.s, p6, [x24, z30.s, sxtw 1]
	add	x3, x3, 144
	add	z11.s, z31.s, z12.s
	sub	z31.s, z31.s, z12.s
	ldr	z12, [x3]
	add	z10.s, z11.s, z5.s
	addvl	x22, sp, #9
	add	x6, x6, 144
	str	z10, [x6]
	add	z10.s, z10.s, z12.s
	sqrshrnb	z12.h, z10.s, #7
	sub	z8.s, z8.s, z13.s
	add	x22, x22, 1172
	add	z13.s, z6.s, z14.s
	addvl	x11, sp, #4
	sub	z6.s, z6.s, z14.s
	uzp1	z10.h, z12.h, z12.h
	add	z14.s, z13.s, z4.s
	sunpklo	z12.s, z10.h
	st1h	z12.s, p6, [x22, z30.s, sxtw 1]
	add	z10.s, z14.s, z29.s
	addvl	x23, sp, #9
	sqrshrnb	z12.h, z10.s, #7
	add	x11, x11, 144
	addvl	x9, sp, #8
	str	z14, [x11]
	uzp1	z14.h, z12.h, z12.h
	sub	z9.s, z9.s, z15.s
	sunpklo	z10.s, z14.h
	add	z15.s, z6.s, z3.s
	add	x23, x23, 1174
	add	x9, x9, 144
	st1h	z10.s, p6, [x23, z30.s, sxtw 1]
	ldr	z12, [x9]
	add	z14.s, z15.s, z12.s
	addvl	x13, sp, #9
	sqrshrnb	z10.h, z14.s, #7
	uzp1	z12.h, z10.h, z10.h
	sunpklo	z14.s, z12.h
	add	x13, x13, 1176
	st1h	z14.s, p6, [x13, z30.s, sxtw 1]
	add	z14.s, z31.s, z0.s
	add	z10.s, z14.s, z27.s
	sqrshrnb	z12.h, z10.s, #7
	addvl	x12, sp, #9
	uzp1	z10.h, z12.h, z12.h
	sunpklo	z12.s, z10.h
	sub	z0.s, z31.s, z0.s
	add	x12, x12, 1178
	addvl	x10, sp, #9
	st1h	z12.s, p6, [x12, z30.s, sxtw 1]
	add	z12.s, z8.s, z1.s
	sub	z1.s, z8.s, z1.s
	add	z31.s, z12.s, z26.s
	sqrshrnb	z8.h, z31.s, #7
	uzp1	z10.h, z8.h, z8.h
	add	x10, x10, 1180
	sunpklo	z31.s, z10.h
	addvl	x8, sp, #9
	st1h	z31.s, p6, [x10, z30.s, sxtw 1]
	add	z10.s, z9.s, z2.s
	sub	z9.s, z9.s, z2.s
	add	z2.s, z10.s, z25.s
	add	x8, x8, 1182
	sqrshrnb	z8.h, z2.s, #7
	addvl	x7, sp, #9
	uzp1	z31.h, z8.h, z8.h
	sunpklo	z2.s, z31.h
	st1h	z2.s, p6, [x8, z30.s, sxtw 1]
	sub	z6.s, z6.s, z3.s
	add	x7, x7, 1184
	add	z3.s, z9.s, z24.s
	addvl	x14, sp, #9
	sqrshrnb	z8.h, z3.s, #7
	uzp1	z31.h, z8.h, z8.h
	sunpklo	z2.s, z31.h
	st1h	z2.s, p6, [x7, z30.s, sxtw 1]
	add	z3.s, z1.s, z23.s
	add	x14, x14, 1186
	sqrshrnb	z8.h, z3.s, #7
	addvl	x25, sp, #9
	uzp1	z31.h, z8.h, z8.h
	sunpklo	z2.s, z31.h
	st1h	z2.s, p6, [x14, z30.s, sxtw 1]
	sub	z13.s, z13.s, z4.s
	add	x25, x25, 1188
	add	z4.s, z0.s, z22.s
	addvl	x26, sp, #9
	sqrshrnb	z3.h, z4.s, #7
	uzp1	z8.h, z3.h, z3.h
	sunpklo	z31.s, z8.h
	st1h	z31.s, p6, [x25, z30.s, sxtw 1]
	add	z2.s, z6.s, z21.s
	add	x26, x26, 1190
	sqrshrnb	z4.h, z2.s, #7
	addvl	x30, sp, #9
	uzp1	z3.h, z4.h, z4.h
	sunpklo	z8.s, z3.h
	st1h	z8.s, p6, [x26, z30.s, sxtw 1]
	add	z31.s, z13.s, z20.s
	add	x30, x30, 1192
	sqrshrnb	z2.h, z31.s, #7
	addvl	x24, sp, #9
	uzp1	z4.h, z2.h, z2.h
	sunpklo	z3.s, z4.h
	st1h	z3.s, p6, [x30, z30.s, sxtw 1]
	sub	z11.s, z11.s, z5.s
	add	x24, x24, 1194
	add	z5.s, z11.s, z19.s
	addvl	x22, sp, #9
	sqrshrnb	z8.h, z5.s, #7
	uzp1	z31.h, z8.h, z8.h
	sunpklo	z2.s, z31.h
	st1h	z2.s, p6, [x24, z30.s, sxtw 1]
	sub	z16.s, z28.s, z16.s
	add	x22, x22, 1196
	add	z30.s, z16.s, z18.s
	addvl	x23, sp, #9
	sqrshrnb	z28.h, z30.s, #7
	mov	w5, 32
	uzp1	z4.h, z28.h, z28.h
	index	z5.s, #0, w5
	sunpklo	z3.s, z4.h
	st1h	z3.s, p6, [x22, z5.s, sxtw 1]
	add	x4, sp, 144
	ldr	z8, [x4]
	add	x23, x23, 1198
	sub	z7.s, z8.s, z7.s
	addvl	x13, sp, #9
	add	z31.s, z7.s, z17.s
	sqrshrnb	z2.h, z31.s, #7
	uzp1	z30.h, z2.h, z2.h
	sunpklo	z28.s, z30.h
	st1h	z28.s, p6, [x23, z5.s, sxtw 1]
	sub	z17.s, z7.s, z17.s
	add	x13, x13, 1200
	sqrshrnb	z4.h, z17.s, #7
	addvl	x6, sp, #9
	uzp1	z3.h, z4.h, z4.h
	sunpklo	z8.s, z3.h
	st1h	z8.s, p6, [x13, z5.s, sxtw 1]
	add	x6, x6, 1202
	addvl	x3, sp, #9
	sub	z18.s, z16.s, z18.s
	sqrshrnb	z16.h, z18.s, #7
	uzp1	z7.h, z16.h, z16.h
	sunpklo	z31.s, z7.h
	st1h	z31.s, p6, [x6, z5.s, sxtw 1]
	add	x3, x3, 1204
	addvl	x12, sp, #9
	sub	z19.s, z11.s, z19.s
	sqrshrnb	z11.h, z19.s, #7
	uzp1	z2.h, z11.h, z11.h
	sunpklo	z30.s, z2.h
	st1h	z30.s, p6, [x3, z5.s, sxtw 1]
	add	x12, x12, 1206
	addvl	x11, sp, #9
	sub	z20.s, z13.s, z20.s
	sqrshrnb	z13.h, z20.s, #7
	uzp1	z28.h, z13.h, z13.h
	sunpklo	z17.s, z28.h
	st1h	z17.s, p6, [x12, z5.s, sxtw 1]
	add	x11, x11, 1208
	addvl	x10, sp, #9
	sub	z21.s, z6.s, z21.s
	sqrshrnb	z6.h, z21.s, #7
	uzp1	z4.h, z6.h, z6.h
	sunpklo	z3.s, z4.h
	st1h	z3.s, p6, [x11, z5.s, sxtw 1]
	add	x10, x10, 1210
	addvl	x9, sp, #9
	sub	z22.s, z0.s, z22.s
	addvl	x8, sp, #9
	sqrshrnb	z0.h, z22.s, #7
	uzp1	z8.h, z0.h, z0.h
	sunpklo	z18.s, z8.h
	st1h	z18.s, p6, [x10, z5.s, sxtw 1]
	add	x9, x9, 1212
	add	x8, x8, 1214
	addvl	x7, sp, #9
	sub	z23.s, z1.s, z23.s
	sub	z24.s, z9.s, z24.s
	sqrshrnb	z1.h, z23.s, #7
	sqrshrnb	z9.h, z24.s, #7
	uzp1	z16.h, z1.h, z1.h
	uzp1	z31.h, z9.h, z9.h
	sunpklo	z7.s, z16.h
	sunpklo	z19.s, z31.h
	st1h	z7.s, p6, [x9, z5.s, sxtw 1]
	st1h	z19.s, p6, [x8, z5.s, sxtw 1]
	add	x7, x7, 1216
	addvl	x14, sp, #9
	sub	z25.s, z10.s, z25.s
	sqrshrnb	z10.h, z25.s, #7
	uzp1	z11.h, z10.h, z10.h
	sunpklo	z2.s, z11.h
	st1h	z2.s, p6, [x7, z5.s, sxtw 1]
	add	x14, x14, 1218
	addvl	x25, sp, #9
	sub	z26.s, z12.s, z26.s
	sqrshrnb	z12.h, z26.s, #7
	uzp1	z30.h, z12.h, z12.h
	sunpklo	z20.s, z30.h
	st1h	z20.s, p6, [x14, z5.s, sxtw 1]
	add	x25, x25, 1220
	addvl	x26, sp, #8
	addvl	x30, sp, #9
	sub	z27.s, z14.s, z27.s
	sqrshrnb	z14.h, z27.s, #7
	uzp1	z13.h, z14.h, z14.h
	sunpklo	z28.s, z13.h
	st1h	z28.s, p6, [x25, z5.s, sxtw 1]
	add	x26, x26, 144
	ldr	z17, [x26]
	add	x30, x30, 1222
	sub	z15.s, z15.s, z17.s
	addvl	x24, sp, #4
	sqrshrnb	z21.h, z15.s, #7
	addvl	x22, sp, #9
	uzp1	z6.h, z21.h, z21.h
	sunpklo	z4.s, z6.h
	st1h	z4.s, p6, [x30, z5.s, sxtw 1]
	add	x24, x24, 144
	ldr	z3, [x24]
	add	x22, x22, 1224
	sub	z29.s, z3.s, z29.s
	addvl	x5, sp, #3
	sqrshrnb	z22.h, z29.s, #7
	addvl	x4, sp, #7
	uzp1	z0.h, z22.h, z22.h
	addvl	x23, sp, #9
	sunpklo	z8.s, z0.h
	st1h	z8.s, p6, [x22, z5.s, sxtw 1]
	add	x5, x5, 144
	ldr	z18, [x5]
	add	x4, x4, 144
	ldr	z23, [x4]
	add	x23, x23, 1226
	sub	z1.s, z18.s, z23.s
	addvl	x13, sp, #2
	sqrshrnb	z16.h, z1.s, #7
	addvl	x6, sp, #6
	uzp1	z7.h, z16.h, z16.h
	addvl	x3, sp, #9
	sunpklo	z24.s, z7.h
	st1h	z24.s, p6, [x23, z5.s, sxtw 1]
	add	x13, x13, 144
	ldr	z9, [x13]
	add	x6, x6, 144
	ldr	z31, [x6]
	add	x3, x3, 1228
	sub	z19.s, z9.s, z31.s
	addvl	x12, sp, #1
	sqrshrnb	z25.h, z19.s, #7
	addvl	x11, sp, #5
	addvl	x10, sp, #9
	uzp1	z10.h, z25.h, z25.h
	sunpklo	z11.s, z10.h
	st1h	z11.s, p6, [x3, z5.s, sxtw 1]
	add	x25, x0, 624
	add	x12, x12, 144
	ldr	z2, [x12]
	add	x11, x11, 144
	ldr	z26, [x11]
	add	x10, x10, 1230
	sub	z12.s, z2.s, z26.s
	add	x30, x0, 880
	sqrshrnb	z30.h, z12.s, #7
	uzp1	z20.h, z30.h, z30.h
	sunpklo	z27.s, z20.h
	st1h	z27.s, p6, [x10, z5.s, sxtw 1]
	ldr	z3, [x30]
	ldr	z15, [x25]
	add	x9, x0, 112
	ldr	z14, [x9]
	add	x8, x0, 240
	ldr	z13, [x8]
	add	x7, x0, 368
	ldr	z28, [x7]
	add	x14, x0, 496
	ldr	z17, [x14]
	add	x26, x0, 752
	ldr	z21, [x26]
	add	x24, x0, 1008
	ldr	z29, [x24]
	add	x22, x0, 1136
	ldr	z22, [x22]
	add	x5, x0, 1264
	ldr	z18, [x5]
	add	x4, x0, 1392
	ldr	z23, [x4]
	add	x23, x0, 1520
	ldr	z16, [x23]
	add	x13, x0, 1648
	ldr	z7, [x13]
	add	x6, x0, 1776
	ldr	z24, [x6]
	add	x3, x0, 1904
	ldr	z19, [x3]
	add	x11, x0, 2032
	ldr	z31, [x11]
	adrp	x12, _ZL6CDOT_O
	zip1	z8.h, z3.h, z29.h
	zip1	z6.h, z14.h, z13.h
	zip1	z4.h, z28.h, z17.h
	zip1	z0.h, z15.h, z21.h
	zip1	z1.h, z22.h, z18.h
	zip1	z9.h, z23.h, z16.h
	zip1	z2.h, z7.h, z24.h
	add	x25, x12, :lo12:_ZL6CDOT_O
	zip1	z3.h, z19.h, z31.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d30, #0
	mov	z10.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z9.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #5
	adrp	x9, _ZL6CDOT_O+256
	add	x10, x10, 144
	add	x26, x9, :lo12:_ZL6CDOT_O+256
	str	z10, [x10]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z8.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z17.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x8, sp, #6
	adrp	x7, _ZL6CDOT_O+512
	add	x8, x8, 144
	add	x30, x7, :lo12:_ZL6CDOT_O+512
	str	z7, [x8]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x14, sp, #7
	adrp	x24, _ZL6CDOT_O+768
	add	x14, x14, 144
	add	x22, x24, :lo12:_ZL6CDOT_O+768
	str	z27, [x14]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #8
	adrp	x4, _ZL6CDOT_O+1024
	add	x5, x5, 144
	add	x23, x4, :lo12:_ZL6CDOT_O+1024
	str	z26, [x5]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z31.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z6.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z4.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z0.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z9.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z2.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z3.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x13, _ZL6CDOT_O+1280
	add	x11, x13, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z8.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+1536
	add	x12, x6, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1792
	add	x10, x3, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+2048
	add	x8, x9, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+2304
	add	x14, x7, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x24, _ZL6CDOT_O+2560
	add	x5, x24, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+2816
	add	x13, x4, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z8.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x13, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x13, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x13, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+3072
	add	x3, x6, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z8.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+3328
	add	x7, x9, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z8.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+3584
	add	x24, x14, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z8.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x24, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x24, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x24, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x24, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+3840
	add	x4, x5, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z8.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z2.h
// 0 "" 2
#NO_APP
	adrp	x6, .LANCHOR0
	add	x13, x0, 176
	ldr	z3, [x13]
	add	x3, x0, 432
	ldr	z17, [x3]
	add	x9, x0, 688
	ldr	z16, [x9]
	add	x7, x0, 944
	ldr	z18, [x7]
	add	x14, x0, 1200
	ldr	z15, [x14]
	add	x24, x0, 1456
	ldr	z10, [x24]
	add	x5, x0, 1712
	ldr	z11, [x5]
	add	x4, x0, 1968
	ldr	z12, [x4]
	zip1	z7.h, z3.h, z17.h
	zip1	z14.h, z16.h, z18.h
	zip1	z4.h, z15.h, z10.h
	add	x6, x6, :lo12:.LANCHOR0
	zip1	z0.h, z11.h, z12.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z1.h
// 0 "" 2
#NO_APP
	add	x13, x6, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z7.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z16.h
// 0 "" 2
#NO_APP
	add	x3, x6, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z7.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z14.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z0.h, z12.h
// 0 "" 2
#NO_APP
	add	x9, x6, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z14.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z4.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z0.h, z9.h
// 0 "" 2
#NO_APP
	add	x7, x6, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z7.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z15.h
// 0 "" 2
#NO_APP
	add	x14, x6, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z7.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z14.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z4.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z0.h, z9.h
// 0 "" 2
#NO_APP
	add	x24, x6, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z7.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x24, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x24, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x24, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z0.h, z15.h
// 0 "" 2
#NO_APP
	add	x5, x6, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z14.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z0.h, z4.h
// 0 "" 2
#NO_APP
	add	x4, x0, 304
	ldr	z0, [x4]
	add	x13, x0, 816
	ldr	z1, [x13]
	add	x3, x0, 1328
	ldr	z3, [x3]
	add	x9, x0, 1840
	ldr	z16, [x9]
	zip1	z2.h, z0.h, z1.h
	zip1	z0.h, z3.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z0.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z0.h, z15.h
// 0 "" 2
#NO_APP
	add	x17, x6, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z2.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z0.h, z2.h
// 0 "" 2
#NO_APP
	add	x16, x0, 560
	ldr	z0, [x16]
	add	x15, x0, 1584
	ldr	z1, [x15]
	zip1	z16.h, z0.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z16.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z1.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z16.h, z14.h
// 0 "" 2
#NO_APP
	add	x20, x0, 48
	ldr	z2, [x20]
	add	x0, x0, 1072
	ldr	z16, [x0]
	zip1	z14.h, z2.h, z16.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z14.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z14.h, z2.h
// 0 "" 2
#NO_APP
	add	z14.s, z15.s, z0.s
	addvl	x6, sp, #1
	add	z2.s, z14.s, z7.s
	addvl	x24, sp, #5
	add	x18, sp, 144
	str	z14, [x18]
	add	x6, x6, 144
	add	z14.s, z2.s, z17.s
	addvl	x14, sp, #2
	add	x24, x24, 144
	str	z2, [x6]
	ldr	z2, [x24]
	add	x14, x14, 144
	str	z14, [x14]
	add	z14.s, z14.s, z2.s
	sqrshrnb	z2.h, z14.s, #7
	addvl	x19, sp, #9
	addvl	x3, sp, #6
	uzp1	z14.h, z2.h, z2.h
	sunpklo	z2.s, z14.h
	add	x19, x19, 1680
	addvl	x13, sp, #3
	st1h	z2.s, p6, [x19, z5.s, sxtw 1]
	add	x3, x3, 144
	add	z2.s, z16.s, z1.s
	sub	z16.s, z16.s, z1.s
	ldr	z1, [x3]
	sub	z15.s, z15.s, z0.s
	add	x13, x13, 144
	add	z0.s, z2.s, z4.s
	add	z14.s, z0.s, z18.s
	str	z14, [x13]
	add	z14.s, z14.s, z1.s
	sqrshrnb	z1.h, z14.s, #7
	addvl	x7, sp, #9
	addvl	x15, sp, #7
	uzp1	z14.h, z1.h, z1.h
	sunpklo	z1.s, z14.h
	sub	z2.s, z2.s, z4.s
	add	x7, x7, 1682
	addvl	x16, sp, #4
	st1h	z1.s, p6, [x7, z5.s, sxtw 1]
	add	x15, x15, 144
	ldr	z4, [x15]
	add	z1.s, z16.s, z3.s
	sub	z16.s, z16.s, z3.s
	add	z3.s, z1.s, z13.s
	add	z14.s, z3.s, z4.s
	addvl	x5, sp, #9
	add	x16, x16, 144
	str	z3, [x16]
	addvl	x19, sp, #8
	sqrshrnb	z3.h, z14.s, #7
	uzp1	z4.h, z3.h, z3.h
	sunpklo	z14.s, z4.h
	add	x0, sp, 144
	add	z4.s, z15.s, z6.s
	add	x5, x5, 1684
	sub	z15.s, z15.s, z6.s
	st1h	z14.s, p6, [x5, z5.s, sxtw 1]
	ldr	z6, [x0]
	add	x19, x19, 144
	sub	z14.s, z6.s, z7.s
	ldr	z7, [x19]
	add	z3.s, z4.s, z12.s
	add	z6.s, z3.s, z7.s
	sqrshrnb	z7.h, z6.s, #7
	addvl	x4, sp, #9
	uzp1	z6.h, z7.h, z7.h
	sunpklo	z7.s, z6.h
	add	x4, x4, 1686
	addvl	x9, sp, #9
	st1h	z7.s, p6, [x4, z5.s, sxtw 1]
	add	z7.s, z15.s, z10.s
	add	z6.s, z7.s, z31.s
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	add	x9, x9, 1688
	addvl	x17, sp, #9
	st1h	z6.s, p6, [x9, z5.s, sxtw 1]
	add	z6.s, z16.s, z8.s
	sub	z16.s, z16.s, z8.s
	add	z8.s, z6.s, z29.s
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	sub	z15.s, z15.s, z10.s
	add	x17, x17, 1690
	add	z10.s, z14.s, z11.s
	st1h	z8.s, p6, [x17, z5.s, sxtw 1]
	sub	z14.s, z14.s, z11.s
	add	z8.s, z2.s, z9.s
	add	z11.s, z10.s, z27.s
	sub	z2.s, z2.s, z9.s
	addvl	x20, sp, #9
	add	z9.s, z8.s, z28.s
	sqrshrnb	z9.h, z9.s, #7
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	add	x20, x20, 1692
	st1h	z9.s, p6, [x20, z5.s, sxtw 1]
	sqrshrnb	z9.h, z11.s, #7
	uzp1	z11.h, z9.h, z9.h
	addvl	x18, sp, #9
	sunpklo	z9.s, z11.h
	add	z11.s, z14.s, z26.s
	add	x18, x18, 1694
	addvl	x6, sp, #9
	st1h	z9.s, p6, [x18, z5.s, sxtw 1]
	sqrshrnb	z9.h, z11.s, #7
	uzp1	z11.h, z9.h, z9.h
	sub	z4.s, z4.s, z12.s
	sunpklo	z9.s, z11.h
	add	z12.s, z2.s, z25.s
	add	x6, x6, 1696
	sqrshrnb	z11.h, z12.s, #7
	st1h	z9.s, p6, [x6, z5.s, sxtw 1]
	addvl	x7, sp, #9
	uzp1	z9.h, z11.h, z11.h
	add	x7, x7, 1698
	add	z11.s, z16.s, z24.s
	sunpklo	z12.s, z9.h
	addvl	x14, sp, #9
	st1h	z12.s, p6, [x7, z5.s, sxtw 1]
	sqrshrnb	z9.h, z11.s, #7
	add	x14, x14, 1700
	uzp1	z12.h, z9.h, z9.h
	addvl	x24, sp, #9
	sunpklo	z11.s, z12.h
	st1h	z11.s, p6, [x14, z5.s, sxtw 1]
	sub	z1.s, z1.s, z13.s
	add	x24, x24, 1702
	add	z13.s, z15.s, z23.s
	addvl	x5, sp, #9
	sqrshrnb	z9.h, z13.s, #7
	uzp1	z12.h, z9.h, z9.h
	sunpklo	z11.s, z12.h
	st1h	z11.s, p6, [x24, z5.s, sxtw 1]
	add	z13.s, z4.s, z22.s
	add	x5, x5, 1704
	sqrshrnb	z9.h, z13.s, #7
	addvl	x4, sp, #9
	uzp1	z12.h, z9.h, z9.h
	sunpklo	z11.s, z12.h
	st1h	z11.s, p6, [x5, z5.s, sxtw 1]
	add	z13.s, z1.s, z21.s
	add	x4, x4, 1706
	sqrshrnb	z9.h, z13.s, #7
	addvl	x13, sp, #9
	uzp1	z12.h, z9.h, z9.h
	sunpklo	z11.s, z12.h
	st1h	z11.s, p6, [x4, z5.s, sxtw 1]
	sub	z18.s, z0.s, z18.s
	add	x13, x13, 1708
	add	z0.s, z18.s, z20.s
	addvl	x3, sp, #1
	sqrshrnb	z13.h, z0.s, #7
	addvl	x9, sp, #9
	uzp1	z9.h, z13.h, z13.h
	sunpklo	z12.s, z9.h
	st1h	z12.s, p6, [x13, z5.s, sxtw 1]
	add	x3, x3, 144
	ldr	z11, [x3]
	add	x9, x9, 1710
	sub	z17.s, z11.s, z17.s
	addvl	x17, sp, #9
	add	z0.s, z17.s, z19.s
	sqrshrnb	z13.h, z0.s, #7
	uzp1	z9.h, z13.h, z13.h
	sunpklo	z12.s, z9.h
	st1h	z12.s, p6, [x9, z5.s, sxtw 1]
	sub	z19.s, z17.s, z19.s
	add	x17, x17, 1712
	sqrshrnb	z11.h, z19.s, #7
	addvl	x16, sp, #9
	uzp1	z17.h, z11.h, z11.h
	sunpklo	z0.s, z17.h
	st1h	z0.s, p6, [x17, z5.s, sxtw 1]
	add	x16, x16, 1714
	addvl	x15, sp, #9
	sub	z20.s, z18.s, z20.s
	sqrshrnb	z18.h, z20.s, #7
	uzp1	z13.h, z18.h, z18.h
	sunpklo	z9.s, z13.h
	st1h	z9.s, p6, [x16, z5.s, sxtw 1]
	add	x15, x15, 1716
	addvl	x20, sp, #9
	sub	z21.s, z1.s, z21.s
	sqrshrnb	z1.h, z21.s, #7
	uzp1	z12.h, z1.h, z1.h
	sunpklo	z19.s, z12.h
	st1h	z19.s, p6, [x15, z5.s, sxtw 1]
	add	x20, x20, 1718
	addvl	x0, sp, #9
	sub	z22.s, z4.s, z22.s
	sqrshrnb	z4.h, z22.s, #7
	uzp1	z11.h, z4.h, z4.h
	sunpklo	z17.s, z11.h
	st1h	z17.s, p6, [x20, z5.s, sxtw 1]
	add	x0, x0, 1720
	addvl	x19, sp, #9
	addvl	x18, sp, #9
	sub	z23.s, z15.s, z23.s
	sqrshrnb	z15.h, z23.s, #7
	uzp1	z0.h, z15.h, z15.h
	sunpklo	z20.s, z0.h
	st1h	z20.s, p6, [x0, z5.s, sxtw 1]
	add	x19, x19, 1722
	add	x18, x18, 1724
	addvl	x6, sp, #9
	sub	z24.s, z16.s, z24.s
	sub	z25.s, z2.s, z25.s
	sqrshrnb	z16.h, z24.s, #7
	sqrshrnb	z2.h, z25.s, #7
	uzp1	z18.h, z16.h, z16.h
	uzp1	z9.h, z2.h, z2.h
	sunpklo	z13.s, z18.h
	sunpklo	z21.s, z9.h
	st1h	z13.s, p6, [x19, z5.s, sxtw 1]
	st1h	z21.s, p6, [x18, z5.s, sxtw 1]
	add	x6, x6, 1726
	addvl	x7, sp, #9
	sub	z26.s, z14.s, z26.s
	sqrshrnb	z14.h, z26.s, #7
	uzp1	z1.h, z14.h, z14.h
	sunpklo	z12.s, z1.h
	st1h	z12.s, p6, [x6, z5.s, sxtw 1]
	add	x7, x7, 1728
	addvl	x14, sp, #9
	sub	z27.s, z10.s, z27.s
	sqrshrnb	z10.h, z27.s, #7
	uzp1	z19.h, z10.h, z10.h
	sunpklo	z22.s, z19.h
	st1h	z22.s, p6, [x7, z5.s, sxtw 1]
	add	x14, x14, 1730
	addvl	x24, sp, #9
	sub	z28.s, z8.s, z28.s
	sqrshrnb	z8.h, z28.s, #7
	uzp1	z4.h, z8.h, z8.h
	sunpklo	z11.s, z4.h
	st1h	z11.s, p6, [x14, z5.s, sxtw 1]
	add	x24, x24, 1732
	addvl	x5, sp, #9
	sub	z29.s, z6.s, z29.s
	sqrshrnb	z6.h, z29.s, #7
	uzp1	z17.h, z6.h, z6.h
	sunpklo	z23.s, z17.h
	st1h	z23.s, p6, [x24, z5.s, sxtw 1]
	add	x5, x5, 1734
	addvl	x4, sp, #8
	sub	z31.s, z7.s, z31.s
	addvl	x13, sp, #9
	sqrshrnb	z7.h, z31.s, #7
	uzp1	z15.h, z7.h, z7.h
	sunpklo	z0.s, z15.h
	st1h	z0.s, p6, [x5, z5.s, sxtw 1]
	add	x4, x4, 144
	ldr	z20, [x4]
	add	x13, x13, 1736
	sub	z3.s, z3.s, z20.s
	addvl	x3, sp, #4
	sqrshrnb	z24.h, z3.s, #7
	addvl	x9, sp, #7
	uzp1	z16.h, z24.h, z24.h
	addvl	x17, sp, #9
	sunpklo	z18.s, z16.h
	st1h	z18.s, p6, [x13, z5.s, sxtw 1]
	add	x3, x3, 144
	ldr	z13, [x3]
	add	x9, x9, 144
	ldr	z25, [x9]
	add	x17, x17, 1738
	sub	z2.s, z13.s, z25.s
	addvl	x16, sp, #3
	sqrshrnb	z9.h, z2.s, #7
	addvl	x15, sp, #6
	uzp1	z21.h, z9.h, z9.h
	addvl	x20, sp, #9
	sunpklo	z26.s, z21.h
	addvl	x0, sp, #2
	st1h	z26.s, p6, [x17, z5.s, sxtw 1]
	addvl	x19, sp, #5
	addvl	x18, sp, #9
	add	x16, x16, 144
	ldr	z14, [x16]
	add	x15, x15, 144
	ldr	z1, [x15]
	add	x20, x20, 1740
	sub	z12.s, z14.s, z1.s
	add	x0, x0, 144
	add	x19, x19, 144
	sqrshrnb	z27.h, z12.s, #7
	add	x18, x18, 1742
	addvl	x6, sp, #9
	uzp1	z10.h, z27.h, z27.h
	sunpklo	z19.s, z10.h
	st1h	z19.s, p6, [x20, z5.s, sxtw 1]
	ldr	z22, [x0]
	ldr	z28, [x19]
	add	x6, x6, 208
	sub	z8.s, z22.s, z28.s
	addvl	x7, sp, #9
	sqrshrnb	z4.h, z8.s, #7
	addvl	x14, sp, #9
	uzp1	z11.h, z4.h, z4.h
	addvl	x24, sp, #9
	addvl	x5, sp, #9
	addvl	x4, sp, #9
	addvl	x13, sp, #9
	sunpklo	z29.s, z11.h
	addvl	x3, sp, #9
	st1h	z29.s, p6, [x18, z5.s, sxtw 1]
	ldr	z5, [x6]
	addvl	x9, sp, #9
	addvl	x17, sp, #9
	addvl	x16, sp, #9
	addvl	x15, sp, #9
	addvl	x20, sp, #9
	addvl	x0, sp, #9
	addvl	x19, sp, #9
	addvl	x18, sp, #9
	add	x7, x7, 336
	ldr	z6, [x7]
	add	x14, x14, 464
	ldr	z17, [x14]
	add	x24, x24, 592
	ldr	z23, [x24]
	add	x5, x5, 720
	ldr	z15, [x5]
	add	x4, x4, 848
	ldr	z31, [x4]
	add	x13, x13, 976
	ldr	z20, [x13]
	add	x3, x3, 1104
	ldr	z24, [x3]
	add	x9, x9, 1232
	ldr	z18, [x9]
	add	x17, x17, 1360
	ldr	z13, [x17]
	add	x16, x16, 1488
	ldr	z16, [x16]
	add	x15, x15, 1616
	ldr	z25, [x15]
	add	x20, x20, 1744
	ldr	z2, [x20]
	add	x0, x0, 1872
	ldr	z21, [x0]
	add	x19, x19, 2000
	ldr	z26, [x19]
	add	x18, x18, 2128
	ldr	z14, [x18]
	zip1	z7.h, z5.h, z6.h
	zip1	z0.h, z17.h, z23.h
	zip1	z3.h, z15.h, z31.h
	zip1	z9.h, z20.h, z24.h
	zip1	z1.h, z18.h, z13.h
	zip1	z8.h, z16.h, z25.h
	zip1	z4.h, z2.h, z21.h
	zip1	z5.h, z26.h, z14.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z7.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z0.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z9.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z1.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z8.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z5.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z8.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x25, sp, #5
	add	x25, x25, 144
	str	z17, [x25]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x30, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x30, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x30, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x30, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x30, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x30, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z19.h
// 0 "" 2
#NO_APP
	addvl	x26, sp, #6
	add	x26, x26, 144
	str	z26, [x26]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x22, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x22, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x22, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x22, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x22, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x22, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x22, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x30, sp, #7
	add	x30, x30, 144
	str	z25, [x30]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z7.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x23, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x23, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x23, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x23, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x23, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x23, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z7.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x22, _ZL6CDOT_O+2304
	add	x9, x22, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z7.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x23, _ZL6CDOT_O+2560
	add	x8, x23, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z7.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z8.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+2816
	add	x7, x11, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z8.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+3072
	add	x6, x12, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+3328
	add	x5, x10, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z7.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z8.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z31.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+3584
	add	x4, x14, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z9.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z6.h
// 0 "" 2
#NO_APP
	adrp	x24, _ZL6CDOT_O+3840
	add	x3, x24, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z7.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z8.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	addvl	x17, sp, #9
	addvl	x16, sp, #9
	addvl	x15, sp, #9
	addvl	x20, sp, #9
	add	x0, x0, 1296
	ldr	z14, [x0]
	addvl	x19, sp, #9
	addvl	x18, sp, #9
	addvl	x25, sp, #9
	add	x17, x17, 272
	ldr	z5, [x17]
	add	x16, x16, 528
	ldr	z31, [x16]
	add	x15, x15, 784
	ldr	z13, [x15]
	add	x20, x20, 1040
	ldr	z16, [x20]
	add	x19, x19, 1552
	ldr	z10, [x19]
	add	x18, x18, 1808
	ldr	z11, [x18]
	add	x25, x25, 2064
	ldr	z29, [x25]
	adrp	x13, .LANCHOR0
	zip1	z12.h, z5.h, z31.h
	zip1	z0.h, z13.h, z16.h
	zip1	z3.h, z14.h, z10.h
	add	x0, x13, :lo12:.LANCHOR0
	zip1	z1.h, z11.h, z29.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z12.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z1.h, z8.h
// 0 "" 2
#NO_APP
	add	x17, x0, 128
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z12.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z1.h, z13.h
// 0 "" 2
#NO_APP
	add	x16, x0, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z1.h, z6.h
// 0 "" 2
#NO_APP
	add	x15, x0, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z12.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z1.h, z4.h
// 0 "" 2
#NO_APP
	add	x14, x0, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z12.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z0.h, z31.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z1.h, z14.h
// 0 "" 2
#NO_APP
	add	x13, x0, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x26, sp, #8
	add	x12, x0, 768
	add	x26, x26, 144
	str	z30, [x26]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d29, #0
	mov	z7.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z12.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z1.h, z31.h
// 0 "" 2
#NO_APP
	add	x11, x0, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z12.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z1.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x30, sp, #9
	addvl	x22, sp, #9
	addvl	x23, sp, #9
	addvl	x10, sp, #9
	add	x30, x30, 400
	ldr	z1, [x30]
	add	x22, x22, 912
	ldr	z14, [x22]
	add	x23, x23, 1424
	ldr	z6, [x23]
	add	x10, x10, 1936
	ldr	z4, [x10]
	zip1	z30.h, z1.h, z14.h
	add	x20, x0, 1024
	zip1	z31.h, z6.h, z4.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z30.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z31.h, z13.h
// 0 "" 2
#NO_APP
	add	x19, x0, 1088
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z30.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z31.h, z0.h
// 0 "" 2
#NO_APP
	add	x30, x0, 1152
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z30.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z31.h, z14.h
// 0 "" 2
#NO_APP
	add	x18, x0, 1216
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z30.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z31.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x24, sp, #9
	addvl	x25, sp, #9
	add	x24, x24, 656
	ldr	z31, [x24]
	add	x25, x25, 1680
	ldr	z12, [x25]
	mov	x24, x21
	zip1	z13.h, z31.h, z12.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z13.h, z1.h
// 0 "" 2
#NO_APP
	add	x23, x0, 1312
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z1.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z13.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x21, sp, #9
	addvl	x26, sp, #9
	add	x21, x21, 144
	ldr	z30, [x21]
	add	x26, x26, 1168
	ldr	z31, [x26]
	add	x22, x0, 1344
	zip1	z30.h, z30.h, z31.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	add	x21, x0, 1376
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z30.h, z31.h
// 0 "" 2
#NO_APP
	add	x10, sp, 144
	add	z12.s, z13.s, z0.s
	add	z30.s, z12.s, z6.s
	str	z30, [x10]
	addvl	x10, sp, #4
	add	z30.s, z30.s, z15.s
	addvl	x25, sp, #1
	add	x10, x10, 144
	str	z2, [x10]
	add	z2.s, z30.s, z2.s
	add	x25, x25, 144
	addvl	x10, sp, #5
	str	z30, [x25]
	sqrshrnb	z30.h, z2.s, #12
	uzp1	z2.h, z30.h, z30.h
	index	z31.s, #0, w2
	sunpklo	z30.s, z2.h
	addvl	x25, sp, #2
	st1h	z30.s, p6, [x1, z31.s, sxtw 1]
	add	z2.s, z14.s, z1.s
	add	x10, x10, 144
	sub	z14.s, z14.s, z1.s
	ldr	z1, [x10]
	add	x26, x1, 2
	sub	z13.s, z13.s, z0.s
	add	x25, x25, 144
	add	z0.s, z2.s, z4.s
	add	z30.s, z0.s, z16.s
	str	z30, [x25]
	add	z30.s, z30.s, z1.s
	sqrshrnb	z1.h, z30.s, #12
	uzp1	z30.h, z1.h, z1.h
	sub	z2.s, z2.s, z4.s
	sunpklo	z1.s, z30.h
	st1h	z1.s, p6, [x26, z31.s, sxtw 1]
	addvl	x26, sp, #3
	add	x26, x26, 144
	add	z1.s, z14.s, z3.s
	sub	z14.s, z14.s, z3.s
	add	z3.s, z1.s, z11.s
	str	z3, [x26]
	addvl	x26, sp, #6
	add	x26, x26, 144
	ldr	z4, [x26]
	add	z30.s, z3.s, z4.s
	addvl	x26, sp, #7
	add	x10, x1, 4
	sqrshrnb	z3.h, z30.s, #12
	sub	z12.s, z12.s, z6.s
	uzp1	z4.h, z3.h, z3.h
	add	x26, x26, 144
	sunpklo	z30.s, z4.h
	st1h	z30.s, p6, [x10, z31.s, sxtw 1]
	ldr	z6, [x26]
	add	z4.s, z13.s, z5.s
	sub	z13.s, z13.s, z5.s
	add	z3.s, z4.s, z10.s
	add	z5.s, z3.s, z6.s
	sqrshrnb	z30.h, z5.s, #12
	uzp1	z6.h, z30.h, z30.h
	add	x25, x1, 6
	sunpklo	z5.s, z6.h
	add	z6.s, z13.s, z8.s
	add	z30.s, z6.s, z28.s
	st1h	z5.s, p6, [x25, z31.s, sxtw 1]
	addvl	x25, sp, #8
	sqrshrnb	z5.h, z30.s, #12
	uzp1	z30.h, z5.h, z5.h
	add	x10, x1, 8
	sunpklo	z5.s, z30.h
	add	x25, x25, 144
	st1h	z5.s, p6, [x10, z31.s, sxtw 1]
	ldr	z30, [x25]
	add	z5.s, z14.s, z30.s
	sub	z14.s, z14.s, z30.s
	add	z30.s, z5.s, z27.s
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	sub	z13.s, z13.s, z8.s
	add	x26, x1, 10
	add	z8.s, z12.s, z9.s
	st1h	z30.s, p6, [x26, z31.s, sxtw 1]
	sub	z12.s, z12.s, z9.s
	add	z30.s, z2.s, z7.s
	add	z9.s, z8.s, z25.s
	sub	z2.s, z2.s, z7.s
	add	z7.s, z30.s, z26.s
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	add	x10, x1, 12
	st1h	z7.s, p6, [x10, z31.s, sxtw 1]
	sqrshrnb	z7.h, z9.s, #12
	uzp1	z9.h, z7.h, z7.h
	add	x25, x1, 14
	sunpklo	z7.s, z9.h
	add	z9.s, z12.s, z24.s
	st1h	z7.s, p6, [x25, z31.s, sxtw 1]
	sqrshrnb	z7.h, z9.s, #12
	uzp1	z9.h, z7.h, z7.h
	sub	z4.s, z4.s, z10.s
	add	x26, x1, 16
	add	z10.s, z2.s, z23.s
	sunpklo	z7.s, z9.h
	sqrshrnb	z9.h, z10.s, #12
	st1h	z7.s, p6, [x26, z31.s, sxtw 1]
	add	x25, x1, 18
	uzp1	z7.h, z9.h, z9.h
	add	z9.s, z14.s, z22.s
	sunpklo	z10.s, z7.h
	st1h	z10.s, p6, [x25, z31.s, sxtw 1]
	add	x10, x1, 20
	sqrshrnb	z7.h, z9.s, #12
	uzp1	z10.h, z7.h, z7.h
	sunpklo	z9.s, z10.h
	st1h	z9.s, p6, [x10, z31.s, sxtw 1]
	sub	z1.s, z1.s, z11.s
	add	x26, x1, 22
	add	z11.s, z13.s, z21.s
	sqrshrnb	z7.h, z11.s, #12
	uzp1	z10.h, z7.h, z7.h
	sunpklo	z9.s, z10.h
	st1h	z9.s, p6, [x26, z31.s, sxtw 1]
	add	z11.s, z4.s, z20.s
	add	x25, x1, 24
	sqrshrnb	z7.h, z11.s, #12
	uzp1	z10.h, z7.h, z7.h
	sunpklo	z9.s, z10.h
	st1h	z9.s, p6, [x25, z31.s, sxtw 1]
	add	z11.s, z1.s, z19.s
	add	x10, x1, 26
	sqrshrnb	z7.h, z11.s, #12
	uzp1	z10.h, z7.h, z7.h
	sunpklo	z9.s, z10.h
	st1h	z9.s, p6, [x10, z31.s, sxtw 1]
	add	x26, x1, 28
	sub	z16.s, z0.s, z16.s
	add	z0.s, z16.s, z18.s
	sqrshrnb	z11.h, z0.s, #12
	uzp1	z7.h, z11.h, z11.h
	sunpklo	z10.s, z7.h
	st1h	z10.s, p6, [x26, z31.s, sxtw 1]
	add	x25, sp, 144
	ldr	z9, [x25]
	add	x10, x1, 30
	sub	z15.s, z9.s, z15.s
	add	z0.s, z15.s, z17.s
	sqrshrnb	z11.h, z0.s, #12
	uzp1	z7.h, z11.h, z11.h
	sunpklo	z10.s, z7.h
	st1h	z10.s, p6, [x10, z31.s, sxtw 1]
	add	x26, x1, 32
	sub	z17.s, z15.s, z17.s
	sqrshrnb	z9.h, z17.s, #12
	uzp1	z15.h, z9.h, z9.h
	sunpklo	z0.s, z15.h
	st1h	z0.s, p6, [x26, z31.s, sxtw 1]
	add	x25, x1, 34
	sub	z18.s, z16.s, z18.s
	sqrshrnb	z16.h, z18.s, #12
	uzp1	z11.h, z16.h, z16.h
	sunpklo	z7.s, z11.h
	st1h	z7.s, p6, [x25, z31.s, sxtw 1]
	add	x10, x1, 36
	sub	z19.s, z1.s, z19.s
	sqrshrnb	z1.h, z19.s, #12
	uzp1	z10.h, z1.h, z1.h
	sunpklo	z17.s, z10.h
	st1h	z17.s, p6, [x10, z31.s, sxtw 1]
	add	x26, x1, 38
	sub	z20.s, z4.s, z20.s
	sqrshrnb	z4.h, z20.s, #12
	uzp1	z9.h, z4.h, z4.h
	sunpklo	z15.s, z9.h
	st1h	z15.s, p6, [x26, z31.s, sxtw 1]
	add	x25, x1, 40
	sub	z21.s, z13.s, z21.s
	sqrshrnb	z13.h, z21.s, #12
	uzp1	z0.h, z13.h, z13.h
	sunpklo	z18.s, z0.h
	st1h	z18.s, p6, [x25, z31.s, sxtw 1]
	add	x10, x1, 42
	sub	z22.s, z14.s, z22.s
	sqrshrnb	z14.h, z22.s, #12
	uzp1	z16.h, z14.h, z14.h
	sunpklo	z11.s, z16.h
	st1h	z11.s, p6, [x10, z31.s, sxtw 1]
	add	x26, x1, 44
	add	x25, x1, 46
	sub	z23.s, z2.s, z23.s
	sub	z24.s, z12.s, z24.s
	sqrshrnb	z2.h, z23.s, #12
	sqrshrnb	z12.h, z24.s, #12
	uzp1	z7.h, z2.h, z2.h
	uzp1	z1.h, z12.h, z12.h
	sunpklo	z19.s, z7.h
	sunpklo	z10.s, z1.h
	st1h	z19.s, p6, [x26, z31.s, sxtw 1]
	st1h	z10.s, p6, [x25, z31.s, sxtw 1]
	add	x10, x1, 48
	add	x26, x1, 50
	sub	z25.s, z8.s, z25.s
	sqrshrnb	z8.h, z25.s, #12
	uzp1	z17.h, z8.h, z8.h
	sunpklo	z20.s, z17.h
	st1h	z20.s, p6, [x10, z31.s, sxtw 1]
	sub	z26.s, z30.s, z26.s
	sqrshrnb	z30.h, z26.s, #12
	uzp1	z4.h, z30.h, z30.h
	sunpklo	z9.s, z4.h
	st1h	z9.s, p6, [x26, z31.s, sxtw 1]
	addvl	x26, sp, #7
	add	x25, x1, 52
	add	x26, x26, 144
	sub	z27.s, z5.s, z27.s
	sqrshrnb	z5.h, z27.s, #12
	uzp1	z15.h, z5.h, z5.h
	sunpklo	z21.s, z15.h
	st1h	z21.s, p6, [x25, z31.s, sxtw 1]
	add	x10, x1, 54
	sub	z28.s, z6.s, z28.s
	sqrshrnb	z6.h, z28.s, #12
	uzp1	z13.h, z6.h, z6.h
	sunpklo	z0.s, z13.h
	st1h	z0.s, p6, [x10, z31.s, sxtw 1]
	ldr	z18, [x26]
	addvl	x26, sp, #6
	addvl	x10, sp, #3
	add	x26, x26, 144
	sub	z3.s, z3.s, z18.s
	add	x25, x1, 56
	sqrshrnb	z22.h, z3.s, #12
	add	x10, x10, 144
	uzp1	z14.h, z22.h, z22.h
	sunpklo	z16.s, z14.h
	st1h	z16.s, p6, [x25, z31.s, sxtw 1]
	ldr	z23, [x26]
	addvl	x26, sp, #5
	ldr	z11, [x10]
	add	x25, x1, 58
	addvl	x10, sp, #2
	sub	z2.s, z11.s, z23.s
	add	x26, x26, 144
	sqrshrnb	z7.h, z2.s, #12
	add	x10, x10, 144
	uzp1	z19.h, z7.h, z7.h
	sunpklo	z24.s, z19.h
	st1h	z24.s, p6, [x25, z31.s, sxtw 1]
	ldr	z1, [x26]
	add	x25, x1, 60
	addvl	x26, sp, #4
	ldr	z12, [x10]
	add	x26, x26, 144
	sub	z10.s, z12.s, z1.s
	addvl	x10, sp, #1
	sqrshrnb	z25.h, z10.s, #12
	uzp1	z8.h, z25.h, z25.h
	sunpklo	z17.s, z8.h
	st1h	z17.s, p6, [x25, z31.s, sxtw 1]
	add	x25, x1, 62
	ldr	z26, [x26]
	add	x10, x10, 144
	ldr	z20, [x10]
	addvl	x26, sp, #9
	sub	z30.s, z20.s, z26.s
	sqrshrnb	z4.h, z30.s, #12
	uzp1	z9.h, z4.h, z4.h
	sunpklo	z27.s, z9.h
	st1h	z27.s, p6, [x25, z31.s, sxtw 1]
	addvl	x25, sp, #9
	add	x26, x26, 224
	ldr	z5, [x26]
	add	x25, x25, 352
	ldr	z15, [x25]
	addvl	x26, sp, #9
	addvl	x25, sp, #9
	add	x26, x26, 480
	ldr	z21, [x26]
	add	x25, x25, 608
	ldr	z28, [x25]
	addvl	x26, sp, #9
	addvl	x25, sp, #9
	add	x26, x26, 736
	ldr	z6, [x26]
	add	x25, x25, 864
	ldr	z13, [x25]
	addvl	x26, sp, #9
	addvl	x25, sp, #9
	add	x26, x26, 992
	ldr	z18, [x26]
	add	x25, x25, 1120
	ldr	z22, [x25]
	addvl	x26, sp, #9
	addvl	x25, sp, #9
	add	x26, x26, 1248
	ldr	z16, [x26]
	add	x25, x25, 1376
	ldr	z23, [x25]
	addvl	x26, sp, #9
	addvl	x25, sp, #9
	add	x26, x26, 1504
	ldr	z14, [x26]
	add	x25, x25, 1632
	ldr	z19, [x25]
	addvl	x26, sp, #9
	addvl	x25, sp, #9
	add	x26, x26, 1760
	ldr	z24, [x26]
	add	x25, x25, 1888
	ldr	z12, [x25]
	addvl	x26, sp, #9
	addvl	x25, sp, #9
	add	x26, x26, 2016
	ldr	z10, [x26]
	add	x25, x25, 2144
	ldr	z25, [x25]
	zip1	z0.h, z5.h, z15.h
	adrp	x10, _ZL6CDOT_O
	zip1	z3.h, z21.h, z28.h
	add	x10, x10, :lo12:_ZL6CDOT_O
	zip1	z11.h, z6.h, z13.h
	zip1	z2.h, z18.h, z22.h
	zip1	z7.h, z16.h, z23.h
	zip1	z1.h, z14.h, z19.h
	zip1	z4.h, z24.h, z12.h
	zip1	z5.h, z10.h, z25.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z11.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z30.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z7.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #4
	adrp	x26, _ZL6CDOT_O+256
	add	x10, x10, 144
	add	x25, x26, :lo12:_ZL6CDOT_O+256
	str	z17, [x10]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #5
	adrp	x26, _ZL6CDOT_O+512
	add	x10, x10, 144
	add	x25, x26, :lo12:_ZL6CDOT_O+512
	str	z27, [x10]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #6
	adrp	x26, _ZL6CDOT_O+768
	add	x10, x10, 144
	add	x25, x26, :lo12:_ZL6CDOT_O+768
	str	z26, [x10]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z30.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z5.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+1024
	add	x26, x10, :lo12:_ZL6CDOT_O+1024
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z3.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z11.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z2.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z7.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z1.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z4.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z5.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x25, sp, #7
	adrp	x10, _ZL6CDOT_O+1280
	add	x25, x25, 144
	add	x26, x10, :lo12:_ZL6CDOT_O+1280
	str	z6, [x25]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x25, _ZL6CDOT_O+1536
	add	x10, x25, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x26, _ZL6CDOT_O+1792
	add	x25, x26, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x25, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x25, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x25, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x25, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x25, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x25, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x25, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x25, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+2048
	add	x26, x10, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x26, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x26, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x26, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x26, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x26, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z7.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x26, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x26, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x26, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z7.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z7.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z7.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x4, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x4, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x4, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x4, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x4, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x4, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x4, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x4, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z3.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z11.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z7.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z5.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x9, sp, #9
	addvl	x8, sp, #9
	addvl	x7, sp, #9
	addvl	x6, sp, #9
	addvl	x5, sp, #9
	addvl	x4, sp, #9
	addvl	x3, sp, #9
	addvl	x25, sp, #9
	add	x9, x9, 288
	ldr	z5, [x9]
	add	x8, x8, 544
	ldr	z28, [x8]
	add	x7, x7, 800
	ldr	z13, [x7]
	add	x6, x6, 1056
	ldr	z16, [x6]
	add	x5, x5, 1312
	ldr	z12, [x5]
	add	x4, x4, 1568
	ldr	z10, [x4]
	add	x3, x3, 1824
	ldr	z14, [x3]
	add	x25, x25, 2080
	ldr	z8, [x25]
	zip1	z0.h, z5.h, z28.h
	zip1	z6.h, z13.h, z16.h
	zip1	z3.h, z12.h, z10.h
	zip1	z2.h, z14.h, z8.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z3.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z2.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z0.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z3.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z3.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z3.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z3.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	addvl	x11, sp, #9
	addvl	x10, sp, #9
	addvl	x26, sp, #9
	add	x0, x0, 416
	ldr	z2, [x0]
	add	x11, x11, 928
	ldr	z7, [x11]
	add	x10, x10, 1440
	ldr	z1, [x10]
	add	x26, x26, 1952
	ldr	z4, [x26]
	zip1	z28.h, z2.h, z7.h
	zip1	z14.h, z1.h, z4.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z28.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z28.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z14.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z28.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z14.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z28.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x9, sp, #9
	addvl	x8, sp, #9
	add	x9, x9, 672
	ldr	z14, [x9]
	add	x8, x8, 1696
	ldr	z3, [x8]
	zip1	z0.h, z14.h, z3.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z0.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z0.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x7, sp, #9
	addvl	x6, sp, #9
	add	x7, x7, 160
	ldr	z28, [x7]
	add	x6, x6, 1184
	ldr	z14, [x6]
	zip1	z1.h, z28.h, z14.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z28.h
// 0 "" 2
#NO_APP
	add	z1.s, z14.s, z3.s
	addvl	x11, sp, #4
	add	z0.s, z1.s, z7.s
	add	x4, sp, 144
	add	z28.s, z0.s, z15.s
	addvl	x3, sp, #1
	add	x11, x11, 144
	str	z0, [x4]
	ldr	z0, [x11]
	lsl	x5, x2, 4
	add	x3, x3, 144
	str	z28, [x3]
	addvl	x6, sp, #5
	add	z28.s, z28.s, z0.s
	sqrshrnb	z0.h, z28.s, #12
	add	x0, x5, 2
	sub	z14.s, z14.s, z3.s
	add	x25, x1, x2, lsl 4
	addvl	x7, sp, #2
	add	x6, x6, 144
	uzp1	z28.h, z0.h, z0.h
	sunpklo	z0.s, z28.h
	st1h	z0.s, p6, [x25, z31.s, sxtw 1]
	ldr	z3, [x6]
	add	x10, x1, x0
	add	x26, x0, 2
	add	z0.s, z29.s, z2.s
	add	x7, x7, 144
	sub	z29.s, z29.s, z2.s
	add	z2.s, z0.s, z5.s
	mov	z28.d, z2.d
	add	z2.s, z2.s, z16.s
	str	z2, [x7]
	add	z2.s, z2.s, z3.s
	sqrshrnb	z3.h, z2.s, #12
	add	x9, x1, x26
	uzp1	z2.h, z3.h, z3.h
	addvl	x26, sp, #6
	sunpklo	z3.s, z2.h
	st1h	z3.s, p6, [x10, z31.s, sxtw 1]
	addvl	x10, sp, #3
	add	z3.s, z29.s, z4.s
	add	x10, x10, 144
	add	z2.s, z3.s, z13.s
	sub	z29.s, z29.s, z4.s
	add	x26, x26, 144
	ldr	z4, [x26]
	str	z2, [x10]
	add	z2.s, z2.s, z4.s
	sqrshrnb	z4.h, z2.s, #12
	sub	z0.s, z0.s, z5.s
	uzp1	z2.h, z4.h, z4.h
	add	z5.s, z14.s, z6.s
	sunpklo	z4.s, z2.h
	sub	z14.s, z14.s, z6.s
	add	z2.s, z5.s, z12.s
	add	z6.s, z2.s, z30.s
	st1h	z4.s, p6, [x9, z31.s, sxtw 1]
	add	x8, x0, 4
	addvl	x6, sp, #7
	sqrshrnb	z4.h, z6.s, #12
	uzp1	z6.h, z4.h, z4.h
	add	x4, x1, x8
	sunpklo	z4.s, z6.h
	add	x6, x6, 144
	st1h	z4.s, p6, [x4, z31.s, sxtw 1]
	ldr	z6, [x6]
	sub	z1.s, z1.s, z7.s
	add	z7.s, z14.s, z11.s
	add	z4.s, z7.s, z6.s
	sqrshrnb	z6.h, z4.s, #12
	add	x5, x0, 6
	uzp1	z4.h, z6.h, z6.h
	sunpklo	z6.s, z4.h
	add	x3, x1, x5
	add	x11, x0, 8
	st1h	z6.s, p6, [x3, z31.s, sxtw 1]
	add	z6.s, z29.s, z8.s
	sub	z29.s, z29.s, z8.s
	add	z4.s, z6.s, z27.s
	add	z8.s, z0.s, z9.s
	sqrshrnb	z4.h, z4.s, #12
	sub	z0.s, z0.s, z9.s
	uzp1	z4.h, z4.h, z4.h
	add	z9.s, z8.s, z26.s
	sunpklo	z4.s, z4.h
	add	x8, x1, x11
	st1h	z4.s, p6, [x8, z31.s, sxtw 1]
	sqrshrnb	z4.h, z9.s, #12
	uzp1	z9.h, z4.h, z4.h
	add	x9, x0, 10
	sunpklo	z4.s, z9.h
	add	z9.s, z1.s, z10.s
	sub	z1.s, z1.s, z10.s
	add	z10.s, z9.s, z25.s
	add	x7, x1, x9
	lsl	x26, x2, 4
	st1h	z4.s, p6, [x7, z31.s, sxtw 1]
	add	x4, x0, 12
	sqrshrnb	z4.h, z10.s, #12
	uzp1	z10.h, z4.h, z4.h
	add	x11, x1, x4
	sub	z14.s, z14.s, z11.s
	add	x5, x26, 16
	add	z11.s, z1.s, z24.s
	sunpklo	z4.s, z10.h
	sqrshrnb	z10.h, z11.s, #12
	st1h	z4.s, p6, [x11, z31.s, sxtw 1]
	add	x10, x1, x5
	add	x3, x0, 16
	uzp1	z4.h, z10.h, z10.h
	add	z10.s, z0.s, z23.s
	sunpklo	z11.s, z4.h
	st1h	z11.s, p6, [x10, z31.s, sxtw 1]
	add	x8, x1, x3
	add	x9, x0, 18
	sqrshrnb	z4.h, z10.s, #12
	uzp1	z11.h, z4.h, z4.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x8, z31.s, sxtw 1]
	add	x7, x1, x9
	sub	z5.s, z5.s, z12.s
	add	x4, x0, 20
	add	z12.s, z29.s, z22.s
	sqrshrnb	z4.h, z12.s, #12
	uzp1	z11.h, z4.h, z4.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x7, z31.s, sxtw 1]
	add	x6, x1, x4
	add	z12.s, z14.s, z21.s
	add	x11, x0, 22
	sqrshrnb	z4.h, z12.s, #12
	uzp1	z11.h, z4.h, z4.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x6, z31.s, sxtw 1]
	add	x5, x1, x11
	add	z12.s, z5.s, z20.s
	add	x10, x0, 24
	sqrshrnb	z4.h, z12.s, #12
	uzp1	z11.h, z4.h, z4.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x5, z31.s, sxtw 1]
	add	x8, x1, x10
	add	x3, x0, 26
	sub	z3.s, z3.s, z13.s
	add	z13.s, z3.s, z19.s
	sqrshrnb	z12.h, z13.s, #12
	uzp1	z4.h, z12.h, z12.h
	sunpklo	z11.s, z4.h
	st1h	z11.s, p6, [x8, z31.s, sxtw 1]
	add	x9, x1, x3
	add	x7, x0, 28
	sub	z16.s, z28.s, z16.s
	add	z28.s, z16.s, z18.s
	sqrshrnb	z10.h, z28.s, #12
	uzp1	z13.h, z10.h, z10.h
	sunpklo	z12.s, z13.h
	st1h	z12.s, p6, [x9, z31.s, sxtw 1]
	add	x6, x1, x7
	add	x4, sp, 144
	ldr	z4, [x4]
	add	x11, x26, 32
	sub	z15.s, z4.s, z15.s
	add	z11.s, z15.s, z17.s
	sqrshrnb	z28.h, z11.s, #12
	uzp1	z10.h, z28.h, z28.h
	sunpklo	z13.s, z10.h
	st1h	z13.s, p6, [x6, z31.s, sxtw 1]
	add	x5, x1, x11
	add	x10, x0, 32
	sub	z17.s, z15.s, z17.s
	sqrshrnb	z12.h, z17.s, #12
	uzp1	z4.h, z12.h, z12.h
	sunpklo	z15.s, z4.h
	st1h	z15.s, p6, [x5, z31.s, sxtw 1]
	add	x8, x1, x10
	add	x3, x0, 34
	sub	z18.s, z16.s, z18.s
	sqrshrnb	z16.h, z18.s, #12
	uzp1	z11.h, z16.h, z16.h
	sunpklo	z28.s, z11.h
	st1h	z28.s, p6, [x8, z31.s, sxtw 1]
	add	x9, x1, x3
	add	x7, x0, 36
	sub	z19.s, z3.s, z19.s
	sqrshrnb	z3.h, z19.s, #12
	uzp1	z10.h, z3.h, z3.h
	sunpklo	z13.s, z10.h
	st1h	z13.s, p6, [x9, z31.s, sxtw 1]
	add	x4, x1, x7
	add	x6, x0, 38
	sub	z20.s, z5.s, z20.s
	sqrshrnb	z5.h, z20.s, #12
	uzp1	z17.h, z5.h, z5.h
	sunpklo	z12.s, z17.h
	st1h	z12.s, p6, [x4, z31.s, sxtw 1]
	add	x11, x1, x6
	add	x5, x0, 40
	sub	z21.s, z14.s, z21.s
	sqrshrnb	z14.h, z21.s, #12
	uzp1	z4.h, z14.h, z14.h
	sunpklo	z15.s, z4.h
	st1h	z15.s, p6, [x11, z31.s, sxtw 1]
	add	x10, x1, x5
	add	x8, x0, 42
	sub	z22.s, z29.s, z22.s
	sqrshrnb	z29.h, z22.s, #12
	uzp1	z18.h, z29.h, z29.h
	sunpklo	z16.s, z18.h
	st1h	z16.s, p6, [x10, z31.s, sxtw 1]
	add	x3, x1, x8
	add	x9, x0, 44
	sub	z23.s, z0.s, z23.s
	add	x4, x26, 48
	sqrshrnb	z0.h, z23.s, #12
	uzp1	z11.h, z0.h, z0.h
	sunpklo	z28.s, z11.h
	st1h	z28.s, p6, [x3, z31.s, sxtw 1]
	add	x7, x1, x9
	add	x6, x1, x4
	add	x11, x0, 48
	sub	z24.s, z1.s, z24.s
	sub	z25.s, z9.s, z25.s
	sqrshrnb	z1.h, z24.s, #12
	sqrshrnb	z9.h, z25.s, #12
	uzp1	z19.h, z1.h, z1.h
	uzp1	z10.h, z9.h, z9.h
	sunpklo	z3.s, z19.h
	sunpklo	z13.s, z10.h
	st1h	z3.s, p6, [x7, z31.s, sxtw 1]
	st1h	z13.s, p6, [x6, z31.s, sxtw 1]
	add	x5, x1, x11
	add	x10, x0, 50
	sub	z26.s, z8.s, z26.s
	sqrshrnb	z8.h, z26.s, #12
	uzp1	z20.h, z8.h, z8.h
	sunpklo	z5.s, z20.h
	st1h	z5.s, p6, [x5, z31.s, sxtw 1]
	add	x8, x1, x10
	add	x9, x0, 52
	addvl	x3, sp, #7
	sub	z27.s, z6.s, z27.s
	sqrshrnb	z6.h, z27.s, #12
	uzp1	z17.h, z6.h, z6.h
	sunpklo	z12.s, z17.h
	st1h	z12.s, p6, [x8, z31.s, sxtw 1]
	add	x7, x1, x9
	add	x4, x0, 54
	sub	z30.s, z2.s, z30.s
	add	x3, x3, 144
	ldr	z21, [x3]
	sub	z7.s, z7.s, z21.s
	sqrshrnb	z14.h, z7.s, #12
	uzp1	z4.h, z14.h, z14.h
	sunpklo	z15.s, z4.h
	st1h	z15.s, p6, [x7, z31.s, sxtw 1]
	add	x6, x1, x4
	add	x11, x0, 56
	sqrshrnb	z2.h, z30.s, #12
	addvl	x5, sp, #3
	uzp1	z22.h, z2.h, z2.h
	addvl	x10, sp, #6
	sunpklo	z29.s, z22.h
	st1h	z29.s, p6, [x6, z31.s, sxtw 1]
	add	x8, x1, x11
	add	x9, x0, 58
	add	x5, x5, 144
	ldr	z18, [x5]
	add	x10, x10, 144
	ldr	z16, [x10]
	addvl	x3, sp, #2
	sub	z23.s, z18.s, z16.s
	addvl	x4, sp, #5
	sqrshrnb	z0.h, z23.s, #12
	add	x0, x0, 60
	uzp1	z11.h, z0.h, z0.h
	addvl	x6, sp, #1
	sunpklo	z28.s, z11.h
	addvl	x11, sp, #4
	st1h	z28.s, p6, [x8, z31.s, sxtw 1]
	add	x7, x1, x9
	add	x5, x1, x0
	add	x3, x3, 144
	ldr	z24, [x3]
	add	x4, x4, 144
	ldr	z1, [x4]
	add	x6, x6, 144
	sub	z19.s, z24.s, z1.s
	add	x11, x11, 144
	sqrshrnb	z3.h, z19.s, #12
	adrp	x10, _ZL6CDOT_O
	uzp1	z25.h, z3.h, z3.h
	sunpklo	z9.s, z25.h
	st1h	z9.s, p6, [x7, z31.s, sxtw 1]
	ldr	z10, [x6]
	ldr	z13, [x11]
	add	x9, x10, :lo12:_ZL6CDOT_O
	addvl	x8, sp, #9
	sub	z26.s, z10.s, z13.s
	addvl	x3, sp, #9
	sqrshrnb	z8.h, z26.s, #12
	addvl	x7, sp, #9
	uzp1	z20.h, z8.h, z8.h
	addvl	x0, sp, #9
	sunpklo	z5.s, z20.h
	addvl	x6, sp, #9
	st1h	z5.s, p6, [x5, z31.s, sxtw 1]
	addvl	x11, sp, #9
	addvl	x5, sp, #9
	addvl	x10, sp, #9
	add	x8, x8, 240
	add	x3, x3, 368
	ldr	z27, [x8]
	add	x7, x7, 496
	add	x0, x0, 624
	ldr	z6, [x3]
	add	x6, x6, 752
	add	x11, x11, 880
	ldr	z17, [x7]
	add	x5, x5, 1008
	add	x10, x10, 1136
	ldr	z21, [x0]
	ldr	z12, [x6]
	ldr	z14, [x11]
	ldr	z15, [x5]
	ldr	z30, [x10]
	addvl	x8, sp, #9
	addvl	x3, sp, #9
	addvl	x7, sp, #9
	addvl	x0, sp, #9
	zip1	z7.h, z27.h, z6.h
	addvl	x6, sp, #9
	addvl	x11, sp, #9
	zip1	z4.h, z17.h, z21.h
	addvl	x5, sp, #9
	addvl	x10, sp, #9
	zip1	z2.h, z12.h, z14.h
	add	x8, x8, 1264
	ldr	z22, [x8]
	add	x3, x3, 1392
	ldr	z29, [x3]
	add	x7, x7, 1520
	ldr	z18, [x7]
	add	x0, x0, 1648
	ldr	z23, [x0]
	add	x6, x6, 1776
	ldr	z16, [x6]
	add	x11, x11, 1904
	ldr	z11, [x11]
	add	x5, x5, 2032
	ldr	z28, [x5]
	add	x10, x10, 2160
	ldr	z24, [x10]
	zip1	z0.h, z15.h, z30.h
	zip1	z1.h, z22.h, z29.h
	zip1	z3.h, z18.h, z23.h
	zip1	z8.h, z16.h, z11.h
	zip1	z5.h, z28.h, z24.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d30, #0
	mov	z25.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z6.h
// 0 "" 2
#NO_APP
	str	z25, [x4]
	adrp	x4, _ZL6CDOT_O+256
	add	x7, x4, :lo12:_ZL6CDOT_O+256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z18.h
// 0 "" 2
#NO_APP
	addvl	x8, sp, #6
	adrp	x3, _ZL6CDOT_O+512
	add	x8, x8, 144
	add	x6, x3, :lo12:_ZL6CDOT_O+512
	str	z27, [x8]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	adrp	x11, _ZL6CDOT_O+768
	add	x0, x0, 144
	add	x5, x11, :lo12:_ZL6CDOT_O+768
	str	z26, [x0]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #8
	adrp	x4, _ZL6CDOT_O+1024
	add	x10, x10, 144
	add	x3, x4, :lo12:_ZL6CDOT_O+1024
	str	z25, [x10]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z29.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z7.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z4.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z2.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z0.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z3.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z8.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z5.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+1280
	add	x0, x8, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z7.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x0, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x0, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z3.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x0, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z8.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x0, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z5.h, z6.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+1536
	add	x10, x11, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z3.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z8.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z5.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+1792
	add	x0, x4, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x0, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x0, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x0, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z8.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x0, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z5.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+2048
	add	x10, x11, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z5.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+2304
	add	x0, x4, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z7.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x0, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x0, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z3.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x0, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z8.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x0, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z5.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+2560
	add	x10, x11, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z7.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z8.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z5.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+2816
	add	x0, x4, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z7.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x0, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x0, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x0, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x0, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z5.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+3072
	add	x10, x11, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z7.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z3.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z8.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z5.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+3328
	add	x0, x4, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z7.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x0, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x0, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z3.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x0, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z8.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x0, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z5.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+3584
	add	x10, x11, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z7.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x10, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x10, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z3.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x10, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z8.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x10, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z5.h, z6.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+3840
	add	x0, x4, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x0, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x0, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z3.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x0, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z8.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x0, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z5.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x11, sp, #9
	addvl	x4, sp, #9
	add	x11, x11, 304
	add	x4, x4, 560
	ldr	z5, [x11]
	ldr	z12, [x4]
	addvl	x0, sp, #9
	addvl	x11, sp, #9
	addvl	x4, sp, #9
	add	x0, x0, 816
	ldr	z15, [x0]
	add	x11, x11, 1072
	add	x4, x4, 1328
	ldr	z16, [x11]
	ldr	z14, [x4]
	addvl	x0, sp, #9
	addvl	x11, sp, #9
	addvl	x4, sp, #9
	add	x0, x0, 1584
	ldr	z11, [x0]
	add	x11, x11, 1840
	ldr	z9, [x11]
	add	x4, x4, 2096
	ldr	z10, [x4]
	adrp	x10, .LANCHOR0
	zip1	z6.h, z5.h, z12.h
	zip1	z13.h, z15.h, z16.h
	zip1	z4.h, z14.h, z11.h
	add	x10, x10, :lo12:.LANCHOR0
	zip1	z2.h, z9.h, z10.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z13.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z4.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z13.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z4.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z13.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z4.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z13.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z4.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x13, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x13, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x13, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z4.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x13, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z13.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z4.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x10, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x16, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x16, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z13.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x16, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z4.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x16, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x15, sp, #9
	addvl	x14, sp, #9
	addvl	x13, sp, #9
	addvl	x12, sp, #9
	add	x15, x15, 432
	ldr	z2, [x15]
	add	x14, x14, 944
	ldr	z1, [x14]
	add	x13, x13, 1456
	ldr	z3, [x13]
	add	x12, x12, 1968
	ldr	z5, [x12]
	zip1	z14.h, z2.h, z1.h
	zip1	z15.h, z3.h, z5.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z14.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z15.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z14.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z15.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z14.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z14.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	addvl	x11, sp, #9
	add	x0, x0, 688
	ldr	z15, [x0]
	add	x11, x11, 1712
	ldr	z2, [x11]
	zip1	z13.h, z15.h, z2.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z0.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z13.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z1.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z13.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x4, sp, #9
	addvl	x10, sp, #9
	add	x4, x4, 176
	ldr	z2, [x4]
	add	x10, x10, 1200
	ldr	z15, [x10]
	zip1	z13.h, z2.h, z15.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z13.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z13.h, z2.h
// 0 "" 2
#NO_APP
	add	z13.s, z14.s, z0.s
	lsl	x16, x2, 5
	add	z2.s, z13.s, z6.s
	addvl	x14, sp, #1
	addvl	x4, sp, #5
	sub	z14.s, z14.s, z0.s
	add	x0, x16, 2
	add	x15, sp, 144
	str	z13, [x15]
	add	x14, x14, 144
	add	z13.s, z2.s, z16.s
	addvl	x11, sp, #2
	add	x4, x4, 144
	str	z2, [x14]
	ldr	z2, [x4]
	add	x12, x0, 2
	add	x11, x11, 144
	str	z13, [x11]
	add	z13.s, z13.s, z2.s
	sqrshrnb	z2.h, z13.s, #12
	add	x10, x1, x12
	uzp1	z13.h, z2.h, z2.h
	addvl	x12, sp, #6
	sunpklo	z2.s, z13.h
	add	x25, x25, x26
	addvl	x15, sp, #3
	st1h	z2.s, p6, [x25, z31.s, sxtw 1]
	add	x12, x12, 144
	add	z2.s, z15.s, z1.s
	sub	z15.s, z15.s, z1.s
	ldr	z1, [x12]
	add	z0.s, z2.s, z4.s
	add	x15, x15, 144
	add	z13.s, z0.s, z17.s
	str	z13, [x15]
	add	z13.s, z13.s, z1.s
	sqrshrnb	z1.h, z13.s, #12
	addvl	x15, sp, #4
	addvl	x12, sp, #7
	uzp1	z13.h, z1.h, z1.h
	sunpklo	z1.s, z13.h
	add	x13, x1, x0
	add	x14, x0, 6
	st1h	z1.s, p6, [x13, z31.s, sxtw 1]
	sub	z2.s, z2.s, z4.s
	add	z1.s, z15.s, z3.s
	add	x15, x15, 144
	sub	z15.s, z15.s, z3.s
	add	x12, x12, 144
	ldr	z4, [x12]
	add	z3.s, z1.s, z12.s
	add	z13.s, z3.s, z4.s
	add	x4, x1, x14
	add	x14, x0, 10
	str	z3, [x15]
	sqrshrnb	z3.h, z13.s, #12
	addvl	x15, sp, #8
	uzp1	z4.h, z3.h, z3.h
	sunpklo	z13.s, z4.h
	add	x15, x15, 144
	st1h	z13.s, p6, [x10, z31.s, sxtw 1]
	add	z4.s, z14.s, z5.s
	add	x10, x1, x14
	sub	z14.s, z14.s, z5.s
	add	x14, sp, 144
	ldr	z5, [x14]
	sub	z13.s, z5.s, z6.s
	ldr	z6, [x15]
	add	z3.s, z4.s, z11.s
	add	z5.s, z3.s, z6.s
	sqrshrnb	z6.h, z5.s, #12
	add	x16, x0, 4
	uzp1	z5.h, z6.h, z6.h
	sunpklo	z6.s, z5.h
	add	x11, x1, x16
	st1h	z6.s, p6, [x11, z31.s, sxtw 1]
	add	z6.s, z14.s, z9.s
	add	z5.s, z6.s, z29.s
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x13, x0, 8
	st1h	z5.s, p6, [x4, z31.s, sxtw 1]
	add	z5.s, z15.s, z7.s
	sub	z15.s, z15.s, z7.s
	add	z7.s, z5.s, z28.s
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	add	x16, x1, x13
	sub	z14.s, z14.s, z9.s
	st1h	z7.s, p6, [x16, z31.s, sxtw 1]
	add	z9.s, z13.s, z10.s
	add	z7.s, z2.s, z8.s
	sub	z13.s, z13.s, z10.s
	sub	z2.s, z2.s, z8.s
	add	z10.s, z9.s, z26.s
	add	z8.s, z7.s, z27.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x10, z31.s, sxtw 1]
	sqrshrnb	z8.h, z10.s, #12
	uzp1	z10.h, z8.h, z8.h
	add	x13, x0, 12
	sunpklo	z8.s, z10.h
	add	z10.s, z13.s, z25.s
	add	x15, x1, x13
	add	x11, x0, 14
	st1h	z8.s, p6, [x15, z31.s, sxtw 1]
	sqrshrnb	z8.h, z10.s, #12
	uzp1	z10.h, z8.h, z8.h
	add	x4, x1, x11
	sub	z4.s, z4.s, z11.s
	add	x13, x0, 16
	add	z11.s, z2.s, z24.s
	sunpklo	z8.s, z10.h
	sqrshrnb	z10.h, z11.s, #12
	st1h	z8.s, p6, [x4, z31.s, sxtw 1]
	add	x14, x1, x13
	add	x12, x0, 18
	uzp1	z8.h, z10.h, z10.h
	add	z10.s, z15.s, z23.s
	sunpklo	z11.s, z8.h
	st1h	z11.s, p6, [x14, z31.s, sxtw 1]
	add	x16, x1, x12
	add	x10, x0, 20
	sqrshrnb	z8.h, z10.s, #12
	uzp1	z11.h, z8.h, z8.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x16, z31.s, sxtw 1]
	add	x15, x1, x10
	sub	z1.s, z1.s, z12.s
	add	x11, x0, 22
	add	z12.s, z14.s, z22.s
	sqrshrnb	z8.h, z12.s, #12
	uzp1	z11.h, z8.h, z8.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x15, z31.s, sxtw 1]
	add	x4, x1, x11
	add	z12.s, z4.s, z21.s
	add	x13, x0, 24
	sqrshrnb	z8.h, z12.s, #12
	uzp1	z11.h, z8.h, z8.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x4, z31.s, sxtw 1]
	add	x12, x1, x13
	add	z12.s, z1.s, z20.s
	add	x14, x0, 26
	sqrshrnb	z8.h, z12.s, #12
	uzp1	z11.h, z8.h, z8.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x12, z31.s, sxtw 1]
	add	x16, x1, x14
	add	x10, x0, 28
	sub	z17.s, z0.s, z17.s
	addvl	x15, sp, #1
	add	z0.s, z17.s, z19.s
	sqrshrnb	z12.h, z0.s, #12
	uzp1	z8.h, z12.h, z12.h
	sunpklo	z11.s, z8.h
	st1h	z11.s, p6, [x16, z31.s, sxtw 1]
	add	x4, x1, x10
	add	x11, x1, x2, lsl 5
	sub	z19.s, z17.s, z19.s
	add	x15, x15, 144
	ldr	z10, [x15]
	sub	z16.s, z10.s, z16.s
	add	z0.s, z16.s, z18.s
	sqrshrnb	z12.h, z0.s, #12
	uzp1	z8.h, z12.h, z12.h
	sunpklo	z11.s, z8.h
	st1h	z11.s, p6, [x4, z31.s, sxtw 1]
	add	x13, x11, 32
	add	x12, x0, 32
	sub	z18.s, z16.s, z18.s
	sqrshrnb	z10.h, z18.s, #12
	uzp1	z16.h, z10.h, z10.h
	sunpklo	z0.s, z16.h
	st1h	z0.s, p6, [x13, z31.s, sxtw 1]
	add	x14, x1, x12
	add	x16, x0, 34
	sqrshrnb	z17.h, z19.s, #12
	uzp1	z12.h, z17.h, z17.h
	sunpklo	z8.s, z12.h
	st1h	z8.s, p6, [x14, z31.s, sxtw 1]
	add	x10, x1, x16
	add	x15, x0, 36
	sub	z20.s, z1.s, z20.s
	sqrshrnb	z1.h, z20.s, #12
	uzp1	z11.h, z1.h, z1.h
	sunpklo	z18.s, z11.h
	st1h	z18.s, p6, [x10, z31.s, sxtw 1]
	add	x4, x1, x15
	add	x11, x0, 38
	sub	z21.s, z4.s, z21.s
	sqrshrnb	z4.h, z21.s, #12
	uzp1	z10.h, z4.h, z4.h
	sunpklo	z16.s, z10.h
	st1h	z16.s, p6, [x4, z31.s, sxtw 1]
	add	x13, x1, x11
	add	x12, x0, 40
	add	x16, x0, 42
	sub	z22.s, z14.s, z22.s
	sqrshrnb	z14.h, z22.s, #12
	uzp1	z0.h, z14.h, z14.h
	sunpklo	z19.s, z0.h
	st1h	z19.s, p6, [x13, z31.s, sxtw 1]
	add	x14, x1, x12
	add	x10, x1, x16
	add	x15, x0, 44
	sub	z23.s, z15.s, z23.s
	sub	z24.s, z2.s, z24.s
	sqrshrnb	z15.h, z23.s, #12
	sqrshrnb	z2.h, z24.s, #12
	uzp1	z17.h, z15.h, z15.h
	uzp1	z8.h, z2.h, z2.h
	sunpklo	z12.s, z17.h
	sunpklo	z20.s, z8.h
	st1h	z12.s, p6, [x14, z31.s, sxtw 1]
	st1h	z20.s, p6, [x10, z31.s, sxtw 1]
	add	x4, x1, x15
	add	x11, x0, 46
	sub	z25.s, z13.s, z25.s
	sqrshrnb	z13.h, z25.s, #12
	uzp1	z1.h, z13.h, z13.h
	sunpklo	z11.s, z1.h
	st1h	z11.s, p6, [x4, z31.s, sxtw 1]
	add	x13, x1, x11
	add	x12, x0, 48
	sub	z26.s, z9.s, z26.s
	sqrshrnb	z9.h, z26.s, #12
	uzp1	z18.h, z9.h, z9.h
	sunpklo	z21.s, z18.h
	st1h	z21.s, p6, [x13, z31.s, sxtw 1]
	add	x14, x1, x12
	add	x16, x0, 50
	sub	z27.s, z7.s, z27.s
	sqrshrnb	z7.h, z27.s, #12
	uzp1	z4.h, z7.h, z7.h
	sunpklo	z10.s, z4.h
	st1h	z10.s, p6, [x14, z31.s, sxtw 1]
	add	x10, x1, x16
	add	x15, x0, 52
	sub	z28.s, z5.s, z28.s
	sqrshrnb	z5.h, z28.s, #12
	uzp1	z16.h, z5.h, z5.h
	sunpklo	z22.s, z16.h
	st1h	z22.s, p6, [x10, z31.s, sxtw 1]
	add	x4, x1, x15
	add	x11, x0, 54
	sub	z29.s, z6.s, z29.s
	add	x12, x0, 56
	sqrshrnb	z6.h, z29.s, #12
	addvl	x13, sp, #8
	uzp1	z14.h, z6.h, z6.h
	sunpklo	z0.s, z14.h
	st1h	z0.s, p6, [x4, z31.s, sxtw 1]
	add	x14, x1, x11
	add	x15, x1, x12
	add	x4, x0, 58
	add	x13, x13, 144
	ldr	z19, [x13]
	addvl	x16, sp, #4
	sub	z3.s, z3.s, z19.s
	addvl	x10, sp, #7
	sqrshrnb	z23.h, z3.s, #12
	uzp1	z15.h, z23.h, z23.h
	sunpklo	z17.s, z15.h
	st1h	z17.s, p6, [x14, z31.s, sxtw 1]
	add	x16, x16, 144
	ldr	z12, [x16]
	add	x14, x1, x4
	add	x10, x10, 144
	ldr	z24, [x10]
	addvl	x11, sp, #3
	sub	z2.s, z12.s, z24.s
	addvl	x13, sp, #6
	sqrshrnb	z8.h, z2.s, #12
	add	x0, x0, 60
	uzp1	z20.h, z8.h, z8.h
	addvl	x12, sp, #2
	sunpklo	z25.s, z20.h
	addvl	x4, sp, #9
	st1h	z25.s, p6, [x15, z31.s, sxtw 1]
	addvl	x15, sp, #9
	add	x10, x1, x0
	add	x11, x11, 144
	ldr	z13, [x11]
	add	x13, x13, 144
	ldr	z1, [x13]
	add	x12, x12, 144
	sub	z11.s, z13.s, z1.s
	addvl	x16, sp, #5
	sqrshrnb	z26.h, z11.s, #12
	add	x15, x15, 256
	uzp1	z9.h, z26.h, z26.h
	add	x4, x4, 384
	sunpklo	z18.s, z9.h
	st1h	z18.s, p6, [x14, z31.s, sxtw 1]
	ldr	z21, [x12]
	add	x16, x16, 144
	ldr	z27, [x16]
	addvl	x11, sp, #9
	sub	z7.s, z21.s, z27.s
	addvl	x14, sp, #9
	sqrshrnb	z4.h, z7.s, #12
	addvl	x0, sp, #9
	uzp1	z10.h, z4.h, z4.h
	addvl	x12, sp, #9
	sunpklo	z28.s, z10.h
	st1h	z28.s, p6, [x10, z31.s, sxtw 1]
	ldr	z5, [x15]
	ldr	z16, [x4]
	addvl	x10, sp, #9
	addvl	x15, sp, #9
	zip1	z6.h, z5.h, z16.h
	addvl	x4, sp, #9
	add	x11, x11, 512
	ldr	z22, [x11]
	add	x14, x14, 640
	add	x0, x0, 768
	ldr	z29, [x14]
	add	x12, x12, 896
	add	x10, x10, 1024
	ldr	z14, [x0]
	add	x15, x15, 1152
	add	x4, x4, 1280
	ldr	z19, [x12]
	ldr	z3, [x10]
	ldr	z23, [x15]
	ldr	z15, [x4]
	addvl	x11, sp, #9
	addvl	x14, sp, #9
	zip1	z0.h, z22.h, z29.h
	addvl	x0, sp, #9
	addvl	x12, sp, #9
	zip1	z2.h, z14.h, z19.h
	addvl	x10, sp, #9
	addvl	x15, sp, #9
	zip1	z12.h, z3.h, z23.h
	addvl	x4, sp, #9
	add	x11, x11, 1408
	ldr	z17, [x11]
	add	x14, x14, 1536
	ldr	z24, [x14]
	add	x0, x0, 1664
	ldr	z8, [x0]
	add	x12, x12, 1792
	ldr	z20, [x12]
	add	x10, x10, 1920
	ldr	z25, [x10]
	add	x15, x15, 2048
	ldr	z11, [x15]
	add	x4, x4, 2176
	ldr	z26, [x4]
	zip1	z13.h, z15.h, z17.h
	zip1	z1.h, z24.h, z8.h
	zip1	z7.h, z20.h, z25.h
	zip1	z4.h, z11.h, z26.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z28.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z22.h
// 0 "" 2
#NO_APP
	str	z18, [x16]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z27.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z24.h
// 0 "" 2
#NO_APP
	str	z27, [x13]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x9, sp, #7
	add	x9, x9, 144
	str	z26, [x9]
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z28.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z0.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z2.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z29.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z1.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z7.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z4.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z2.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z27.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z1.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z7.h, z25.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z4.h, z11.h
// 0 "" 2
#NO_APP
	add	x7, x8, :lo12:_ZL6CDOT_O+1280
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x7, #0, MUL VL]
// 0 "" 2
#NO_APP
	movi	d29, #0
	mov	z27.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x7, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z0.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x7, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z2.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x7, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p7/z, [x7, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z26.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x7, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z1.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x7, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z7.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x7, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z4.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+1536
	add	x5, x6, :lo12:_ZL6CDOT_O+1536
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x5, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z26.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x5, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z0.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x5, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z2.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x5, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x5, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x5, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z1.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p7/z, [x5, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z7.h, z24.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x5, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z4.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1792
	add	x8, x3, :lo12:_ZL6CDOT_O+1792
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z25.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z6.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x8, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x8, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x8, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z7.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x8, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z4.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+2048
	add	x14, x11, :lo12:_ZL6CDOT_O+2048
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z24.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z6.h, z22.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z2.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p7/z, [x14, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z23.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x14, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x14, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x14, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z4.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2304
	add	x12, x0, :lo12:_ZL6CDOT_O+2304
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z23.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z6.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z0.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z2.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p7/z, [x12, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z21.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x12, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z1.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x12, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z7.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x12, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z4.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+2560
	add	x15, x10, :lo12:_ZL6CDOT_O+2560
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x15, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z22.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x15, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z0.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x15, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z2.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x15, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x15, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x15, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p7/z, [x15, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z7.h, z20.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x15, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z4.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+2816
	add	x9, x4, :lo12:_ZL6CDOT_O+2816
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x9, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z21.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z6.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x9, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z0.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x9, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z2.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x9, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x9, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x9, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z1.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p7/z, [x9, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z7.h, z19.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x9, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z4.h, z3.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+3072
	add	x6, x7, :lo12:_ZL6CDOT_O+3072
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x6, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z20.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z6.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x6, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z0.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x6, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z2.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x6, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x6, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p7/z, [x6, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z1.h, z18.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x6, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z7.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x6, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z4.h, z5.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+3328
	add	x3, x5, :lo12:_ZL6CDOT_O+3328
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x3, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z19.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z6.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x3, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x3, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z2.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x3, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x3, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x3, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z1.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x3, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z7.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x3, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z4.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+3584
	add	x11, x8, :lo12:_ZL6CDOT_O+3584
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z18.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z6.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z0.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z2.h, z16.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x11, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p7/z, [x11, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z1.h, z15.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p7/z, [x11, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z7.h, z17.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x11, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z4.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+3840
	add	x0, x14, :lo12:_ZL6CDOT_O+3840
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z17.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z2.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z12.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x0, #4, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x0, #5, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z1.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x0, #6, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z7.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x0, #7, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z4.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x10, sp, #9
	addvl	x15, sp, #9
	addvl	x4, sp, #9
	addvl	x9, sp, #9
	addvl	x7, sp, #9
	addvl	x6, sp, #9
	addvl	x5, sp, #9
	addvl	x3, sp, #9
	add	x10, x10, 320
	ldr	z4, [x10]
	add	x15, x15, 576
	ldr	z9, [x15]
	add	x4, x4, 832
	ldr	z10, [x4]
	add	x9, x9, 1088
	ldr	z16, [x9]
	add	x7, x7, 1344
	ldr	z3, [x7]
	add	x6, x6, 1600
	ldr	z15, [x6]
	add	x5, x5, 1856
	ldr	z14, [x5]
	add	x3, x3, 2112
	ldr	z8, [x3]
	adrp	x12, .LANCHOR0
	zip1	z5.h, z4.h, z9.h
	zip1	z6.h, z10.h, z16.h
	zip1	z0.h, z3.h, z15.h
	add	x8, x12, :lo12:.LANCHOR0
	zip1	z2.h, z14.h, z8.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x8, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z15.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z5.h, z11.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p7/z, [x8, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z6.h, z12.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p7/z, [x8, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z0.h, z13.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x8, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z2.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z16.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z0.h, z9.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z2.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x8, 256
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x17, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z13.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z5.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x17, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z6.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x17, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z0.h, z8.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p7/z, [x17, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z2.h, z11.h
// 0 "" 2
#NO_APP
	add	x11, x8, 384
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x11, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z12.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z5.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x11, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x11, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x11, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z2.h, z9.h
// 0 "" 2
#NO_APP
	add	x14, x8, 512
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x14, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z11.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x14, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x14, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p7/z, [x14, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z2.h, z8.h
// 0 "" 2
#NO_APP
	add	x0, x8, 640
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x0, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z8.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z5.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x0, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x0, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p7/z, [x0, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z2.h, z9.h
// 0 "" 2
#NO_APP
	add	x12, x8, 768
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p7/z, [x12, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z9.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z5.h, z10.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x12, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z3.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x12, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z0.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x12, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z2.h, z1.h
// 0 "" 2
#NO_APP
	add	x10, x8, 896
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p7/z, [x10, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z10.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z5.h, z7.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x10, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x10, #2, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x10, #3, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z2.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x15, sp, #9
	addvl	x4, sp, #9
	addvl	x9, sp, #9
	addvl	x7, sp, #9
	add	x15, x15, 448
	ldr	z2, [x15]
	add	x4, x4, 960
	ldr	z4, [x4]
	add	x9, x9, 1472
	ldr	z14, [x9]
	add	x7, x7, 1984
	ldr	z1, [x7]
	zip1	z3.h, z2.h, z4.h
	zip1	z0.h, z14.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p7/z, [x20, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z7.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z3.h, z5.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p7/z, [x20, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z0.h, z6.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x19, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z5.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p7/z, [x19, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z0.h, z4.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x30, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z4.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z3.h, z14.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x30, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z0.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p7/z, [x18, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z6.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z3.h, z2.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z3.h, p7/z, [x18, #1, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z0.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x20, sp, #9
	addvl	x19, sp, #9
	add	x20, x20, 704
	ldr	z0, [x20]
	add	x19, x19, 1728
	ldr	z14, [x19]
	zip1	z0.h, z0.h, z14.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p7/z, [x24, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z2.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z0.h, z1.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p7/z, [x23, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z3.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z0.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x30, sp, #9
	addvl	x18, sp, #9
	add	x30, x30, 192
	ldr	z0, [x30]
	add	x18, x18, 1216
	ldr	z1, [x18]
	zip1	z1.h, z0.h, z1.h
#APP
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x22, #0, MUL VL]
// 0 "" 2
#NO_APP
	mov	z14.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z1.h, z0.h
// 0 "" 2
// 274 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p7/z, [x21, #0, MUL VL]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z1.h, z0.h
// 0 "" 2
#NO_APP
	add	z1.s, z14.s, z2.s
	addvl	x21, sp, #2
	sub	z14.s, z14.s, z2.s
	ldr	z2, [x16]
	add	z0.s, z1.s, z7.s
	add	x23, sp, 144
	add	x21, x21, 144
	str	z0, [x23]
	add	z0.s, z0.s, z15.s
	str	z0, [x21]
	add	z0.s, z0.s, z2.s
	sqrshrnb	z2.h, z0.s, #12
	add	x2, x2, x2, lsl 1
	uzp1	z0.h, z2.h, z2.h
	sunpklo	z2.s, z0.h
	add	x24, x26, x25
	addvl	x5, sp, #1
	st1h	z2.s, p6, [x24, z31.s, sxtw 1]
	addvl	x17, sp, #3
	add	z2.s, z29.s, z3.s
	sub	z29.s, z29.s, z3.s
	ldr	z3, [x13]
	add	z0.s, z2.s, z5.s
	lsl	x22, x2, 4
	add	x5, x5, 144
	add	x17, x17, 144
	str	z0, [x5]
	add	z0.s, z0.s, z16.s
	str	z0, [x17]
	add	z0.s, z0.s, z3.s
	sqrshrnb	z3.h, z0.s, #12
	add	x26, x22, 2
	addvl	x15, sp, #7
	uzp1	z0.h, z3.h, z3.h
	sunpklo	z3.s, z0.h
	add	x25, x1, x26
	addvl	x10, sp, #4
	st1h	z3.s, p6, [x25, z31.s, sxtw 1]
	add	x15, x15, 144
	add	z3.s, z29.s, z4.s
	sub	z29.s, z29.s, z4.s
	ldr	z4, [x15]
	add	z0.s, z3.s, z13.s
	add	x10, x10, 144
	str	z0, [x10]
	add	z0.s, z0.s, z4.s
	sqrshrnb	z4.h, z0.s, #12
	add	x6, x26, 2
	uzp1	z0.h, z4.h, z4.h
	sunpklo	z4.s, z0.h
	add	x8, x1, x6
	sub	z2.s, z2.s, z5.s
	st1h	z4.s, p6, [x8, z31.s, sxtw 1]
	add	z5.s, z14.s, z6.s
	sub	z14.s, z14.s, z6.s
	add	z6.s, z5.s, z12.s
	add	z0.s, z6.s, z28.s
	sqrshrnb	z4.h, z0.s, #12
	add	x3, x26, 4
	uzp1	z0.h, z4.h, z4.h
	sunpklo	z4.s, z0.h
	add	x11, x1, x3
	sub	z1.s, z1.s, z7.s
	st1h	z4.s, p6, [x11, z31.s, sxtw 1]
	add	z7.s, z14.s, z11.s
	add	z0.s, z7.s, z30.s
	sqrshrnb	z4.h, z0.s, #12
	add	x14, x26, 6
	uzp1	z0.h, z4.h, z4.h
	sunpklo	z4.s, z0.h
	add	x12, x1, x14
	add	x0, x26, 8
	st1h	z4.s, p6, [x12, z31.s, sxtw 1]
	add	z4.s, z29.s, z8.s
	sub	z29.s, z29.s, z8.s
	add	z0.s, z4.s, z27.s
	add	z8.s, z2.s, z9.s
	sqrshrnb	z0.h, z0.s, #12
	sub	z2.s, z2.s, z9.s
	uzp1	z0.h, z0.h, z0.h
	add	z9.s, z8.s, z26.s
	sunpklo	z0.s, z0.h
	add	x9, x1, x0
	st1h	z0.s, p6, [x9, z31.s, sxtw 1]
	sqrshrnb	z0.h, z9.s, #12
	uzp1	z9.h, z0.h, z0.h
	add	x4, x26, 10
	sunpklo	z0.s, z9.h
	add	z9.s, z1.s, z10.s
	sub	z1.s, z1.s, z10.s
	add	z10.s, z9.s, z25.s
	add	x7, x1, x4
	add	x20, x26, 12
	st1h	z0.s, p6, [x7, z31.s, sxtw 1]
	sqrshrnb	z0.h, z10.s, #12
	uzp1	z10.h, z0.h, z0.h
	add	x19, x1, x20
	sub	z14.s, z14.s, z11.s
	add	x30, x26, 14
	add	z11.s, z1.s, z24.s
	sunpklo	z0.s, z10.h
	sqrshrnb	z10.h, z11.s, #12
	st1h	z0.s, p6, [x19, z31.s, sxtw 1]
	add	x18, x1, x30
	add	x24, x26, 16
	uzp1	z0.h, z10.h, z10.h
	add	z10.s, z2.s, z23.s
	sunpklo	z11.s, z0.h
	st1h	z11.s, p6, [x18, z31.s, sxtw 1]
	add	x23, x1, x24
	add	x22, x26, 18
	sqrshrnb	z0.h, z10.s, #12
	uzp1	z11.h, z0.h, z0.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x23, z31.s, sxtw 1]
	add	x21, x1, x22
	sub	z5.s, z5.s, z12.s
	add	x25, x26, 20
	add	z12.s, z29.s, z22.s
	sqrshrnb	z0.h, z12.s, #12
	uzp1	z11.h, z0.h, z0.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x21, z31.s, sxtw 1]
	add	x6, x1, x25
	add	z12.s, z14.s, z21.s
	add	x5, x26, 22
	sqrshrnb	z0.h, z12.s, #12
	uzp1	z11.h, z0.h, z0.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x6, z31.s, sxtw 1]
	add	x8, x1, x5
	add	z12.s, z5.s, z20.s
	add	x3, x26, 24
	sqrshrnb	z0.h, z12.s, #12
	uzp1	z11.h, z0.h, z0.h
	sunpklo	z10.s, z11.h
	st1h	z10.s, p6, [x8, z31.s, sxtw 1]
	add	x17, x1, x3
	add	x11, x26, 26
	sub	z3.s, z3.s, z13.s
	addvl	x14, sp, #1
	add	z13.s, z3.s, z19.s
	sqrshrnb	z12.h, z13.s, #12
	uzp1	z0.h, z12.h, z12.h
	sunpklo	z11.s, z0.h
	st1h	z11.s, p6, [x17, z31.s, sxtw 1]
	add	x0, x1, x11
	add	x12, x26, 28
	add	x14, x14, 144
	ldr	z10, [x14]
	sub	z16.s, z10.s, z16.s
	add	z13.s, z16.s, z18.s
	sqrshrnb	z12.h, z13.s, #12
	uzp1	z0.h, z12.h, z12.h
	sunpklo	z11.s, z0.h
	st1h	z11.s, p6, [x0, z31.s, sxtw 1]
	add	x15, x1, x12
	add	x10, sp, 144
	ldr	z10, [x10]
	add	x9, x26, 30
	sub	z15.s, z10.s, z15.s
	add	z13.s, z15.s, z17.s
	sqrshrnb	z12.h, z13.s, #12
	uzp1	z0.h, z12.h, z12.h
	sunpklo	z11.s, z0.h
	st1h	z11.s, p6, [x15, z31.s, sxtw 1]
	add	x4, x1, x9
	add	x7, x26, 32
	sub	z17.s, z15.s, z17.s
	sqrshrnb	z10.h, z17.s, #12
	uzp1	z15.h, z10.h, z10.h
	sunpklo	z13.s, z15.h
	st1h	z13.s, p6, [x4, z31.s, sxtw 1]
	add	x20, x1, x7
	add	x19, x26, 34
	sub	z18.s, z16.s, z18.s
	sqrshrnb	z16.h, z18.s, #12
	uzp1	z12.h, z16.h, z16.h
	sunpklo	z0.s, z12.h
	st1h	z0.s, p6, [x20, z31.s, sxtw 1]
	add	x30, x1, x19
	add	x18, x26, 36
	sub	z19.s, z3.s, z19.s
	sqrshrnb	z3.h, z19.s, #12
	uzp1	z11.h, z3.h, z3.h
	sunpklo	z17.s, z11.h
	st1h	z17.s, p6, [x30, z31.s, sxtw 1]
	add	x24, x1, x18
	add	x23, x26, 38
	sub	z20.s, z5.s, z20.s
	sqrshrnb	z5.h, z20.s, #12
	uzp1	z10.h, z5.h, z5.h
	sunpklo	z15.s, z10.h
	st1h	z15.s, p6, [x24, z31.s, sxtw 1]
	add	x22, x1, x23
	add	x21, x26, 40
	sub	z21.s, z14.s, z21.s
	sqrshrnb	z14.h, z21.s, #12
	uzp1	z13.h, z14.h, z14.h
	sunpklo	z18.s, z13.h
	st1h	z18.s, p6, [x22, z31.s, sxtw 1]
	add	x25, x1, x21
	add	x6, x26, 42
	sub	z22.s, z29.s, z22.s
	add	x8, x26, 44
	sqrshrnb	z29.h, z22.s, #12
	uzp1	z16.h, z29.h, z29.h
	sunpklo	z12.s, z16.h
	st1h	z12.s, p6, [x25, z31.s, sxtw 1]
	add	x5, x1, x6
	add	x2, x1, x2, lsl 4
	add	x3, x1, x8
	sub	z23.s, z2.s, z23.s
	sub	z24.s, z1.s, z24.s
	sqrshrnb	z2.h, z23.s, #12
	sqrshrnb	z1.h, z24.s, #12
	uzp1	z0.h, z2.h, z2.h
	uzp1	z3.h, z1.h, z1.h
	sunpklo	z19.s, z0.h
	sunpklo	z11.s, z3.h
	st1h	z19.s, p6, [x5, z31.s, sxtw 1]
	st1h	z11.s, p6, [x3, z31.s, sxtw 1]
	add	x11, x26, 48
	add	x17, x2, 48
	sub	z25.s, z9.s, z25.s
	sqrshrnb	z9.h, z25.s, #12
	uzp1	z17.h, z9.h, z9.h
	sunpklo	z20.s, z17.h
	st1h	z20.s, p6, [x17, z31.s, sxtw 1]
	add	x14, x1, x11
	add	x0, x26, 50
	sub	z26.s, z8.s, z26.s
	sqrshrnb	z8.h, z26.s, #12
	uzp1	z5.h, z8.h, z8.h
	sunpklo	z10.s, z5.h
	st1h	z10.s, p6, [x14, z31.s, sxtw 1]
	add	x12, x1, x0
	add	x10, x26, 52
	sub	z27.s, z4.s, z27.s
	sqrshrnb	z4.h, z27.s, #12
	uzp1	z15.h, z4.h, z4.h
	sunpklo	z21.s, z15.h
	st1h	z21.s, p6, [x12, z31.s, sxtw 1]
	add	x15, x1, x10
	add	x9, x26, 54
	sub	z30.s, z7.s, z30.s
	sqrshrnb	z7.h, z30.s, #12
	uzp1	z14.h, z7.h, z7.h
	sunpklo	z13.s, z14.h
	st1h	z13.s, p6, [x15, z31.s, sxtw 1]
	add	x4, x1, x9
	add	x7, x26, 56
	addvl	x20, sp, #4
	addvl	x19, sp, #7
	sub	z28.s, z6.s, z28.s
	sqrshrnb	z6.h, z28.s, #12
	uzp1	z18.h, z6.h, z6.h
	sunpklo	z22.s, z18.h
	st1h	z22.s, p6, [x4, z31.s, sxtw 1]
	add	x30, x1, x7
	add	x18, x26, 58
	add	x20, x20, 144
	ldr	z29, [x20]
	add	x19, x19, 144
	ldr	z16, [x19]
	addvl	x24, sp, #3
	sub	z12.s, z29.s, z16.s
	addvl	x23, sp, #2
	sqrshrnb	z23.h, z12.s, #12
	uzp1	z2.h, z23.h, z23.h
	sunpklo	z0.s, z2.h
	st1h	z0.s, p6, [x30, z31.s, sxtw 1]
	ldr	z24, [x13]
	add	x24, x24, 144
	ldr	z19, [x24]
	add	x13, x1, x18
	add	x26, x26, 60
	add	x23, x23, 144
	sub	z1.s, z19.s, z24.s
	sqrshrnb	z3.h, z1.s, #12
	uzp1	z11.h, z3.h, z3.h
	sunpklo	z25.s, z11.h
	st1h	z25.s, p6, [x13, z31.s, sxtw 1]
	ldr	z9, [x23]
	ldr	z17, [x16]
	sub	z20.s, z9.s, z17.s
	sqrshrnb	z26.h, z20.s, #12
	uzp1	z8.h, z26.h, z26.h
	add	x1, x1, x26
	sunpklo	z5.s, z8.h
	st1h	z5.s, p6, [x1, z31.s, sxtw 1]
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	d8, d9, [sp, 80]
	ldp	d10, d11, [sp, 96]
	ldp	d12, d13, [sp, 112]
	ldp	d14, d15, [sp, 128]
	ldp	x25, x26, [sp, 64]
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
	addvl	sp, sp, #9
	.cfi_def_cfa_offset 2192
	add	sp, sp, 2192
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
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
