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
	add	x3, x0, 64
	ptrue	p6.h, all
	sub	sp, sp, #2192
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0x48,0x1e,0x23,0x90,0x11,0x22
	add	x4, x0, 192
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	d8, d9, [sp, 80]
	stp	d10, d11, [sp, 96]
	stp	d12, d13, [sp, 112]
	stp	d14, d15, [sp, 128]
	ldr	z31, [x4]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x16,0x2,0x8f,0x28
	.cfi_escape 0x10,0x17,0x2,0x8f,0x30
	.cfi_escape 0x10,0x18,0x2,0x8f,0x38
	.cfi_escape 0x10,0x48,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x49,0x3,0x8f,0xd8,0
	.cfi_escape 0x10,0x4a,0x3,0x8f,0xe0,0
	.cfi_escape 0x10,0x4b,0x3,0x8f,0xe8,0
	.cfi_escape 0x10,0x4c,0x3,0x8f,0xf0,0
	.cfi_escape 0x10,0x4d,0x3,0x8f,0xf8,0
	.cfi_escape 0x10,0x4e,0x3,0x8f,0x80,0x1
	.cfi_escape 0x10,0x4f,0x3,0x8f,0x88,0x1
	ldr	z11, [x3]
	add	x3, x0, 320
	ldr	z12, [x3]
	zip1	z11.h, z11.h, z31.h
	add	x4, x0, 448
	ldr	z31, [x4]
	add	x3, x0, 576
	ldr	z13, [x3]
	add	x4, x0, 704
	add	x3, x0, 832
	zip1	z12.h, z12.h, z31.h
	ldr	z31, [x4]
	ldr	z14, [x3]
	add	x4, x0, 960
	add	x3, x0, 1088
	zip1	z13.h, z13.h, z31.h
	ldr	z31, [x4]
	ldr	z15, [x3]
	add	x4, x0, 1216
	add	x3, x0, 1344
	zip1	z14.h, z14.h, z31.h
	ldr	z31, [x4]
	ldr	z16, [x3]
	add	x4, x0, 1472
	add	x3, x0, 1600
	zip1	z15.h, z15.h, z31.h
	ldr	z31, [x4]
	ldr	z17, [x3]
	add	x4, x0, 1728
	add	x3, x0, 1856
	zip1	z16.h, z16.h, z31.h
	ldr	z31, [x4]
	ldr	z30, [x3]
	zip1	z17.h, z17.h, z31.h
	add	x3, x0, 1984
	ldr	z31, [x3]
	adrp	x4, _ZL6CDOT_O
	zip1	z30.h, z30.h, z31.h
	add	x4, x4, :lo12:_ZL6CDOT_O
	str	x25, [sp, 64]
	.cfi_escape 0x10,0x19,0x3,0x8f,0xc0,0
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x4]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+32
	add	x3, x3, :lo12:_ZL6CDOT_O+32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+64
	add	x3, x3, :lo12:_ZL6CDOT_O+64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+96
	add	x3, x3, :lo12:_ZL6CDOT_O+96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+128
	add	x3, x3, :lo12:_ZL6CDOT_O+128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+160
	add	x3, x3, :lo12:_ZL6CDOT_O+160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+192
	add	x3, x3, :lo12:_ZL6CDOT_O+192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+224
	add	x3, x3, :lo12:_ZL6CDOT_O+224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z2.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+256
	add	x3, x3, :lo12:_ZL6CDOT_O+256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+288
	add	x3, x3, :lo12:_ZL6CDOT_O+288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+320
	add	x3, x3, :lo12:_ZL6CDOT_O+320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+352
	add	x3, x3, :lo12:_ZL6CDOT_O+352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+384
	add	x3, x3, :lo12:_ZL6CDOT_O+384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+416
	add	x3, x3, :lo12:_ZL6CDOT_O+416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+448
	add	x3, x3, :lo12:_ZL6CDOT_O+448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+480
	add	x3, x3, :lo12:_ZL6CDOT_O+480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #5
	add	x3, x3, 144
	str	z29, [x3]
	adrp	x3, _ZL6CDOT_O+512
	add	x3, x3, :lo12:_ZL6CDOT_O+512
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+544
	add	x3, x3, :lo12:_ZL6CDOT_O+544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+576
	add	x3, x3, :lo12:_ZL6CDOT_O+576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+608
	add	x3, x3, :lo12:_ZL6CDOT_O+608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+640
	add	x3, x3, :lo12:_ZL6CDOT_O+640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+672
	add	x3, x3, :lo12:_ZL6CDOT_O+672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+704
	add	x3, x3, :lo12:_ZL6CDOT_O+704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+736
	add	x3, x3, :lo12:_ZL6CDOT_O+736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z27.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 144
	str	z27, [x3]
	adrp	x3, _ZL6CDOT_O+768
	add	x3, x3, :lo12:_ZL6CDOT_O+768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+800
	add	x3, x3, :lo12:_ZL6CDOT_O+800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+832
	add	x3, x3, :lo12:_ZL6CDOT_O+832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+864
	add	x3, x3, :lo12:_ZL6CDOT_O+864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+896
	add	x3, x3, :lo12:_ZL6CDOT_O+896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+928
	add	x3, x3, :lo12:_ZL6CDOT_O+928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+960
	add	x3, x3, :lo12:_ZL6CDOT_O+960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+992
	add	x3, x3, :lo12:_ZL6CDOT_O+992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z26.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	add	x3, x3, 144
	str	z26, [x3]
	adrp	x3, _ZL6CDOT_O+1024
	add	x3, x3, :lo12:_ZL6CDOT_O+1024
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1056
	add	x3, x3, :lo12:_ZL6CDOT_O+1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1088
	add	x3, x3, :lo12:_ZL6CDOT_O+1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1120
	add	x3, x3, :lo12:_ZL6CDOT_O+1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1152
	add	x3, x3, :lo12:_ZL6CDOT_O+1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1184
	add	x3, x3, :lo12:_ZL6CDOT_O+1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1216
	add	x3, x3, :lo12:_ZL6CDOT_O+1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1248
	add	x3, x3, :lo12:_ZL6CDOT_O+1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1280
	add	x3, x3, :lo12:_ZL6CDOT_O+1280
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1312
	add	x3, x3, :lo12:_ZL6CDOT_O+1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1344
	add	x3, x3, :lo12:_ZL6CDOT_O+1344
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1376
	add	x3, x3, :lo12:_ZL6CDOT_O+1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1408
	add	x3, x3, :lo12:_ZL6CDOT_O+1408
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1440
	add	x3, x3, :lo12:_ZL6CDOT_O+1440
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1472
	add	x3, x3, :lo12:_ZL6CDOT_O+1472
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z17.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1504
	add	x3, x3, :lo12:_ZL6CDOT_O+1504
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z30.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1536
	add	x3, x3, :lo12:_ZL6CDOT_O+1536
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1568
	add	x3, x3, :lo12:_ZL6CDOT_O+1568
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1600
	add	x3, x3, :lo12:_ZL6CDOT_O+1600
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1632
	add	x3, x3, :lo12:_ZL6CDOT_O+1632
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1664
	add	x3, x3, :lo12:_ZL6CDOT_O+1664
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1696
	add	x3, x3, :lo12:_ZL6CDOT_O+1696
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1728
	add	x3, x3, :lo12:_ZL6CDOT_O+1728
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1760
	add	x3, x3, :lo12:_ZL6CDOT_O+1760
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z30.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1792
	add	x3, x3, :lo12:_ZL6CDOT_O+1792
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1824
	add	x3, x3, :lo12:_ZL6CDOT_O+1824
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1856
	add	x3, x3, :lo12:_ZL6CDOT_O+1856
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1888
	add	x3, x3, :lo12:_ZL6CDOT_O+1888
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1920
	add	x3, x3, :lo12:_ZL6CDOT_O+1920
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1952
	add	x3, x3, :lo12:_ZL6CDOT_O+1952
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1984
	add	x3, x3, :lo12:_ZL6CDOT_O+1984
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2016
	add	x3, x3, :lo12:_ZL6CDOT_O+2016
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z30.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2048
	add	x3, x3, :lo12:_ZL6CDOT_O+2048
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2080
	add	x3, x3, :lo12:_ZL6CDOT_O+2080
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2112
	add	x3, x3, :lo12:_ZL6CDOT_O+2112
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2144
	add	x3, x3, :lo12:_ZL6CDOT_O+2144
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2176
	add	x3, x3, :lo12:_ZL6CDOT_O+2176
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2208
	add	x3, x3, :lo12:_ZL6CDOT_O+2208
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2240
	add	x3, x3, :lo12:_ZL6CDOT_O+2240
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2272
	add	x3, x3, :lo12:_ZL6CDOT_O+2272
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z30.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2304
	add	x3, x3, :lo12:_ZL6CDOT_O+2304
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2336
	add	x3, x3, :lo12:_ZL6CDOT_O+2336
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2368
	add	x3, x3, :lo12:_ZL6CDOT_O+2368
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2400
	add	x3, x3, :lo12:_ZL6CDOT_O+2400
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2432
	add	x3, x3, :lo12:_ZL6CDOT_O+2432
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2464
	add	x3, x3, :lo12:_ZL6CDOT_O+2464
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2496
	add	x3, x3, :lo12:_ZL6CDOT_O+2496
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2528
	add	x3, x3, :lo12:_ZL6CDOT_O+2528
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z30.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2560
	add	x3, x3, :lo12:_ZL6CDOT_O+2560
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2592
	add	x3, x3, :lo12:_ZL6CDOT_O+2592
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2624
	add	x3, x3, :lo12:_ZL6CDOT_O+2624
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2656
	add	x3, x3, :lo12:_ZL6CDOT_O+2656
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2688
	add	x3, x3, :lo12:_ZL6CDOT_O+2688
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2720
	add	x3, x3, :lo12:_ZL6CDOT_O+2720
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2752
	add	x3, x3, :lo12:_ZL6CDOT_O+2752
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z17.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2784
	add	x3, x3, :lo12:_ZL6CDOT_O+2784
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z30.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2816
	add	x3, x3, :lo12:_ZL6CDOT_O+2816
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2848
	add	x3, x3, :lo12:_ZL6CDOT_O+2848
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2880
	add	x3, x3, :lo12:_ZL6CDOT_O+2880
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2912
	add	x3, x3, :lo12:_ZL6CDOT_O+2912
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2944
	add	x3, x3, :lo12:_ZL6CDOT_O+2944
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2976
	add	x3, x3, :lo12:_ZL6CDOT_O+2976
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3008
	add	x3, x3, :lo12:_ZL6CDOT_O+3008
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z17.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3040
	add	x3, x3, :lo12:_ZL6CDOT_O+3040
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3072
	add	x3, x3, :lo12:_ZL6CDOT_O+3072
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3104
	add	x3, x3, :lo12:_ZL6CDOT_O+3104
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3136
	add	x3, x3, :lo12:_ZL6CDOT_O+3136
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3168
	add	x3, x3, :lo12:_ZL6CDOT_O+3168
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3200
	add	x3, x3, :lo12:_ZL6CDOT_O+3200
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3232
	add	x3, x3, :lo12:_ZL6CDOT_O+3232
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3264
	add	x3, x3, :lo12:_ZL6CDOT_O+3264
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z17.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3296
	add	x3, x3, :lo12:_ZL6CDOT_O+3296
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z30.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3328
	add	x3, x3, :lo12:_ZL6CDOT_O+3328
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3360
	add	x3, x3, :lo12:_ZL6CDOT_O+3360
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3392
	add	x3, x3, :lo12:_ZL6CDOT_O+3392
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3424
	add	x3, x3, :lo12:_ZL6CDOT_O+3424
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3456
	add	x3, x3, :lo12:_ZL6CDOT_O+3456
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3488
	add	x3, x3, :lo12:_ZL6CDOT_O+3488
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3520
	add	x3, x3, :lo12:_ZL6CDOT_O+3520
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z17.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3552
	add	x3, x3, :lo12:_ZL6CDOT_O+3552
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z30.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3584
	add	x3, x3, :lo12:_ZL6CDOT_O+3584
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3616
	add	x3, x3, :lo12:_ZL6CDOT_O+3616
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3648
	add	x3, x3, :lo12:_ZL6CDOT_O+3648
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3680
	add	x3, x3, :lo12:_ZL6CDOT_O+3680
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3712
	add	x3, x3, :lo12:_ZL6CDOT_O+3712
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3744
	add	x3, x3, :lo12:_ZL6CDOT_O+3744
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3776
	add	x3, x3, :lo12:_ZL6CDOT_O+3776
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3808
	add	x3, x3, :lo12:_ZL6CDOT_O+3808
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z30.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3840
	add	x3, x3, :lo12:_ZL6CDOT_O+3840
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3872
	add	x3, x3, :lo12:_ZL6CDOT_O+3872
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3904
	add	x3, x3, :lo12:_ZL6CDOT_O+3904
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3936
	add	x3, x3, :lo12:_ZL6CDOT_O+3936
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3968
	add	x3, x3, :lo12:_ZL6CDOT_O+3968
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+4000
	add	x3, x3, :lo12:_ZL6CDOT_O+4000
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+4032
	add	x3, x3, :lo12:_ZL6CDOT_O+4032
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+4064
	add	x3, x3, :lo12:_ZL6CDOT_O+4064
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z30.h, z17.h
// 0 "" 2
#NO_APP
	add	x5, x0, 128
	ldr	z13, [x5]
	add	x6, x0, 384
	add	x5, x0, 640
	ldr	z30, [x6]
	ldr	z14, [x5]
	add	x6, x0, 896
	add	x5, x0, 1152
	ldr	z15, [x5]
	zip1	z13.h, z13.h, z30.h
	ldr	z30, [x6]
	add	x5, x0, 1664
	add	x6, x0, 1408
	ldr	z17, [x6]
	zip1	z14.h, z14.h, z30.h
	ldr	z30, [x5]
	zip1	z15.h, z15.h, z17.h
	add	x5, x0, 1920
	ldr	z17, [x5]
	adrp	x3, .LANCHOR0
	zip1	z30.h, z30.h, z17.h
	add	x3, x3, :lo12:.LANCHOR0
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z13.h, z17.h
// 0 "" 2
#NO_APP
	add	x5, x3, 32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z14.h, z17.h
// 0 "" 2
#NO_APP
	add	x5, x3, 64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z15.h, z17.h
// 0 "" 2
#NO_APP
	add	x5, x3, 96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z30.h, z17.h
// 0 "" 2
#NO_APP
	add	x5, x3, 128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	add	x5, x3, 160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	add	x5, x3, 192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	add	x5, x3, 224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	add	x5, x3, 256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	add	x5, x3, 288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	add	x5, x3, 320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	add	x5, x3, 352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z30.h, z11.h
// 0 "" 2
#NO_APP
	add	x5, x3, 384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z30.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 512
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z30.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z30.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z30.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x3, 896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z13.h, z6.h
// 0 "" 2
#NO_APP
	add	x5, x3, 928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x5, x3, 960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x5, x3, 992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x5, x0, 768
	ldr	z30, [x5]
	add	x6, x0, 256
	add	x5, x0, 1280
	ldr	z15, [x6]
	add	x6, x0, 1792
	ldr	z14, [x6]
	zip1	z15.h, z15.h, z30.h
	ldr	z30, [x5]
	add	x5, x3, 1024
	zip1	z30.h, z30.h, z14.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x5, x3, 1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z30.h, z14.h
// 0 "" 2
#NO_APP
	add	x5, x3, 1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x5, x3, 1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z30.h, z14.h
// 0 "" 2
#NO_APP
	add	x5, x3, 1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x5, x3, 1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z30.h, z14.h
// 0 "" 2
#NO_APP
	add	x5, x3, 1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x5, x3, 1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x5, x0, 1536
	ldr	z15, [x5]
	add	x6, x0, 512
	ldr	z30, [x6]
	add	x5, x3, 1280
	zip1	z30.h, z30.h, z15.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x5, x3, 1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z1.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x5, x0, 1024
	ldr	z30, [x0]
	ldr	z15, [x5]
	add	x5, x3, 1344
	zip1	z30.h, z30.h, z15.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x3, x3, 1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z30.h, z13.h
// 0 "" 2
#NO_APP
	mov	w5, 8
	whilelo	p7.s, wzr, w5
	add	z13.s, z14.s, z0.s
	add	x5, sp, 144
	add	z30.s, z13.s, z6.s
	str	z30, [x5]
	addvl	x5, sp, #1
	add	z30.s, z30.s, z16.s
	addvl	x3, sp, #9
	add	x5, x5, 144
	str	z30, [x5]
	addvl	x7, sp, #2
	addvl	x5, sp, #4
	mov	w6, 32
	sub	z14.s, z14.s, z0.s
	add	x5, x5, 144
	str	z2, [x5]
	add	z2.s, z30.s, z2.s
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	index	z30.s, #0, w6
	add	x3, x3, 144
	addvl	x6, sp, #3
	st1h	z2.s, p7, [x3, z30.s, sxtw 1]
	add	x7, x7, 144
	add	z2.s, z15.s, z1.s
	sub	z15.s, z15.s, z1.s
	add	z0.s, z2.s, z4.s
	add	x6, x6, 144
	str	z15, [x6]
	add	z15.s, z0.s, z17.s
	str	z15, [x7]
	addvl	x7, sp, #5
	addvl	x5, sp, #9
	sub	z2.s, z2.s, z4.s
	add	x7, x7, 144
	ldr	z1, [x7]
	add	x5, x5, 146
	addvl	x7, sp, #3
	add	z1.s, z15.s, z1.s
	sqrshrnb	z1.h, z1.s, #7
	add	x7, x7, 144
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x5, z30.s, sxtw 1]
	ldr	z15, [x7]
	add	z1.s, z15.s, z3.s
	sub	z15.s, z15.s, z3.s
	add	z3.s, z1.s, z12.s
	str	z3, [x7]
	addvl	x7, sp, #6
	addvl	x3, sp, #9
	sub	z13.s, z13.s, z6.s
	add	x7, x7, 144
	ldr	z4, [x7]
	add	x3, x3, 148
	addvl	x6, sp, #9
	addvl	x7, sp, #7
	add	z4.s, z3.s, z4.s
	sqrshrnb	z4.h, z4.s, #7
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x3, z30.s, sxtw 1]
	add	x6, x6, 150
	add	z4.s, z14.s, z5.s
	addvl	x5, sp, #9
	add	z3.s, z4.s, z11.s
	add	x7, x7, 144
	ldr	z6, [x7]
	add	z6.s, z3.s, z6.s
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x6, z30.s, sxtw 1]
	sub	z14.s, z14.s, z5.s
	add	x5, x5, 152
	add	z6.s, z14.s, z9.s
	addvl	x8, sp, #9
	add	z5.s, z6.s, z29.s
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x5, z30.s, sxtw 1]
	add	x8, x8, 154
	add	z5.s, z15.s, z7.s
	addvl	x3, sp, #9
	sub	z15.s, z15.s, z7.s
	add	z7.s, z5.s, z28.s
	sqrshrnb	z7.h, z7.s, #7
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x8, z30.s, sxtw 1]
	add	x3, x3, 156
	add	z7.s, z2.s, z8.s
	addvl	x7, sp, #9
	sub	z2.s, z2.s, z8.s
	add	z8.s, z7.s, z27.s
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p7, [x3, z30.s, sxtw 1]
	sub	z14.s, z14.s, z9.s
	add	x7, x7, 158
	add	z9.s, z13.s, z10.s
	addvl	x5, sp, #9
	sub	z13.s, z13.s, z10.s
	add	z10.s, z9.s, z26.s
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x7, z30.s, sxtw 1]
	add	x5, x5, 160
	add	z10.s, z13.s, z25.s
	addvl	x6, sp, #9
	addvl	x3, sp, #9
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x5, z30.s, sxtw 1]
	sub	z4.s, z4.s, z11.s
	add	x6, x6, 162
	add	z11.s, z2.s, z24.s
	add	x3, x3, 164
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x6, z30.s, sxtw 1]
	addvl	x5, sp, #9
	add	z11.s, z15.s, z23.s
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z1.s, z1.s, z12.s
	add	x5, x5, 166
	add	z12.s, z14.s, z22.s
	add	x3, x3, 168
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x5, z30.s, sxtw 1]
	sub	z17.s, z0.s, z17.s
	add	z12.s, z4.s, z21.s
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 170
	add	z12.s, z1.s, z20.s
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	z12.s, z17.s, z19.s
	sqrshrnb	z12.h, z12.s, #7
	add	x3, x3, 172
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z30.s, sxtw 1]
	add	x3, sp, 144
	ldr	z12, [x3]
	addvl	x3, sp, #9
	sub	z16.s, z12.s, z16.s
	add	z12.s, z16.s, z18.s
	add	x3, x3, 174
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 176
	sub	z16.s, z16.s, z18.s
	sqrshrnb	z16.h, z16.s, #7
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z17.s, z17.s, z19.s
	sqrshrnb	z17.h, z17.s, #7
	add	x3, x3, 178
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	st1h	z17.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z1.s, z1.s, z20.s
	add	x3, x3, 180
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 182
	sub	z4.s, z4.s, z21.s
	sqrshrnb	z4.h, z4.s, #7
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z14.s, z14.s, z22.s
	sqrshrnb	z14.h, z14.s, #7
	add	x3, x3, 184
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z15.s, z15.s, z23.s
	add	x3, x3, 186
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 188
	sub	z2.s, z2.s, z24.s
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z13.s, z13.s, z25.s
	sqrshrnb	z13.h, z13.s, #7
	add	x3, x3, 190
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z9.s, z9.s, z26.s
	add	x3, x3, 192
	sqrshrnb	z9.h, z9.s, #7
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 194
	sub	z7.s, z7.s, z27.s
	sqrshrnb	z7.h, z7.s, #7
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z5.s, z5.s, z28.s
	sqrshrnb	z5.h, z5.s, #7
	add	x3, x3, 196
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z6.s, z6.s, z29.s
	add	x3, x3, 198
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #7
	add	x3, x3, 144
	ldr	z6, [x3]
	sub	z3.s, z3.s, z6.s
	addvl	x3, sp, #9
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	add	x3, x3, 200
	sunpklo	z3.s, z3.h
	st1h	z3.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #3
	addvl	x5, sp, #9
	add	x3, x3, 144
	ldr	z3, [x3]
	add	x5, x5, 206
	addvl	x3, sp, #6
	add	x7, x0, 208
	add	x3, x3, 144
	ldr	z4, [x3]
	sub	z29.s, z3.s, z4.s
	addvl	x3, sp, #9
	sqrshrnb	z29.h, z29.s, #7
	uzp1	z29.h, z29.h, z29.h
	add	x3, x3, 202
	sunpklo	z29.s, z29.h
	st1h	z29.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #2
	add	x6, x0, 336
	add	x3, x3, 144
	ldr	z15, [x3]
	addvl	x3, sp, #5
	add	x3, x3, 144
	ldr	z1, [x3]
	sub	z29.s, z15.s, z1.s
	addvl	x3, sp, #9
	sqrshrnb	z29.h, z29.s, #7
	uzp1	z29.h, z29.h, z29.h
	add	x3, x3, 204
	sunpklo	z29.s, z29.h
	st1h	z29.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #1
	add	x3, x3, 144
	ldr	z29, [x3]
	addvl	x3, sp, #4
	add	x3, x3, 144
	ldr	z2, [x3]
	sub	z29.s, z29.s, z2.s
	add	x3, x0, 80
	sqrshrnb	z29.h, z29.s, #7
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p7, [x5, z30.s, sxtw 1]
	ldr	z30, [x7]
	ldr	z11, [x3]
	add	x5, x0, 464
	add	x3, x0, 592
	ldr	z13, [x3]
	zip1	z11.h, z11.h, z30.h
	ldr	z30, [x5]
	add	x3, x0, 848
	add	x5, x0, 720
	ldr	z12, [x6]
	ldr	z14, [x3]
	zip1	z12.h, z12.h, z30.h
	ldr	z30, [x5]
	add	x3, x0, 1104
	add	x5, x0, 976
	ldr	z15, [x3]
	zip1	z13.h, z13.h, z30.h
	ldr	z30, [x5]
	add	x3, x0, 1360
	add	x5, x0, 1232
	ldr	z16, [x3]
	zip1	z14.h, z14.h, z30.h
	ldr	z30, [x5]
	add	x3, x0, 1616
	add	x5, x0, 1488
	ldr	z17, [x3]
	zip1	z15.h, z15.h, z30.h
	ldr	z30, [x5]
	add	x3, x0, 1872
	add	x5, x0, 1744
	ldr	z29, [x5]
	zip1	z16.h, z16.h, z30.h
	ldr	z30, [x3]
	zip1	z17.h, z17.h, z29.h
	add	x3, x0, 2000
	ldr	z29, [x3]
	zip1	z30.h, z30.h, z29.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x4]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x15, _ZL6CDOT_O+32
	add	x15, x15, :lo12:_ZL6CDOT_O+32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x15]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+64
	add	x14, x14, :lo12:_ZL6CDOT_O+64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x14]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x13, _ZL6CDOT_O+96
	add	x13, x13, :lo12:_ZL6CDOT_O+96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x13]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+128
	add	x12, x12, :lo12:_ZL6CDOT_O+128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x12]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+160
	add	x11, x11, :lo12:_ZL6CDOT_O+160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x11]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+192
	add	x10, x10, :lo12:_ZL6CDOT_O+192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x10]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+224
	add	x9, x9, :lo12:_ZL6CDOT_O+224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x9]
// 0 "" 2
#NO_APP
	mov	z2.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+256
	add	x8, x8, :lo12:_ZL6CDOT_O+256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x8]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+288
	add	x7, x7, :lo12:_ZL6CDOT_O+288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x7]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+320
	add	x6, x6, :lo12:_ZL6CDOT_O+320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x6]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+352
	add	x5, x5, :lo12:_ZL6CDOT_O+352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+384
	add	x3, x4, :lo12:_ZL6CDOT_O+384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+416
	add	x3, x3, :lo12:_ZL6CDOT_O+416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+448
	add	x3, x3, :lo12:_ZL6CDOT_O+448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+480
	add	x3, x3, :lo12:_ZL6CDOT_O+480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 144
	str	z29, [x3]
	adrp	x3, _ZL6CDOT_O+512
	add	x3, x3, :lo12:_ZL6CDOT_O+512
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z29.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+544
	add	x3, x3, :lo12:_ZL6CDOT_O+544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+576
	add	x3, x3, :lo12:_ZL6CDOT_O+576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+608
	add	x3, x3, :lo12:_ZL6CDOT_O+608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+640
	add	x3, x3, :lo12:_ZL6CDOT_O+640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+672
	add	x3, x3, :lo12:_ZL6CDOT_O+672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+704
	add	x3, x3, :lo12:_ZL6CDOT_O+704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+736
	add	x3, x3, :lo12:_ZL6CDOT_O+736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z27.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	add	x3, x3, 144
	str	z27, [x3]
	adrp	x3, _ZL6CDOT_O+768
	add	x3, x3, :lo12:_ZL6CDOT_O+768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z11.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+800
	add	x3, x3, :lo12:_ZL6CDOT_O+800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+832
	add	x3, x3, :lo12:_ZL6CDOT_O+832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+864
	add	x3, x3, :lo12:_ZL6CDOT_O+864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+896
	add	x3, x3, :lo12:_ZL6CDOT_O+896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z15.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+928
	add	x3, x3, :lo12:_ZL6CDOT_O+928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+960
	add	x3, x3, :lo12:_ZL6CDOT_O+960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+992
	add	x3, x3, :lo12:_ZL6CDOT_O+992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z30.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #8
	add	x3, x3, 144
	str	z31, [x3]
	adrp	x3, _ZL6CDOT_O+1024
	add	x3, x3, :lo12:_ZL6CDOT_O+1024
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1056
	add	x3, x3, :lo12:_ZL6CDOT_O+1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1088
	add	x3, x3, :lo12:_ZL6CDOT_O+1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1120
	add	x3, x3, :lo12:_ZL6CDOT_O+1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1152
	add	x3, x3, :lo12:_ZL6CDOT_O+1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1184
	add	x3, x3, :lo12:_ZL6CDOT_O+1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1216
	add	x3, x3, :lo12:_ZL6CDOT_O+1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1248
	add	x3, x3, :lo12:_ZL6CDOT_O+1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z30.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1280
	add	x3, x3, :lo12:_ZL6CDOT_O+1280
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1312
	add	x3, x3, :lo12:_ZL6CDOT_O+1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1344
	add	x3, x3, :lo12:_ZL6CDOT_O+1344
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1376
	add	x3, x3, :lo12:_ZL6CDOT_O+1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1408
	add	x3, x3, :lo12:_ZL6CDOT_O+1408
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1440
	add	x3, x3, :lo12:_ZL6CDOT_O+1440
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1472
	add	x3, x3, :lo12:_ZL6CDOT_O+1472
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z17.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1504
	add	x3, x3, :lo12:_ZL6CDOT_O+1504
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z30.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1536
	add	x3, x3, :lo12:_ZL6CDOT_O+1536
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1568
	add	x3, x3, :lo12:_ZL6CDOT_O+1568
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1600
	add	x3, x3, :lo12:_ZL6CDOT_O+1600
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1632
	add	x3, x3, :lo12:_ZL6CDOT_O+1632
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1664
	add	x3, x3, :lo12:_ZL6CDOT_O+1664
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1696
	add	x3, x3, :lo12:_ZL6CDOT_O+1696
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1728
	add	x3, x3, :lo12:_ZL6CDOT_O+1728
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1760
	add	x3, x3, :lo12:_ZL6CDOT_O+1760
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z30.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1792
	add	x3, x3, :lo12:_ZL6CDOT_O+1792
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1824
	add	x3, x3, :lo12:_ZL6CDOT_O+1824
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1856
	add	x3, x3, :lo12:_ZL6CDOT_O+1856
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1888
	add	x3, x3, :lo12:_ZL6CDOT_O+1888
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1920
	add	x3, x3, :lo12:_ZL6CDOT_O+1920
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1952
	add	x3, x3, :lo12:_ZL6CDOT_O+1952
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1984
	add	x3, x3, :lo12:_ZL6CDOT_O+1984
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2016
	add	x3, x3, :lo12:_ZL6CDOT_O+2016
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z30.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2048
	add	x3, x3, :lo12:_ZL6CDOT_O+2048
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2080
	add	x3, x3, :lo12:_ZL6CDOT_O+2080
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2112
	add	x3, x3, :lo12:_ZL6CDOT_O+2112
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2144
	add	x3, x3, :lo12:_ZL6CDOT_O+2144
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2176
	add	x3, x3, :lo12:_ZL6CDOT_O+2176
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2208
	add	x3, x3, :lo12:_ZL6CDOT_O+2208
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2240
	add	x3, x3, :lo12:_ZL6CDOT_O+2240
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2272
	add	x3, x3, :lo12:_ZL6CDOT_O+2272
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z30.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2304
	add	x3, x3, :lo12:_ZL6CDOT_O+2304
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2336
	add	x3, x3, :lo12:_ZL6CDOT_O+2336
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2368
	add	x3, x3, :lo12:_ZL6CDOT_O+2368
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2400
	add	x3, x3, :lo12:_ZL6CDOT_O+2400
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2432
	add	x3, x3, :lo12:_ZL6CDOT_O+2432
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2464
	add	x3, x3, :lo12:_ZL6CDOT_O+2464
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2496
	add	x3, x3, :lo12:_ZL6CDOT_O+2496
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2528
	add	x3, x3, :lo12:_ZL6CDOT_O+2528
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z30.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2560
	add	x3, x3, :lo12:_ZL6CDOT_O+2560
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2592
	add	x3, x3, :lo12:_ZL6CDOT_O+2592
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2624
	add	x3, x3, :lo12:_ZL6CDOT_O+2624
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2656
	add	x3, x3, :lo12:_ZL6CDOT_O+2656
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2688
	add	x3, x3, :lo12:_ZL6CDOT_O+2688
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2720
	add	x3, x3, :lo12:_ZL6CDOT_O+2720
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2752
	add	x3, x3, :lo12:_ZL6CDOT_O+2752
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z17.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2784
	add	x3, x3, :lo12:_ZL6CDOT_O+2784
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z30.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2816
	add	x3, x3, :lo12:_ZL6CDOT_O+2816
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2848
	add	x3, x3, :lo12:_ZL6CDOT_O+2848
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2880
	add	x3, x3, :lo12:_ZL6CDOT_O+2880
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2912
	add	x3, x3, :lo12:_ZL6CDOT_O+2912
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2944
	add	x3, x3, :lo12:_ZL6CDOT_O+2944
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2976
	add	x3, x3, :lo12:_ZL6CDOT_O+2976
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3008
	add	x3, x3, :lo12:_ZL6CDOT_O+3008
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z17.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3040
	add	x3, x3, :lo12:_ZL6CDOT_O+3040
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3072
	add	x3, x3, :lo12:_ZL6CDOT_O+3072
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3104
	add	x3, x3, :lo12:_ZL6CDOT_O+3104
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3136
	add	x3, x3, :lo12:_ZL6CDOT_O+3136
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3168
	add	x3, x3, :lo12:_ZL6CDOT_O+3168
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3200
	add	x3, x3, :lo12:_ZL6CDOT_O+3200
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3232
	add	x3, x3, :lo12:_ZL6CDOT_O+3232
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3264
	add	x3, x3, :lo12:_ZL6CDOT_O+3264
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z17.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3296
	add	x3, x3, :lo12:_ZL6CDOT_O+3296
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z30.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3328
	add	x3, x3, :lo12:_ZL6CDOT_O+3328
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d20, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3360
	add	x3, x3, :lo12:_ZL6CDOT_O+3360
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3392
	add	x3, x3, :lo12:_ZL6CDOT_O+3392
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3424
	add	x3, x3, :lo12:_ZL6CDOT_O+3424
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3456
	add	x3, x3, :lo12:_ZL6CDOT_O+3456
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3488
	add	x3, x3, :lo12:_ZL6CDOT_O+3488
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3520
	add	x3, x3, :lo12:_ZL6CDOT_O+3520
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z17.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3552
	add	x3, x3, :lo12:_ZL6CDOT_O+3552
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z30.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3584
	add	x3, x3, :lo12:_ZL6CDOT_O+3584
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d19, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3616
	add	x3, x3, :lo12:_ZL6CDOT_O+3616
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3648
	add	x3, x3, :lo12:_ZL6CDOT_O+3648
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3680
	add	x3, x3, :lo12:_ZL6CDOT_O+3680
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3712
	add	x3, x3, :lo12:_ZL6CDOT_O+3712
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3744
	add	x3, x3, :lo12:_ZL6CDOT_O+3744
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3776
	add	x3, x3, :lo12:_ZL6CDOT_O+3776
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3808
	add	x3, x3, :lo12:_ZL6CDOT_O+3808
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z30.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3840
	add	x3, x3, :lo12:_ZL6CDOT_O+3840
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d18, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3872
	add	x3, x3, :lo12:_ZL6CDOT_O+3872
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3904
	add	x3, x3, :lo12:_ZL6CDOT_O+3904
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3936
	add	x3, x3, :lo12:_ZL6CDOT_O+3936
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3968
	add	x3, x3, :lo12:_ZL6CDOT_O+3968
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+4000
	add	x3, x3, :lo12:_ZL6CDOT_O+4000
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+4032
	add	x3, x3, :lo12:_ZL6CDOT_O+4032
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+4064
	add	x3, x3, :lo12:_ZL6CDOT_O+4064
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z30.h, z17.h
// 0 "" 2
#NO_APP
	add	x3, x0, 400
	ldr	z30, [x3]
	add	x16, x0, 144
	add	x3, x0, 656
	ldr	z13, [x16]
	ldr	z14, [x3]
	add	x16, x0, 912
	add	x3, x0, 1168
	ldr	z15, [x3]
	zip1	z13.h, z13.h, z30.h
	ldr	z30, [x16]
	add	x3, x0, 1680
	add	x16, x0, 1424
	ldr	z17, [x16]
	zip1	z14.h, z14.h, z30.h
	ldr	z30, [x3]
	add	x16, x0, 1936
	zip1	z15.h, z15.h, z17.h
	ldr	z17, [x16]
	adrp	x3, .LANCHOR0
	zip1	z30.h, z30.h, z17.h
	add	x3, x3, :lo12:.LANCHOR0
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d16, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z13.h, z17.h
// 0 "" 2
#NO_APP
	add	x16, x3, 32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z14.h, z17.h
// 0 "" 2
#NO_APP
	add	x16, x3, 64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z15.h, z17.h
// 0 "" 2
#NO_APP
	add	x16, x3, 96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z30.h, z17.h
// 0 "" 2
#NO_APP
	add	x16, x3, 128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	add	x16, x3, 160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	add	x16, x3, 192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	add	x16, x3, 224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	add	x16, x3, 256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d12, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	add	x16, x3, 288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	add	x16, x3, 320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	add	x16, x3, 352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z30.h, z11.h
// 0 "" 2
#NO_APP
	add	x16, x3, 384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d11, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z30.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 512
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d9, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z30.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d7, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z30.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d8, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z30.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d10, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z13.h, z6.h
// 0 "" 2
#NO_APP
	add	x16, x3, 928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x16, x3, 960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x16, x0, 784
	ldr	z30, [x16]
	add	x17, x0, 272
	add	x16, x0, 1296
	ldr	z15, [x17]
	add	x17, x0, 1808
	ldr	z14, [x17]
	zip1	z15.h, z15.h, z30.h
	ldr	z30, [x16]
	add	x16, x3, 1024
	zip1	z30.h, z30.h, z14.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z30.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d4, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z30.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d3, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z30.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x16, x0, 1552
	ldr	z15, [x16]
	add	x17, x0, 528
	ldr	z30, [x17]
	add	x16, x3, 1280
	zip1	z30.h, z30.h, z15.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d0, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d1, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x16, x0, 1040
	ldr	z15, [x16]
	add	x17, x0, 16
	ldr	z30, [x17]
	add	x16, x3, 1344
	zip1	z30.h, z30.h, z15.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	movi	d14, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x3, x3, 1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d15, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z30.h, z13.h
// 0 "" 2
#NO_APP
	add	x17, sp, 144
	add	z13.s, z14.s, z0.s
	mov	w16, 32
	str	z13, [x17]
	addvl	x17, sp, #2
	index	z30.s, #0, w16
	add	x17, x17, 144
	addvl	x16, sp, #1
	add	z13.s, z13.s, z6.s
	add	x16, x16, 144
	str	z13, [x16]
	add	z13.s, z13.s, z16.s
	str	z13, [x17]
	addvl	x17, sp, #5
	addvl	x3, sp, #9
	add	x17, x17, 144
	addvl	x18, sp, #3
	str	z2, [x17]
	add	x3, x3, 656
	add	x18, x18, 144
	add	z2.s, z13.s, z2.s
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p7, [x3, z30.s, sxtw 1]
	sub	z14.s, z14.s, z0.s
	add	z2.s, z15.s, z1.s
	sub	z15.s, z15.s, z1.s
	add	z0.s, z2.s, z4.s
	add	z1.s, z0.s, z17.s
	str	z1, [x18]
	addvl	x18, sp, #6
	mov	z13.d, z1.d
	add	x18, x18, 144
	ldr	z1, [x18]
	addvl	x16, sp, #9
	addvl	x18, sp, #4
	add	x16, x16, 658
	add	z1.s, z13.s, z1.s
	add	x18, x18, 144
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x16, z30.s, sxtw 1]
	sub	z2.s, z2.s, z4.s
	add	z1.s, z15.s, z3.s
	sub	z15.s, z15.s, z3.s
	add	z3.s, z1.s, z12.s
	str	z3, [x18]
	addvl	x18, sp, #7
	addvl	x3, sp, #9
	add	x18, x18, 144
	ldr	z4, [x18]
	add	x3, x3, 660
	add	x18, sp, 144
	addvl	x17, sp, #9
	add	z4.s, z3.s, z4.s
	sqrshrnb	z4.h, z4.s, #7
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x3, z30.s, sxtw 1]
	ldr	z13, [x18]
	addvl	x18, sp, #8
	add	z4.s, z14.s, z5.s
	sub	z13.s, z13.s, z6.s
	add	z3.s, z4.s, z11.s
	add	x17, x17, 662
	addvl	x16, sp, #9
	sub	z14.s, z14.s, z5.s
	add	x18, x18, 144
	ldr	z6, [x18]
	add	z6.s, z3.s, z6.s
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x17, z30.s, sxtw 1]
	add	x16, x16, 664
	add	z6.s, z14.s, z9.s
	addvl	x19, sp, #9
	add	z5.s, z6.s, z29.s
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x16, z30.s, sxtw 1]
	add	x19, x19, 666
	add	z5.s, z15.s, z7.s
	addvl	x3, sp, #9
	sub	z15.s, z15.s, z7.s
	add	z7.s, z5.s, z28.s
	sqrshrnb	z7.h, z7.s, #7
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x19, z30.s, sxtw 1]
	add	x3, x3, 668
	add	z7.s, z2.s, z8.s
	addvl	x18, sp, #9
	sub	z2.s, z2.s, z8.s
	add	z8.s, z7.s, z27.s
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p7, [x3, z30.s, sxtw 1]
	sub	z14.s, z14.s, z9.s
	add	x18, x18, 670
	add	z9.s, z13.s, z10.s
	addvl	x16, sp, #9
	sub	z13.s, z13.s, z10.s
	add	z10.s, z9.s, z26.s
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x18, z30.s, sxtw 1]
	add	x16, x16, 672
	add	z10.s, z13.s, z25.s
	addvl	x17, sp, #9
	addvl	x3, sp, #9
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x16, z30.s, sxtw 1]
	sub	z4.s, z4.s, z11.s
	add	x17, x17, 674
	add	z11.s, z2.s, z24.s
	add	x3, x3, 676
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x17, z30.s, sxtw 1]
	addvl	x16, sp, #9
	add	z11.s, z15.s, z23.s
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z1.s, z1.s, z12.s
	add	x16, x16, 678
	add	z12.s, z14.s, z22.s
	add	x3, x3, 680
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x16, z30.s, sxtw 1]
	sub	z17.s, z0.s, z17.s
	add	z12.s, z4.s, z21.s
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 682
	add	z12.s, z1.s, z20.s
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	z12.s, z17.s, z19.s
	sqrshrnb	z12.h, z12.s, #7
	add	x3, x3, 684
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #1
	sub	z17.s, z17.s, z19.s
	add	x3, x3, 144
	ldr	z12, [x3]
	sub	z16.s, z12.s, z16.s
	addvl	x3, sp, #9
	add	z12.s, z16.s, z18.s
	sqrshrnb	z12.h, z12.s, #7
	add	x3, x3, 686
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z16.s, z16.s, z18.s
	add	x3, x3, 688
	sqrshrnb	z16.h, z16.s, #7
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 690
	sqrshrnb	z17.h, z17.s, #7
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	st1h	z17.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 692
	sub	z1.s, z1.s, z20.s
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z4.s, z4.s, z21.s
	sqrshrnb	z4.h, z4.s, #7
	add	x3, x3, 694
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z14.s, z14.s, z22.s
	add	x3, x3, 696
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 698
	sub	z15.s, z15.s, z23.s
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z2.s, z2.s, z24.s
	sqrshrnb	z2.h, z2.s, #7
	add	x3, x3, 700
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z13.s, z13.s, z25.s
	add	x3, x3, 702
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 704
	sub	z9.s, z9.s, z26.s
	sqrshrnb	z9.h, z9.s, #7
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z7.s, z7.s, z27.s
	sqrshrnb	z7.h, z7.s, #7
	add	x3, x3, 706
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z5.s, z5.s, z28.s
	add	x3, x3, 708
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 710
	sub	z6.s, z6.s, z29.s
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #8
	addvl	x16, sp, #9
	add	x3, x3, 144
	ldr	z6, [x3]
	sub	z3.s, z3.s, z6.s
	addvl	x3, sp, #9
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	add	x3, x3, 712
	sunpklo	z3.s, z3.h
	st1h	z3.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #4
	add	x16, x16, 718
	add	x3, x3, 144
	ldr	z3, [x3]
	add	x18, x0, 224
	addvl	x3, sp, #7
	add	x17, x0, 352
	add	x3, x3, 144
	ldr	z4, [x3]
	sub	z29.s, z3.s, z4.s
	addvl	x3, sp, #9
	sqrshrnb	z29.h, z29.s, #7
	uzp1	z29.h, z29.h, z29.h
	add	x3, x3, 714
	sunpklo	z29.s, z29.h
	st1h	z29.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #3
	add	x3, x3, 144
	ldr	z28, [x3]
	addvl	x3, sp, #6
	add	x3, x3, 144
	ldr	z1, [x3]
	sub	z29.s, z28.s, z1.s
	addvl	x3, sp, #9
	sqrshrnb	z29.h, z29.s, #7
	uzp1	z29.h, z29.h, z29.h
	add	x3, x3, 716
	sunpklo	z29.s, z29.h
	st1h	z29.s, p7, [x3, z30.s, sxtw 1]
	addvl	x3, sp, #2
	add	x3, x3, 144
	ldr	z13, [x3]
	addvl	x3, sp, #5
	add	x3, x3, 144
	ldr	z2, [x3]
	sub	z29.s, z13.s, z2.s
	add	x3, x0, 96
	sqrshrnb	z29.h, z29.s, #7
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p7, [x16, z30.s, sxtw 1]
	ldr	z30, [x18]
	ldr	z11, [x3]
	add	x16, x0, 480
	add	x3, x0, 608
	zip1	z11.h, z11.h, z30.h
	ldr	z30, [x16]
	ldr	z12, [x17]
	ldr	z13, [x3]
	add	x16, x0, 736
	add	x3, x0, 864
	zip1	z12.h, z12.h, z30.h
	ldr	z30, [x16]
	ldr	z14, [x3]
	add	x16, x0, 992
	add	x3, x0, 1120
	zip1	z13.h, z13.h, z30.h
	ldr	z30, [x16]
	ldr	z15, [x3]
	add	x16, x0, 1248
	add	x3, x0, 1376
	zip1	z14.h, z14.h, z30.h
	ldr	z30, [x16]
	ldr	z16, [x3]
	add	x16, x0, 1504
	add	x3, x0, 1632
	zip1	z15.h, z15.h, z30.h
	ldr	z30, [x16]
	ldr	z17, [x3]
	add	x16, x0, 1760
	add	x3, x0, 1888
	zip1	z16.h, z16.h, z30.h
	ldr	z30, [x16]
	ldr	z29, [x3]
	add	x16, x0, 2016
	zip1	z17.h, z17.h, z30.h
	ldr	z30, [x16]
	adrp	x3, _ZL6CDOT_O
	zip1	z29.h, z29.h, z30.h
	add	x3, x3, :lo12:_ZL6CDOT_O
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x15]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x14]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x13]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x12]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x11]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x10]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x9]
// 0 "" 2
#NO_APP
	mov	z2.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z29.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x8]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x7]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x6]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	add	x4, x4, :lo12:_ZL6CDOT_O+384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x4]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x15, _ZL6CDOT_O+416
	add	x15, x15, :lo12:_ZL6CDOT_O+416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x15]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+448
	add	x14, x14, :lo12:_ZL6CDOT_O+448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x14]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x13, _ZL6CDOT_O+480
	add	x13, x13, :lo12:_ZL6CDOT_O+480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x13]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	adrp	x12, _ZL6CDOT_O+512
	add	x3, x3, 144
	add	x12, x12, :lo12:_ZL6CDOT_O+512
	str	z30, [x3]
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x12]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+544
	add	x11, x11, :lo12:_ZL6CDOT_O+544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x11]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+576
	add	x10, x10, :lo12:_ZL6CDOT_O+576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x10]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+608
	add	x9, x9, :lo12:_ZL6CDOT_O+608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x9]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+640
	add	x8, x8, :lo12:_ZL6CDOT_O+640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x8]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+672
	add	x7, x7, :lo12:_ZL6CDOT_O+672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x7]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+704
	add	x6, x6, :lo12:_ZL6CDOT_O+704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x6]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+736
	add	x5, x5, :lo12:_ZL6CDOT_O+736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z27.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	add	x3, x3, 144
	str	z27, [x3]
	adrp	x3, _ZL6CDOT_O+768
	add	x3, x3, :lo12:_ZL6CDOT_O+768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+800
	add	x3, x3, :lo12:_ZL6CDOT_O+800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+832
	add	x3, x3, :lo12:_ZL6CDOT_O+832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+864
	add	x3, x3, :lo12:_ZL6CDOT_O+864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+896
	add	x3, x3, :lo12:_ZL6CDOT_O+896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+928
	add	x3, x3, :lo12:_ZL6CDOT_O+928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+960
	add	x3, x3, :lo12:_ZL6CDOT_O+960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+992
	add	x3, x3, :lo12:_ZL6CDOT_O+992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z26.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #8
	add	x3, x3, 144
	str	z26, [x3]
	adrp	x3, _ZL6CDOT_O+1024
	add	x3, x3, :lo12:_ZL6CDOT_O+1024
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1056
	add	x3, x3, :lo12:_ZL6CDOT_O+1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1088
	add	x3, x3, :lo12:_ZL6CDOT_O+1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1120
	add	x3, x3, :lo12:_ZL6CDOT_O+1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1152
	add	x3, x3, :lo12:_ZL6CDOT_O+1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1184
	add	x3, x3, :lo12:_ZL6CDOT_O+1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1216
	add	x3, x3, :lo12:_ZL6CDOT_O+1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1248
	add	x3, x3, :lo12:_ZL6CDOT_O+1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1280
	add	x3, x3, :lo12:_ZL6CDOT_O+1280
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1312
	add	x3, x3, :lo12:_ZL6CDOT_O+1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1344
	add	x3, x3, :lo12:_ZL6CDOT_O+1344
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1376
	add	x3, x3, :lo12:_ZL6CDOT_O+1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1408
	add	x3, x3, :lo12:_ZL6CDOT_O+1408
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1440
	add	x3, x3, :lo12:_ZL6CDOT_O+1440
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1472
	add	x3, x3, :lo12:_ZL6CDOT_O+1472
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1504
	add	x3, x3, :lo12:_ZL6CDOT_O+1504
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1536
	add	x3, x3, :lo12:_ZL6CDOT_O+1536
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1568
	add	x3, x3, :lo12:_ZL6CDOT_O+1568
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1600
	add	x3, x3, :lo12:_ZL6CDOT_O+1600
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1632
	add	x3, x3, :lo12:_ZL6CDOT_O+1632
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1664
	add	x3, x3, :lo12:_ZL6CDOT_O+1664
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1696
	add	x3, x3, :lo12:_ZL6CDOT_O+1696
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1728
	add	x3, x3, :lo12:_ZL6CDOT_O+1728
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1760
	add	x3, x3, :lo12:_ZL6CDOT_O+1760
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1792
	add	x3, x3, :lo12:_ZL6CDOT_O+1792
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1824
	add	x3, x3, :lo12:_ZL6CDOT_O+1824
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1856
	add	x3, x3, :lo12:_ZL6CDOT_O+1856
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1888
	add	x3, x3, :lo12:_ZL6CDOT_O+1888
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1920
	add	x3, x3, :lo12:_ZL6CDOT_O+1920
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1952
	add	x3, x3, :lo12:_ZL6CDOT_O+1952
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1984
	add	x3, x3, :lo12:_ZL6CDOT_O+1984
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2016
	add	x3, x3, :lo12:_ZL6CDOT_O+2016
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2048
	add	x3, x3, :lo12:_ZL6CDOT_O+2048
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d30, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2080
	add	x3, x3, :lo12:_ZL6CDOT_O+2080
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z31.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2112
	add	x3, x3, :lo12:_ZL6CDOT_O+2112
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z31.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2144
	add	x3, x3, :lo12:_ZL6CDOT_O+2144
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z31.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2176
	add	x3, x3, :lo12:_ZL6CDOT_O+2176
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z31.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2208
	add	x3, x3, :lo12:_ZL6CDOT_O+2208
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z31.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2240
	add	x3, x3, :lo12:_ZL6CDOT_O+2240
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z31.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2272
	add	x3, x3, :lo12:_ZL6CDOT_O+2272
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z31.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z29.h, z31.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2304
	add	x3, x3, :lo12:_ZL6CDOT_O+2304
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d31, #0
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2336
	add	x3, x3, :lo12:_ZL6CDOT_O+2336
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2368
	add	x3, x3, :lo12:_ZL6CDOT_O+2368
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2400
	add	x3, x3, :lo12:_ZL6CDOT_O+2400
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2432
	add	x3, x3, :lo12:_ZL6CDOT_O+2432
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2464
	add	x3, x3, :lo12:_ZL6CDOT_O+2464
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2496
	add	x3, x3, :lo12:_ZL6CDOT_O+2496
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2528
	add	x3, x3, :lo12:_ZL6CDOT_O+2528
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2560
	add	x3, x3, :lo12:_ZL6CDOT_O+2560
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2592
	add	x3, x3, :lo12:_ZL6CDOT_O+2592
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2624
	add	x3, x3, :lo12:_ZL6CDOT_O+2624
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2656
	add	x3, x3, :lo12:_ZL6CDOT_O+2656
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2688
	add	x3, x3, :lo12:_ZL6CDOT_O+2688
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2720
	add	x3, x3, :lo12:_ZL6CDOT_O+2720
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2752
	add	x3, x3, :lo12:_ZL6CDOT_O+2752
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z17.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2784
	add	x3, x3, :lo12:_ZL6CDOT_O+2784
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z29.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2816
	add	x3, x3, :lo12:_ZL6CDOT_O+2816
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2848
	add	x3, x3, :lo12:_ZL6CDOT_O+2848
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2880
	add	x3, x3, :lo12:_ZL6CDOT_O+2880
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2912
	add	x3, x3, :lo12:_ZL6CDOT_O+2912
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2944
	add	x3, x3, :lo12:_ZL6CDOT_O+2944
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2976
	add	x3, x3, :lo12:_ZL6CDOT_O+2976
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3008
	add	x3, x3, :lo12:_ZL6CDOT_O+3008
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z17.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3040
	add	x3, x3, :lo12:_ZL6CDOT_O+3040
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z29.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3072
	add	x3, x3, :lo12:_ZL6CDOT_O+3072
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3104
	add	x3, x3, :lo12:_ZL6CDOT_O+3104
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3136
	add	x3, x3, :lo12:_ZL6CDOT_O+3136
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3168
	add	x3, x3, :lo12:_ZL6CDOT_O+3168
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3200
	add	x3, x3, :lo12:_ZL6CDOT_O+3200
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3232
	add	x3, x3, :lo12:_ZL6CDOT_O+3232
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3264
	add	x3, x3, :lo12:_ZL6CDOT_O+3264
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z17.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3296
	add	x3, x3, :lo12:_ZL6CDOT_O+3296
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3328
	add	x3, x3, :lo12:_ZL6CDOT_O+3328
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3360
	add	x3, x3, :lo12:_ZL6CDOT_O+3360
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3392
	add	x3, x3, :lo12:_ZL6CDOT_O+3392
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3424
	add	x3, x3, :lo12:_ZL6CDOT_O+3424
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3456
	add	x3, x3, :lo12:_ZL6CDOT_O+3456
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3488
	add	x3, x3, :lo12:_ZL6CDOT_O+3488
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3520
	add	x3, x3, :lo12:_ZL6CDOT_O+3520
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z17.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3552
	add	x3, x3, :lo12:_ZL6CDOT_O+3552
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z29.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3584
	add	x3, x3, :lo12:_ZL6CDOT_O+3584
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z19.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3616
	add	x3, x3, :lo12:_ZL6CDOT_O+3616
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3648
	add	x3, x3, :lo12:_ZL6CDOT_O+3648
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3680
	add	x3, x3, :lo12:_ZL6CDOT_O+3680
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3712
	add	x3, x3, :lo12:_ZL6CDOT_O+3712
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3744
	add	x3, x3, :lo12:_ZL6CDOT_O+3744
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3776
	add	x3, x3, :lo12:_ZL6CDOT_O+3776
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3808
	add	x3, x3, :lo12:_ZL6CDOT_O+3808
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z29.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3840
	add	x3, x3, :lo12:_ZL6CDOT_O+3840
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z18.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3872
	add	x3, x3, :lo12:_ZL6CDOT_O+3872
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3904
	add	x3, x3, :lo12:_ZL6CDOT_O+3904
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3936
	add	x3, x3, :lo12:_ZL6CDOT_O+3936
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3968
	add	x3, x3, :lo12:_ZL6CDOT_O+3968
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+4000
	add	x3, x3, :lo12:_ZL6CDOT_O+4000
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+4032
	add	x3, x3, :lo12:_ZL6CDOT_O+4032
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+4064
	add	x3, x3, :lo12:_ZL6CDOT_O+4064
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	add	x3, x0, 416
	ldr	z29, [x3]
	add	x16, x0, 160
	add	x3, x0, 672
	ldr	z13, [x16]
	ldr	z14, [x3]
	add	x16, x0, 928
	add	x3, x0, 1184
	ldr	z15, [x3]
	zip1	z13.h, z13.h, z29.h
	ldr	z29, [x16]
	add	x3, x0, 1696
	add	x16, x0, 1440
	ldr	z17, [x16]
	zip1	z14.h, z14.h, z29.h
	ldr	z29, [x3]
	add	x16, x0, 1952
	zip1	z15.h, z15.h, z17.h
	ldr	z17, [x16]
	adrp	x3, .LANCHOR0
	zip1	z29.h, z29.h, z17.h
	add	x3, x3, :lo12:.LANCHOR0
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z16.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z13.h, z17.h
// 0 "" 2
#NO_APP
	add	x16, x3, 32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z14.h, z17.h
// 0 "" 2
#NO_APP
	add	x16, x3, 64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z15.h, z17.h
// 0 "" 2
#NO_APP
	add	x16, x3, 96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	add	x16, x3, 128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z17.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	add	x16, x3, 160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	add	x16, x3, 192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	add	x16, x3, 224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z29.h, z12.h
// 0 "" 2
#NO_APP
	add	x16, x3, 256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z12.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	add	x16, x3, 288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	add	x16, x3, 320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	add	x16, x3, 352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z29.h, z11.h
// 0 "" 2
#NO_APP
	add	x16, x3, 384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z11.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 512
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z9.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z7.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z8.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	add	x16, x3, 896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z10.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z13.h, z6.h
// 0 "" 2
#NO_APP
	add	x16, x3, 928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x16, x3, 960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	add	x16, x0, 800
	ldr	z29, [x16]
	add	x17, x0, 288
	add	x16, x0, 1312
	ldr	z15, [x17]
	add	x17, x0, 1824
	ldr	z14, [x17]
	zip1	z15.h, z15.h, z29.h
	ldr	z29, [x16]
	add	x16, x3, 1024
	zip1	z29.h, z29.h, z14.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z6.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z29.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z4.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z29.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z3.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z29.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z5.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	add	x16, x0, 1568
	ldr	z15, [x16]
	add	x17, x0, 544
	ldr	z29, [x17]
	add	x16, x3, 1280
	zip1	z29.h, z29.h, z15.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z0.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	add	x16, x3, 1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z1.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	add	x16, x0, 1056
	ldr	z15, [x16]
	add	x17, x0, 32
	ldr	z29, [x17]
	add	x16, x3, 1344
	zip1	z29.h, z29.h, z15.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x16]
// 0 "" 2
#NO_APP
	mov	z14.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	add	x3, x3, 1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z15.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	add	x17, sp, 144
	add	z13.s, z14.s, z0.s
	mov	w16, 32
	str	z13, [x17]
	addvl	x17, sp, #2
	index	z29.s, #0, w16
	add	x17, x17, 144
	addvl	x16, sp, #1
	add	z13.s, z13.s, z6.s
	add	x16, x16, 144
	str	z13, [x16]
	add	z13.s, z13.s, z16.s
	str	z13, [x17]
	addvl	x17, sp, #5
	addvl	x3, sp, #9
	add	x17, x17, 144
	addvl	x18, sp, #3
	str	z2, [x17]
	add	x3, x3, 1168
	add	x18, x18, 144
	add	z2.s, z13.s, z2.s
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p7, [x3, z29.s, sxtw 1]
	sub	z14.s, z14.s, z0.s
	add	z2.s, z15.s, z1.s
	sub	z15.s, z15.s, z1.s
	add	z0.s, z2.s, z4.s
	add	z1.s, z0.s, z17.s
	str	z1, [x18]
	addvl	x18, sp, #6
	mov	z13.d, z1.d
	add	x18, x18, 144
	ldr	z1, [x18]
	addvl	x16, sp, #9
	addvl	x18, sp, #4
	add	x16, x16, 1170
	add	z1.s, z13.s, z1.s
	add	x18, x18, 144
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x16, z29.s, sxtw 1]
	sub	z2.s, z2.s, z4.s
	add	z1.s, z15.s, z3.s
	sub	z15.s, z15.s, z3.s
	add	z3.s, z1.s, z12.s
	str	z3, [x18]
	addvl	x18, sp, #7
	addvl	x3, sp, #9
	add	x18, x18, 144
	ldr	z4, [x18]
	add	x3, x3, 1172
	add	x18, sp, 144
	addvl	x17, sp, #9
	add	z4.s, z3.s, z4.s
	sqrshrnb	z4.h, z4.s, #7
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x3, z29.s, sxtw 1]
	ldr	z13, [x18]
	addvl	x18, sp, #8
	add	z4.s, z14.s, z5.s
	sub	z13.s, z13.s, z6.s
	add	z3.s, z4.s, z11.s
	add	x17, x17, 1174
	addvl	x16, sp, #9
	sub	z14.s, z14.s, z5.s
	add	x18, x18, 144
	ldr	z6, [x18]
	add	z6.s, z3.s, z6.s
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x17, z29.s, sxtw 1]
	add	x16, x16, 1176
	add	z6.s, z14.s, z9.s
	addvl	x19, sp, #9
	add	z5.s, z6.s, z28.s
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x16, z29.s, sxtw 1]
	add	x19, x19, 1178
	add	z5.s, z15.s, z7.s
	addvl	x3, sp, #9
	sub	z15.s, z15.s, z7.s
	add	z7.s, z5.s, z27.s
	sqrshrnb	z7.h, z7.s, #7
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x19, z29.s, sxtw 1]
	add	x3, x3, 1180
	add	z7.s, z2.s, z8.s
	addvl	x18, sp, #9
	sub	z2.s, z2.s, z8.s
	add	z8.s, z7.s, z26.s
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p7, [x3, z29.s, sxtw 1]
	sub	z14.s, z14.s, z9.s
	add	x18, x18, 1182
	add	z9.s, z13.s, z10.s
	addvl	x16, sp, #9
	sub	z13.s, z13.s, z10.s
	add	z10.s, z9.s, z25.s
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x18, z29.s, sxtw 1]
	add	x16, x16, 1184
	add	z10.s, z13.s, z30.s
	addvl	x17, sp, #9
	addvl	x3, sp, #9
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x16, z29.s, sxtw 1]
	sub	z4.s, z4.s, z11.s
	add	x17, x17, 1186
	add	z11.s, z2.s, z24.s
	add	x3, x3, 1188
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x17, z29.s, sxtw 1]
	addvl	x16, sp, #9
	add	z11.s, z15.s, z23.s
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z1.s, z1.s, z12.s
	add	x16, x16, 1190
	add	z12.s, z14.s, z22.s
	add	x3, x3, 1192
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x16, z29.s, sxtw 1]
	sub	z17.s, z0.s, z17.s
	add	z12.s, z4.s, z21.s
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 1194
	add	z12.s, z1.s, z20.s
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	add	z12.s, z17.s, z19.s
	sqrshrnb	z12.h, z12.s, #7
	add	x3, x3, 1196
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #1
	sub	z17.s, z17.s, z19.s
	add	x3, x3, 144
	ldr	z12, [x3]
	sub	z16.s, z12.s, z16.s
	addvl	x3, sp, #9
	add	z12.s, z16.s, z18.s
	sqrshrnb	z12.h, z12.s, #7
	add	x3, x3, 1198
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z16.s, z16.s, z18.s
	add	x3, x3, 1200
	sqrshrnb	z16.h, z16.s, #7
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 1202
	sqrshrnb	z17.h, z17.s, #7
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	st1h	z17.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 1204
	sub	z1.s, z1.s, z20.s
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z4.s, z4.s, z21.s
	sqrshrnb	z4.h, z4.s, #7
	add	x3, x3, 1206
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z14.s, z14.s, z22.s
	add	x3, x3, 1208
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 1210
	sub	z15.s, z15.s, z23.s
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z2.s, z2.s, z24.s
	sqrshrnb	z2.h, z2.s, #7
	add	x3, x3, 1212
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z13.s, z13.s, z30.s
	add	x3, x3, 1214
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 1216
	sub	z9.s, z9.s, z25.s
	sqrshrnb	z9.h, z9.s, #7
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z7.s, z7.s, z26.s
	sqrshrnb	z7.h, z7.s, #7
	add	x3, x3, 1218
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	sub	z5.s, z5.s, z27.s
	add	x3, x3, 1220
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	add	x3, x3, 1222
	sub	z6.s, z6.s, z28.s
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #8
	addvl	x16, sp, #9
	add	x3, x3, 144
	ldr	z6, [x3]
	sub	z3.s, z3.s, z6.s
	addvl	x3, sp, #9
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	add	x3, x3, 1224
	sunpklo	z3.s, z3.h
	st1h	z3.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #4
	add	x16, x16, 1230
	add	x3, x3, 144
	ldr	z3, [x3]
	add	x18, x0, 240
	addvl	x3, sp, #7
	add	x17, x0, 368
	add	x3, x3, 144
	ldr	z4, [x3]
	sub	z30.s, z3.s, z4.s
	addvl	x3, sp, #9
	sqrshrnb	z30.h, z30.s, #7
	uzp1	z30.h, z30.h, z30.h
	add	x3, x3, 1226
	sunpklo	z30.s, z30.h
	st1h	z30.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #3
	add	x3, x3, 144
	ldr	z28, [x3]
	addvl	x3, sp, #6
	add	x3, x3, 144
	ldr	z1, [x3]
	sub	z30.s, z28.s, z1.s
	addvl	x3, sp, #9
	sqrshrnb	z30.h, z30.s, #7
	uzp1	z30.h, z30.h, z30.h
	add	x3, x3, 1228
	sunpklo	z30.s, z30.h
	st1h	z30.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #2
	add	x3, x3, 144
	ldr	z13, [x3]
	addvl	x3, sp, #5
	add	x3, x3, 144
	ldr	z2, [x3]
	sub	z30.s, z13.s, z2.s
	sqrshrnb	z30.h, z30.s, #7
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	add	x3, x0, 112
	st1h	z30.s, p7, [x16, z29.s, sxtw 1]
	ldr	z30, [x18]
	ldr	z11, [x3]
	add	x16, x0, 496
	add	x3, x0, 624
	zip1	z11.h, z11.h, z30.h
	ldr	z30, [x16]
	ldr	z12, [x17]
	ldr	z13, [x3]
	add	x16, x0, 752
	add	x3, x0, 880
	zip1	z12.h, z12.h, z30.h
	ldr	z30, [x16]
	ldr	z14, [x3]
	add	x16, x0, 1008
	add	x3, x0, 1136
	zip1	z13.h, z13.h, z30.h
	ldr	z30, [x16]
	ldr	z15, [x3]
	add	x16, x0, 1264
	add	x3, x0, 1392
	zip1	z14.h, z14.h, z30.h
	ldr	z30, [x16]
	ldr	z16, [x3]
	add	x16, x0, 1520
	add	x3, x0, 1648
	zip1	z15.h, z15.h, z30.h
	ldr	z30, [x16]
	ldr	z17, [x3]
	add	x16, x0, 1776
	add	x3, x0, 1904
	zip1	z16.h, z16.h, z30.h
	ldr	z30, [x16]
	ldr	z29, [x3]
	add	x16, x0, 2032
	zip1	z17.h, z17.h, z30.h
	ldr	z30, [x16]
	adrp	x3, _ZL6CDOT_O
	zip1	z29.h, z29.h, z30.h
	add	x3, x3, :lo12:_ZL6CDOT_O
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+32
	add	x3, x3, :lo12:_ZL6CDOT_O+32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+64
	add	x3, x3, :lo12:_ZL6CDOT_O+64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+96
	add	x3, x3, :lo12:_ZL6CDOT_O+96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+128
	add	x3, x3, :lo12:_ZL6CDOT_O+128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+160
	add	x3, x3, :lo12:_ZL6CDOT_O+160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+192
	add	x3, x3, :lo12:_ZL6CDOT_O+192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+224
	add	x3, x3, :lo12:_ZL6CDOT_O+224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z2.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+256
	add	x3, x3, :lo12:_ZL6CDOT_O+256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+288
	add	x3, x3, :lo12:_ZL6CDOT_O+288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+320
	add	x3, x3, :lo12:_ZL6CDOT_O+320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+352
	add	x3, x3, :lo12:_ZL6CDOT_O+352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x4]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x15]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x14]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x13]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 144
	str	z30, [x3]
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x12]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x11]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x10]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x9]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x8]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x7]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x6]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z28.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z27.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	adrp	x19, _ZL6CDOT_O+768
	add	x3, x3, 144
	add	x19, x19, :lo12:_ZL6CDOT_O+768
	str	z27, [x3]
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x19]
// 0 "" 2
#NO_APP
	mov	z30.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x18, _ZL6CDOT_O+800
	add	x18, x18, :lo12:_ZL6CDOT_O+800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x18]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+832
	add	x17, x17, :lo12:_ZL6CDOT_O+832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x16, _ZL6CDOT_O+864
	add	x16, x16, :lo12:_ZL6CDOT_O+864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x15, _ZL6CDOT_O+896
	add	x15, x15, :lo12:_ZL6CDOT_O+896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x15]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+928
	add	x14, x14, :lo12:_ZL6CDOT_O+928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x14]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x13, _ZL6CDOT_O+960
	add	x13, x13, :lo12:_ZL6CDOT_O+960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x13]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+992
	add	x12, x12, :lo12:_ZL6CDOT_O+992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x12]
// 0 "" 2
#NO_APP
	mov	z26.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #8
	adrp	x11, _ZL6CDOT_O+1024
	add	x3, x3, 144
	add	x11, x11, :lo12:_ZL6CDOT_O+1024
	str	z26, [x3]
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x11]
// 0 "" 2
#NO_APP
	mov	z28.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+1056
	add	x10, x10, :lo12:_ZL6CDOT_O+1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x10]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+1088
	add	x9, x9, :lo12:_ZL6CDOT_O+1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x9]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+1120
	add	x8, x8, :lo12:_ZL6CDOT_O+1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x8]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+1152
	add	x7, x7, :lo12:_ZL6CDOT_O+1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x7]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+1184
	add	x6, x6, :lo12:_ZL6CDOT_O+1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x6]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+1216
	add	x5, x5, :lo12:_ZL6CDOT_O+1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+1248
	add	x4, x4, :lo12:_ZL6CDOT_O+1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x4]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1280
	add	x3, x3, :lo12:_ZL6CDOT_O+1280
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z27.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1312
	add	x3, x3, :lo12:_ZL6CDOT_O+1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1344
	add	x3, x3, :lo12:_ZL6CDOT_O+1344
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1376
	add	x3, x3, :lo12:_ZL6CDOT_O+1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1408
	add	x3, x3, :lo12:_ZL6CDOT_O+1408
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1440
	add	x3, x3, :lo12:_ZL6CDOT_O+1440
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1472
	add	x3, x3, :lo12:_ZL6CDOT_O+1472
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1504
	add	x3, x3, :lo12:_ZL6CDOT_O+1504
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1536
	add	x3, x3, :lo12:_ZL6CDOT_O+1536
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z26.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1568
	add	x3, x3, :lo12:_ZL6CDOT_O+1568
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1600
	add	x3, x3, :lo12:_ZL6CDOT_O+1600
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1632
	add	x3, x3, :lo12:_ZL6CDOT_O+1632
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1664
	add	x3, x3, :lo12:_ZL6CDOT_O+1664
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1696
	add	x3, x3, :lo12:_ZL6CDOT_O+1696
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1728
	add	x3, x3, :lo12:_ZL6CDOT_O+1728
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1760
	add	x3, x3, :lo12:_ZL6CDOT_O+1760
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1792
	add	x3, x3, :lo12:_ZL6CDOT_O+1792
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z25.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1824
	add	x3, x3, :lo12:_ZL6CDOT_O+1824
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1856
	add	x3, x3, :lo12:_ZL6CDOT_O+1856
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1888
	add	x3, x3, :lo12:_ZL6CDOT_O+1888
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1920
	add	x3, x3, :lo12:_ZL6CDOT_O+1920
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1952
	add	x3, x3, :lo12:_ZL6CDOT_O+1952
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1984
	add	x3, x3, :lo12:_ZL6CDOT_O+1984
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2016
	add	x3, x3, :lo12:_ZL6CDOT_O+2016
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2048
	add	x3, x3, :lo12:_ZL6CDOT_O+2048
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z24.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2080
	add	x3, x3, :lo12:_ZL6CDOT_O+2080
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2112
	add	x3, x3, :lo12:_ZL6CDOT_O+2112
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2144
	add	x3, x3, :lo12:_ZL6CDOT_O+2144
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2176
	add	x3, x3, :lo12:_ZL6CDOT_O+2176
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2208
	add	x3, x3, :lo12:_ZL6CDOT_O+2208
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2240
	add	x3, x3, :lo12:_ZL6CDOT_O+2240
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2272
	add	x3, x3, :lo12:_ZL6CDOT_O+2272
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2304
	add	x3, x3, :lo12:_ZL6CDOT_O+2304
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z23.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2336
	add	x3, x3, :lo12:_ZL6CDOT_O+2336
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2368
	add	x3, x3, :lo12:_ZL6CDOT_O+2368
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2400
	add	x3, x3, :lo12:_ZL6CDOT_O+2400
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2432
	add	x3, x3, :lo12:_ZL6CDOT_O+2432
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2464
	add	x3, x3, :lo12:_ZL6CDOT_O+2464
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2496
	add	x3, x3, :lo12:_ZL6CDOT_O+2496
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2528
	add	x3, x3, :lo12:_ZL6CDOT_O+2528
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2560
	add	x3, x3, :lo12:_ZL6CDOT_O+2560
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z22.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2592
	add	x3, x3, :lo12:_ZL6CDOT_O+2592
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2624
	add	x3, x3, :lo12:_ZL6CDOT_O+2624
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2656
	add	x3, x3, :lo12:_ZL6CDOT_O+2656
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2688
	add	x3, x3, :lo12:_ZL6CDOT_O+2688
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2720
	add	x3, x3, :lo12:_ZL6CDOT_O+2720
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2752
	add	x3, x3, :lo12:_ZL6CDOT_O+2752
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2784
	add	x3, x3, :lo12:_ZL6CDOT_O+2784
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2816
	add	x3, x3, :lo12:_ZL6CDOT_O+2816
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z21.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2848
	add	x3, x3, :lo12:_ZL6CDOT_O+2848
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2880
	add	x3, x3, :lo12:_ZL6CDOT_O+2880
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2912
	add	x3, x3, :lo12:_ZL6CDOT_O+2912
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2944
	add	x3, x3, :lo12:_ZL6CDOT_O+2944
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+2976
	add	x3, x3, :lo12:_ZL6CDOT_O+2976
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3008
	add	x3, x3, :lo12:_ZL6CDOT_O+3008
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3040
	add	x3, x3, :lo12:_ZL6CDOT_O+3040
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3072
	add	x3, x3, :lo12:_ZL6CDOT_O+3072
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z20.d, z31.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3104
	add	x3, x3, :lo12:_ZL6CDOT_O+3104
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3136
	add	x3, x3, :lo12:_ZL6CDOT_O+3136
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3168
	add	x3, x3, :lo12:_ZL6CDOT_O+3168
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3200
	add	x3, x3, :lo12:_ZL6CDOT_O+3200
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3232
	add	x3, x3, :lo12:_ZL6CDOT_O+3232
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3264
	add	x3, x3, :lo12:_ZL6CDOT_O+3264
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3296
	add	x3, x3, :lo12:_ZL6CDOT_O+3296
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3328
	add	x3, x3, :lo12:_ZL6CDOT_O+3328
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3360
	add	x3, x3, :lo12:_ZL6CDOT_O+3360
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3392
	add	x3, x3, :lo12:_ZL6CDOT_O+3392
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3424
	add	x3, x3, :lo12:_ZL6CDOT_O+3424
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3456
	add	x3, x3, :lo12:_ZL6CDOT_O+3456
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3488
	add	x3, x3, :lo12:_ZL6CDOT_O+3488
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3520
	add	x3, x3, :lo12:_ZL6CDOT_O+3520
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3552
	add	x3, x3, :lo12:_ZL6CDOT_O+3552
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z31.s, z29.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3584
	add	x3, x3, :lo12:_ZL6CDOT_O+3584
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d30, #0
	mov	z19.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3616
	add	x3, x3, :lo12:_ZL6CDOT_O+3616
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3648
	add	x3, x3, :lo12:_ZL6CDOT_O+3648
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3680
	add	x3, x3, :lo12:_ZL6CDOT_O+3680
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3712
	add	x3, x3, :lo12:_ZL6CDOT_O+3712
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3744
	add	x3, x3, :lo12:_ZL6CDOT_O+3744
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3776
	add	x3, x3, :lo12:_ZL6CDOT_O+3776
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3808
	add	x3, x3, :lo12:_ZL6CDOT_O+3808
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z29.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3840
	add	x3, x3, :lo12:_ZL6CDOT_O+3840
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z18.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3872
	add	x3, x3, :lo12:_ZL6CDOT_O+3872
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3904
	add	x3, x3, :lo12:_ZL6CDOT_O+3904
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3936
	add	x3, x3, :lo12:_ZL6CDOT_O+3936
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+3968
	add	x3, x3, :lo12:_ZL6CDOT_O+3968
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+4000
	add	x3, x3, :lo12:_ZL6CDOT_O+4000
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+4032
	add	x3, x3, :lo12:_ZL6CDOT_O+4032
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+4064
	add	x3, x3, :lo12:_ZL6CDOT_O+4064
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	add	x3, x0, 432
	ldr	z29, [x3]
	add	x20, x0, 176
	add	x3, x0, 688
	ldr	z13, [x20]
	ldr	z14, [x3]
	add	x20, x0, 944
	add	x3, x0, 1200
	ldr	z15, [x3]
	zip1	z13.h, z13.h, z29.h
	ldr	z29, [x20]
	add	x3, x0, 1712
	add	x20, x0, 1456
	ldr	z17, [x20]
	zip1	z14.h, z14.h, z29.h
	ldr	z29, [x3]
	add	x20, x0, 1968
	zip1	z15.h, z15.h, z17.h
	ldr	z17, [x20]
	adrp	x3, .LANCHOR0
	zip1	z29.h, z29.h, z17.h
	add	x3, x3, :lo12:.LANCHOR0
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z16.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z13.h, z17.h
// 0 "" 2
#NO_APP
	add	x20, x3, 32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z14.h, z17.h
// 0 "" 2
#NO_APP
	add	x20, x3, 64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z15.h, z17.h
// 0 "" 2
#NO_APP
	add	x20, x3, 96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	add	x20, x3, 128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z17.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	add	x20, x3, 160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	add	x20, x3, 192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	add	x20, x3, 224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z29.h, z12.h
// 0 "" 2
#NO_APP
	add	x20, x3, 256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z12.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	add	x20, x3, 288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	add	x20, x3, 320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	add	x20, x3, 352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z29.h, z11.h
// 0 "" 2
#NO_APP
	add	x20, x3, 384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z11.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 512
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z9.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z7.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z8.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z29.h, z10.h
// 0 "" 2
#NO_APP
	add	x20, x3, 896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z10.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z13.h, z6.h
// 0 "" 2
#NO_APP
	add	x20, x3, 928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x20, x3, 960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x20, x3, 992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	add	x20, x0, 816
	ldr	z29, [x20]
	add	x21, x0, 304
	add	x20, x0, 1328
	ldr	z15, [x21]
	add	x21, x0, 1840
	ldr	z14, [x21]
	zip1	z15.h, z15.h, z29.h
	ldr	z29, [x20]
	add	x20, x3, 1024
	zip1	z29.h, z29.h, z14.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z6.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x20, x3, 1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z29.h, z14.h
// 0 "" 2
#NO_APP
	add	x20, x3, 1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z4.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x20, x3, 1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z29.h, z14.h
// 0 "" 2
#NO_APP
	add	x20, x3, 1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z3.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x20, x3, 1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z29.h, z14.h
// 0 "" 2
#NO_APP
	add	x20, x3, 1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z5.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x20, x3, 1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	add	x20, x0, 1584
	ldr	z15, [x20]
	add	x21, x0, 560
	ldr	z29, [x21]
	add	x20, x3, 1280
	zip1	z29.h, z29.h, z15.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z0.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	add	x20, x3, 1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x20]
// 0 "" 2
#NO_APP
	mov	z1.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	add	x20, x0, 48
	add	x0, x0, 1072
	ldr	z29, [x20]
	ldr	z15, [x0]
	add	x0, x3, 1344
	zip1	z29.h, z29.h, z15.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z14.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z29.h, z15.h
// 0 "" 2
#NO_APP
	add	x3, x3, 1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	mov	z15.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	add	x20, sp, 144
	add	z13.s, z14.s, z0.s
	mov	w3, 32
	str	z13, [x20]
	addvl	x20, sp, #2
	index	z29.s, #0, w3
	add	x20, x20, 144
	addvl	x3, sp, #1
	add	z13.s, z13.s, z6.s
	add	x3, x3, 144
	str	z13, [x3]
	add	z13.s, z13.s, z16.s
	str	z13, [x20]
	addvl	x20, sp, #5
	addvl	x0, sp, #9
	add	x20, x20, 144
	addvl	x21, sp, #3
	str	z2, [x20]
	add	x0, x0, 1680
	add	x21, x21, 144
	add	z2.s, z13.s, z2.s
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p7, [x0, z29.s, sxtw 1]
	sub	z14.s, z14.s, z0.s
	add	z2.s, z15.s, z1.s
	sub	z15.s, z15.s, z1.s
	add	z0.s, z2.s, z4.s
	add	z1.s, z0.s, z17.s
	str	z1, [x21]
	addvl	x21, sp, #6
	mov	z13.d, z1.d
	add	x21, x21, 144
	ldr	z1, [x21]
	addvl	x3, sp, #9
	addvl	x21, sp, #4
	add	x3, x3, 1682
	add	z1.s, z13.s, z1.s
	add	x21, x21, 144
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x3, z29.s, sxtw 1]
	sub	z2.s, z2.s, z4.s
	add	z1.s, z15.s, z3.s
	sub	z15.s, z15.s, z3.s
	add	z3.s, z1.s, z12.s
	str	z3, [x21]
	addvl	x21, sp, #7
	addvl	x0, sp, #9
	add	x21, x21, 144
	ldr	z4, [x21]
	add	x0, x0, 1684
	add	x21, sp, 144
	addvl	x20, sp, #9
	add	z4.s, z3.s, z4.s
	sqrshrnb	z4.h, z4.s, #7
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x0, z29.s, sxtw 1]
	ldr	z13, [x21]
	addvl	x21, sp, #8
	add	z4.s, z14.s, z5.s
	sub	z13.s, z13.s, z6.s
	add	z3.s, z4.s, z11.s
	add	x20, x20, 1686
	addvl	x3, sp, #9
	sub	z14.s, z14.s, z5.s
	add	x21, x21, 144
	ldr	z6, [x21]
	add	z6.s, z3.s, z6.s
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x20, z29.s, sxtw 1]
	add	x3, x3, 1688
	add	z6.s, z14.s, z9.s
	addvl	x22, sp, #9
	add	z5.s, z6.s, z28.s
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x3, z29.s, sxtw 1]
	add	x22, x22, 1690
	add	z5.s, z15.s, z7.s
	addvl	x0, sp, #9
	sub	z15.s, z15.s, z7.s
	add	z7.s, z5.s, z27.s
	sqrshrnb	z7.h, z7.s, #7
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x22, z29.s, sxtw 1]
	add	x0, x0, 1692
	add	z7.s, z2.s, z8.s
	addvl	x21, sp, #9
	sub	z2.s, z2.s, z8.s
	add	z8.s, z7.s, z26.s
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p7, [x0, z29.s, sxtw 1]
	sub	z14.s, z14.s, z9.s
	add	x21, x21, 1694
	add	z9.s, z13.s, z10.s
	addvl	x3, sp, #9
	sub	z13.s, z13.s, z10.s
	add	z10.s, z9.s, z25.s
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x21, z29.s, sxtw 1]
	add	x3, x3, 1696
	add	z10.s, z13.s, z24.s
	addvl	x20, sp, #9
	addvl	x0, sp, #9
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x3, z29.s, sxtw 1]
	sub	z4.s, z4.s, z11.s
	add	x20, x20, 1698
	add	z11.s, z2.s, z23.s
	add	x0, x0, 1700
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x20, z29.s, sxtw 1]
	addvl	x3, sp, #9
	add	z11.s, z15.s, z22.s
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	sub	z1.s, z1.s, z12.s
	add	x3, x3, 1702
	add	z12.s, z14.s, z21.s
	add	x0, x0, 1704
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z29.s, sxtw 1]
	sub	z17.s, z0.s, z17.s
	add	z12.s, z4.s, z20.s
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	add	x0, x0, 1706
	add	z12.s, z1.s, z31.s
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	add	z12.s, z17.s, z19.s
	sqrshrnb	z12.h, z12.s, #7
	add	x0, x0, 1708
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #1
	sub	z17.s, z17.s, z19.s
	add	x0, x0, 144
	ldr	z12, [x0]
	sub	z16.s, z12.s, z16.s
	addvl	x0, sp, #9
	add	z12.s, z16.s, z18.s
	sqrshrnb	z12.h, z12.s, #7
	add	x0, x0, 1710
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	sub	z16.s, z16.s, z18.s
	add	x0, x0, 1712
	sqrshrnb	z16.h, z16.s, #7
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	add	x0, x0, 1714
	sqrshrnb	z17.h, z17.s, #7
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	st1h	z17.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	add	x0, x0, 1716
	sub	z1.s, z1.s, z31.s
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	sub	z4.s, z4.s, z20.s
	sqrshrnb	z4.h, z4.s, #7
	add	x0, x0, 1718
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	sub	z14.s, z14.s, z21.s
	add	x0, x0, 1720
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	add	x0, x0, 1722
	sub	z15.s, z15.s, z22.s
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	sub	z2.s, z2.s, z23.s
	sqrshrnb	z2.h, z2.s, #7
	add	x0, x0, 1724
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	sub	z13.s, z13.s, z24.s
	add	x0, x0, 1726
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	add	x0, x0, 1728
	sub	z9.s, z9.s, z25.s
	sqrshrnb	z9.h, z9.s, #7
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	sub	z7.s, z7.s, z26.s
	sqrshrnb	z7.h, z7.s, #7
	add	x0, x0, 1730
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	sub	z5.s, z5.s, z27.s
	add	x0, x0, 1732
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #9
	add	x0, x0, 1734
	sub	z6.s, z6.s, z28.s
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #8
	addvl	x3, sp, #9
	add	x0, x0, 144
	ldr	z6, [x0]
	sub	z3.s, z3.s, z6.s
	addvl	x0, sp, #9
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	add	x0, x0, 1736
	sunpklo	z3.s, z3.h
	st1h	z3.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #4
	add	x3, x3, 1742
	add	x0, x0, 144
	ldr	z3, [x0]
	addvl	x0, sp, #7
	add	x0, x0, 144
	ldr	z4, [x0]
	sub	z31.s, z3.s, z4.s
	addvl	x0, sp, #9
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 1738
	sunpklo	z31.s, z31.h
	st1h	z31.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #3
	add	x0, x0, 144
	ldr	z31, [x0]
	addvl	x0, sp, #6
	add	x0, x0, 144
	ldr	z1, [x0]
	sub	z31.s, z31.s, z1.s
	addvl	x0, sp, #9
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 1740
	sunpklo	z31.s, z31.h
	st1h	z31.s, p7, [x0, z29.s, sxtw 1]
	addvl	x0, sp, #2
	add	x0, x0, 144
	ldr	z13, [x0]
	addvl	x0, sp, #5
	add	x0, x0, 144
	ldr	z2, [x0]
	sub	z31.s, z13.s, z2.s
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	sunpklo	z31.s, z31.h
	st1h	z31.s, p7, [x3, z29.s, sxtw 1]
	addvl	x3, sp, #9
	adrp	x0, _ZL6CDOT_O
	add	x3, x3, 208
	ldr	z11, [x3]
	add	x0, x0, :lo12:_ZL6CDOT_O
	addvl	x3, sp, #9
	add	x3, x3, 336
	ldr	z31, [x3]
	zip1	z11.h, z11.h, z31.h
	addvl	x3, sp, #9
	add	x3, x3, 464
	ldr	z12, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 592
	ldr	z31, [x3]
	zip1	z12.h, z12.h, z31.h
	addvl	x3, sp, #9
	add	x3, x3, 720
	ldr	z13, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 848
	ldr	z31, [x3]
	zip1	z13.h, z13.h, z31.h
	addvl	x3, sp, #9
	add	x3, x3, 976
	ldr	z14, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 1104
	ldr	z31, [x3]
	zip1	z14.h, z14.h, z31.h
	addvl	x3, sp, #9
	add	x3, x3, 1232
	ldr	z15, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 1360
	ldr	z31, [x3]
	zip1	z15.h, z15.h, z31.h
	addvl	x3, sp, #9
	add	x3, x3, 1488
	ldr	z16, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 1616
	ldr	z31, [x3]
	zip1	z16.h, z16.h, z31.h
	addvl	x3, sp, #9
	add	x3, x3, 1744
	ldr	z29, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 1872
	ldr	z28, [x3]
	zip1	z29.h, z29.h, z28.h
	addvl	x3, sp, #9
	add	x3, x3, 2000
	ldr	z31, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 2128
	ldr	z28, [x3]
	zip1	z31.h, z31.h, z28.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z28.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+32
	add	x0, x0, :lo12:_ZL6CDOT_O+32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+64
	add	x0, x0, :lo12:_ZL6CDOT_O+64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+96
	add	x0, x0, :lo12:_ZL6CDOT_O+96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+128
	add	x0, x0, :lo12:_ZL6CDOT_O+128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+160
	add	x0, x0, :lo12:_ZL6CDOT_O+160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+192
	add	x0, x0, :lo12:_ZL6CDOT_O+192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z29.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+224
	add	x0, x0, :lo12:_ZL6CDOT_O+224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z31.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #4
	add	x0, x0, 144
	str	z28, [x0]
	adrp	x0, _ZL6CDOT_O+256
	add	x0, x0, :lo12:_ZL6CDOT_O+256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z28.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+288
	add	x0, x0, :lo12:_ZL6CDOT_O+288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+320
	add	x0, x0, :lo12:_ZL6CDOT_O+320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+352
	add	x0, x0, :lo12:_ZL6CDOT_O+352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+384
	add	x0, x0, :lo12:_ZL6CDOT_O+384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+416
	add	x0, x0, :lo12:_ZL6CDOT_O+416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+448
	add	x0, x0, :lo12:_ZL6CDOT_O+448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z29.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+480
	add	x0, x0, :lo12:_ZL6CDOT_O+480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z26.d, z28.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z31.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 144
	str	z26, [x0]
	adrp	x0, _ZL6CDOT_O+512
	add	x0, x0, :lo12:_ZL6CDOT_O+512
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z28.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+544
	add	x0, x0, :lo12:_ZL6CDOT_O+544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+576
	add	x0, x0, :lo12:_ZL6CDOT_O+576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+608
	add	x0, x0, :lo12:_ZL6CDOT_O+608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+640
	add	x0, x0, :lo12:_ZL6CDOT_O+640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+672
	add	x0, x0, :lo12:_ZL6CDOT_O+672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+704
	add	x0, x0, :lo12:_ZL6CDOT_O+704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z29.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+736
	add	x0, x0, :lo12:_ZL6CDOT_O+736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z25.d, z28.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z31.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 144
	str	z25, [x0]
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x19]
// 0 "" 2
#NO_APP
	mov	z28.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x18]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x15]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x14]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x13]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z29.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x12]
// 0 "" 2
#NO_APP
	mov	z24.d, z28.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z31.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	add	x0, x0, 144
	str	z24, [x0]
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x11]
// 0 "" 2
#NO_APP
	mov	z28.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x10]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x9]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x8]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x7]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x6]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z29.h, z27.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x4]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z31.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x22, _ZL6CDOT_O+1280
	add	x22, x22, :lo12:_ZL6CDOT_O+1280
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x22]
// 0 "" 2
#NO_APP
	mov	z27.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x21, _ZL6CDOT_O+1312
	add	x21, x21, :lo12:_ZL6CDOT_O+1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x21]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x20, _ZL6CDOT_O+1344
	add	x20, x20, :lo12:_ZL6CDOT_O+1344
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x19, _ZL6CDOT_O+1376
	add	x19, x19, :lo12:_ZL6CDOT_O+1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x19]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x30, _ZL6CDOT_O+1408
	add	x30, x30, :lo12:_ZL6CDOT_O+1408
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x30]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x18, _ZL6CDOT_O+1440
	add	x18, x18, :lo12:_ZL6CDOT_O+1440
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x18]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x17, _ZL6CDOT_O+1472
	add	x17, x17, :lo12:_ZL6CDOT_O+1472
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z29.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x16, _ZL6CDOT_O+1504
	add	x16, x16, :lo12:_ZL6CDOT_O+1504
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z31.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #8
	adrp	x15, _ZL6CDOT_O+1536
	add	x0, x0, 144
	add	x15, x15, :lo12:_ZL6CDOT_O+1536
	str	z27, [x0]
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x15]
// 0 "" 2
#NO_APP
	mov	z26.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+1568
	add	x14, x14, :lo12:_ZL6CDOT_O+1568
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x14]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x13, _ZL6CDOT_O+1600
	add	x13, x13, :lo12:_ZL6CDOT_O+1600
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x13]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+1632
	add	x12, x12, :lo12:_ZL6CDOT_O+1632
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x12]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+1664
	add	x11, x11, :lo12:_ZL6CDOT_O+1664
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x11]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+1696
	add	x10, x10, :lo12:_ZL6CDOT_O+1696
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x10]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+1728
	add	x9, x9, :lo12:_ZL6CDOT_O+1728
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x9]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z29.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+1760
	add	x8, x8, :lo12:_ZL6CDOT_O+1760
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x8]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z31.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+1792
	add	x7, x7, :lo12:_ZL6CDOT_O+1792
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x7]
// 0 "" 2
#NO_APP
	mov	z25.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+1824
	add	x6, x6, :lo12:_ZL6CDOT_O+1824
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x6]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+1856
	add	x5, x5, :lo12:_ZL6CDOT_O+1856
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x4, _ZL6CDOT_O+1888
	add	x4, x4, :lo12:_ZL6CDOT_O+1888
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x4]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x3, _ZL6CDOT_O+1920
	add	x3, x3, :lo12:_ZL6CDOT_O+1920
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1952
	add	x0, x0, :lo12:_ZL6CDOT_O+1952
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1984
	add	x0, x0, :lo12:_ZL6CDOT_O+1984
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z29.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2016
	add	x0, x0, :lo12:_ZL6CDOT_O+2016
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z31.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2048
	add	x0, x0, :lo12:_ZL6CDOT_O+2048
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z24.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2080
	add	x0, x0, :lo12:_ZL6CDOT_O+2080
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2112
	add	x0, x0, :lo12:_ZL6CDOT_O+2112
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2144
	add	x0, x0, :lo12:_ZL6CDOT_O+2144
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2176
	add	x0, x0, :lo12:_ZL6CDOT_O+2176
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2208
	add	x0, x0, :lo12:_ZL6CDOT_O+2208
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2240
	add	x0, x0, :lo12:_ZL6CDOT_O+2240
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z29.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2272
	add	x0, x0, :lo12:_ZL6CDOT_O+2272
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z31.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2304
	add	x0, x0, :lo12:_ZL6CDOT_O+2304
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z23.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2336
	add	x0, x0, :lo12:_ZL6CDOT_O+2336
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2368
	add	x0, x0, :lo12:_ZL6CDOT_O+2368
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2400
	add	x0, x0, :lo12:_ZL6CDOT_O+2400
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2432
	add	x0, x0, :lo12:_ZL6CDOT_O+2432
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2464
	add	x0, x0, :lo12:_ZL6CDOT_O+2464
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2496
	add	x0, x0, :lo12:_ZL6CDOT_O+2496
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z29.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2528
	add	x0, x0, :lo12:_ZL6CDOT_O+2528
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z31.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2560
	add	x0, x0, :lo12:_ZL6CDOT_O+2560
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z22.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2592
	add	x0, x0, :lo12:_ZL6CDOT_O+2592
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2624
	add	x0, x0, :lo12:_ZL6CDOT_O+2624
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2656
	add	x0, x0, :lo12:_ZL6CDOT_O+2656
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2688
	add	x0, x0, :lo12:_ZL6CDOT_O+2688
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2720
	add	x0, x0, :lo12:_ZL6CDOT_O+2720
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2752
	add	x0, x0, :lo12:_ZL6CDOT_O+2752
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z29.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2784
	add	x0, x0, :lo12:_ZL6CDOT_O+2784
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z31.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2816
	add	x0, x0, :lo12:_ZL6CDOT_O+2816
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z21.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2848
	add	x0, x0, :lo12:_ZL6CDOT_O+2848
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2880
	add	x0, x0, :lo12:_ZL6CDOT_O+2880
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2912
	add	x0, x0, :lo12:_ZL6CDOT_O+2912
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2944
	add	x0, x0, :lo12:_ZL6CDOT_O+2944
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2976
	add	x0, x0, :lo12:_ZL6CDOT_O+2976
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3008
	add	x0, x0, :lo12:_ZL6CDOT_O+3008
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3040
	add	x0, x0, :lo12:_ZL6CDOT_O+3040
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z31.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3072
	add	x0, x0, :lo12:_ZL6CDOT_O+3072
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z20.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3104
	add	x0, x0, :lo12:_ZL6CDOT_O+3104
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3136
	add	x0, x0, :lo12:_ZL6CDOT_O+3136
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3168
	add	x0, x0, :lo12:_ZL6CDOT_O+3168
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3200
	add	x0, x0, :lo12:_ZL6CDOT_O+3200
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3232
	add	x0, x0, :lo12:_ZL6CDOT_O+3232
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3264
	add	x0, x0, :lo12:_ZL6CDOT_O+3264
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z29.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3296
	add	x0, x0, :lo12:_ZL6CDOT_O+3296
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z31.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3328
	add	x0, x0, :lo12:_ZL6CDOT_O+3328
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z19.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3360
	add	x0, x0, :lo12:_ZL6CDOT_O+3360
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3392
	add	x0, x0, :lo12:_ZL6CDOT_O+3392
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3424
	add	x0, x0, :lo12:_ZL6CDOT_O+3424
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3456
	add	x0, x0, :lo12:_ZL6CDOT_O+3456
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3488
	add	x0, x0, :lo12:_ZL6CDOT_O+3488
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3520
	add	x0, x0, :lo12:_ZL6CDOT_O+3520
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z29.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3552
	add	x0, x0, :lo12:_ZL6CDOT_O+3552
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z31.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3584
	add	x0, x0, :lo12:_ZL6CDOT_O+3584
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z18.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3616
	add	x0, x0, :lo12:_ZL6CDOT_O+3616
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3648
	add	x0, x0, :lo12:_ZL6CDOT_O+3648
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3680
	add	x0, x0, :lo12:_ZL6CDOT_O+3680
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3712
	add	x0, x0, :lo12:_ZL6CDOT_O+3712
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3744
	add	x0, x0, :lo12:_ZL6CDOT_O+3744
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3776
	add	x0, x0, :lo12:_ZL6CDOT_O+3776
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z29.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3808
	add	x0, x0, :lo12:_ZL6CDOT_O+3808
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z31.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3840
	add	x0, x0, :lo12:_ZL6CDOT_O+3840
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z17.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z11.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3872
	add	x0, x0, :lo12:_ZL6CDOT_O+3872
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3904
	add	x0, x0, :lo12:_ZL6CDOT_O+3904
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3936
	add	x0, x0, :lo12:_ZL6CDOT_O+3936
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3968
	add	x0, x0, :lo12:_ZL6CDOT_O+3968
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+4000
	add	x0, x0, :lo12:_ZL6CDOT_O+4000
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+4032
	add	x0, x0, :lo12:_ZL6CDOT_O+4032
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z29.h, z16.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+4064
	add	x0, x0, :lo12:_ZL6CDOT_O+4064
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z31.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x23, sp, #9
	adrp	x0, .LANCHOR0
	add	x23, x23, 272
	ldr	z12, [x23]
	add	x0, x0, :lo12:.LANCHOR0
	addvl	x23, sp, #9
	add	x23, x23, 528
	ldr	z31, [x23]
	zip1	z12.h, z12.h, z31.h
	addvl	x23, sp, #9
	add	x23, x23, 784
	ldr	z13, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 1040
	ldr	z31, [x23]
	zip1	z13.h, z13.h, z31.h
	addvl	x23, sp, #9
	add	x23, x23, 1296
	ldr	z14, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 1552
	ldr	z29, [x23]
	zip1	z14.h, z14.h, z29.h
	addvl	x23, sp, #9
	add	x23, x23, 1808
	ldr	z31, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 2064
	ldr	z29, [x23]
	zip1	z31.h, z31.h, z29.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z7.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z31.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	mov	z16.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z31.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	mov	z3.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z31.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	mov	z2.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z31.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 512
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z31.h, z29.h
// 0 "" 2
#NO_APP
	add	x23, x0, 640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	movi	d29, #0
	mov	z15.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	add	x23, x0, 672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	add	x23, x0, 704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	add	x23, x0, 736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z31.h, z11.h
// 0 "" 2
#NO_APP
	add	x23, x0, 768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	mov	z0.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	add	x23, x0, 800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	add	x23, x0, 832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	add	x23, x0, 864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z31.h, z11.h
// 0 "" 2
#NO_APP
	add	x23, x0, 896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	mov	z1.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	add	x23, x0, 928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	add	x23, x0, 960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x23, x0, 992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z31.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x23, sp, #9
	add	x23, x23, 400
	ldr	z10, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 912
	ldr	z14, [x23]
	zip1	z10.h, z10.h, z14.h
	addvl	x23, sp, #9
	add	x23, x23, 1424
	ldr	z31, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 1936
	ldr	z14, [x23]
	zip1	z31.h, z31.h, z14.h
	add	x23, x0, 1024
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	mov	z14.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z10.h, z13.h
// 0 "" 2
#NO_APP
	add	x23, x0, 1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z31.h, z13.h
// 0 "" 2
#NO_APP
	add	x23, x0, 1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	mov	z12.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z10.h, z13.h
// 0 "" 2
#NO_APP
	add	x23, x0, 1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z31.h, z13.h
// 0 "" 2
#NO_APP
	add	x23, x0, 1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	mov	z11.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z10.h, z13.h
// 0 "" 2
#NO_APP
	add	x23, x0, 1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z31.h, z13.h
// 0 "" 2
#NO_APP
	add	x23, x0, 1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	mov	z13.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z10.h, z9.h
// 0 "" 2
#NO_APP
	add	x23, x0, 1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x23]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z31.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x23, sp, #9
	add	x23, x23, 656
	ldr	z31, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 1680
	ldr	z10, [x23]
	zip1	z31.h, z31.h, z10.h
	add	x23, x0, 1280
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	mov	z8.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z31.h, z10.h
// 0 "" 2
#NO_APP
	add	x23, x0, 1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	mov	z9.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z31.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x23, sp, #9
	add	x23, x23, 144
	ldr	z31, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 1168
	ldr	z10, [x23]
	zip1	z31.h, z31.h, z10.h
	add	x23, x0, 1344
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x23]
// 0 "" 2
#NO_APP
	mov	z5.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z31.h, z10.h
// 0 "" 2
#NO_APP
	add	x0, x0, 1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z6.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z31.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x23, sp, #1
	add	z4.s, z5.s, z8.s
	add	x0, sp, 144
	add	x23, x23, 144
	add	z10.s, z4.s, z14.s
	addvl	x24, sp, #2
	add	z27.s, z10.s, z7.s
	str	z10, [x0]
	str	z27, [x23]
	addvl	x23, sp, #4
	index	z31.s, #0, w2
	add	x24, x24, 144
	add	x23, x23, 144
	ldr	z10, [x23]
	add	z10.s, z27.s, z10.s
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x1, z31.s, sxtw 1]
	sub	z5.s, z5.s, z8.s
	add	z10.s, z6.s, z9.s
	addvl	x25, sp, #3
	add	z8.s, z10.s, z12.s
	mov	z27.d, z8.d
	add	z8.s, z8.s, z16.s
	str	z8, [x24]
	addvl	x24, sp, #5
	add	x0, x1, 2
	sub	z6.s, z6.s, z9.s
	add	x24, x24, 144
	ldr	z9, [x24]
	add	x25, x25, 144
	add	z9.s, z8.s, z9.s
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p7, [x0, z31.s, sxtw 1]
	add	z9.s, z6.s, z11.s
	sub	z6.s, z6.s, z11.s
	add	z11.s, z9.s, z3.s
	str	z11, [x25]
	addvl	x25, sp, #6
	add	x25, x25, 144
	add	x23, x1, 4
	sub	z10.s, z10.s, z12.s
	ldr	z12, [x25]
	addvl	x25, sp, #7
	add	z12.s, z11.s, z12.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x23, z31.s, sxtw 1]
	add	x24, x1, 6
	add	z12.s, z5.s, z13.s
	sub	z4.s, z4.s, z14.s
	add	z8.s, z12.s, z2.s
	add	x25, x25, 144
	ldr	z14, [x25]
	add	z14.s, z8.s, z14.s
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p7, [x24, z31.s, sxtw 1]
	add	x0, x1, 8
	sub	z5.s, z5.s, z13.s
	addvl	x25, sp, #8
	add	z14.s, z5.s, z30.s
	add	z13.s, z14.s, z28.s
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p7, [x0, z31.s, sxtw 1]
	add	x23, x1, 10
	add	z13.s, z6.s, z15.s
	add	x25, x25, 144
	sub	z6.s, z6.s, z15.s
	ldr	z15, [x25]
	add	z15.s, z13.s, z15.s
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p7, [x23, z31.s, sxtw 1]
	add	x0, x1, 12
	add	z15.s, z10.s, z0.s
	add	z11.s, z15.s, z26.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x0, z31.s, sxtw 1]
	sub	z5.s, z5.s, z30.s
	add	x24, x1, 14
	add	z30.s, z4.s, z1.s
	add	z11.s, z30.s, z25.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x24, z31.s, sxtw 1]
	add	x0, x1, 16
	sub	z4.s, z4.s, z1.s
	add	z11.s, z4.s, z24.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x0, z31.s, sxtw 1]
	add	x23, x1, 18
	sub	z10.s, z10.s, z0.s
	add	z11.s, z10.s, z23.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x23, z31.s, sxtw 1]
	add	x0, x1, 20
	add	z11.s, z6.s, z22.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x0, z31.s, sxtw 1]
	add	x23, x1, 22
	add	x0, x1, 24
	add	z11.s, z5.s, z21.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x23, z31.s, sxtw 1]
	sub	z12.s, z12.s, z2.s
	add	z11.s, z12.s, z20.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 26
	sub	z9.s, z9.s, z3.s
	add	z11.s, z9.s, z19.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 28
	sub	z16.s, z27.s, z16.s
	add	z11.s, z16.s, z18.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x0, z31.s, sxtw 1]
	add	x0, sp, 144
	ldr	z11, [x0]
	sub	z7.s, z11.s, z7.s
	add	x0, x1, 30
	add	z11.s, z7.s, z17.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 32
	sub	z7.s, z7.s, z17.s
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 34
	sub	z16.s, z16.s, z18.s
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 36
	sub	z9.s, z9.s, z19.s
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 38
	sub	z12.s, z12.s, z20.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 40
	sub	z5.s, z5.s, z21.s
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 42
	sub	z6.s, z6.s, z22.s
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 44
	sub	z10.s, z10.s, z23.s
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 46
	sub	z4.s, z4.s, z24.s
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 48
	sub	z30.s, z30.s, z25.s
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	st1h	z30.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 50
	sub	z15.s, z15.s, z26.s
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 52
	ldr	z30, [x25]
	sub	z13.s, z13.s, z30.s
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p7, [x0, z31.s, sxtw 1]
	add	x0, x1, 54
	sub	z14.s, z14.s, z28.s
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p7, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #7
	add	x23, x1, 62
	add	x0, x0, 144
	ldr	z14, [x0]
	sub	z8.s, z8.s, z14.s
	add	x0, x1, 56
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p7, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #3
	add	x0, x0, 144
	ldr	z11, [x0]
	addvl	x0, sp, #6
	add	x0, x0, 144
	ldr	z12, [x0]
	sub	z30.s, z11.s, z12.s
	add	x0, x1, 58
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	st1h	z30.s, p7, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #2
	add	x0, x0, 144
	ldr	z8, [x0]
	addvl	x0, sp, #5
	add	x0, x0, 144
	ldr	z9, [x0]
	sub	z30.s, z8.s, z9.s
	add	x0, x1, 60
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	st1h	z30.s, p7, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #1
	add	x0, x0, 144
	ldr	z27, [x0]
	addvl	x0, sp, #4
	add	x0, x0, 144
	ldr	z10, [x0]
	sub	z30.s, z27.s, z10.s
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	st1h	z30.s, p7, [x23, z31.s, sxtw 1]
	addvl	x23, sp, #9
	adrp	x0, _ZL6CDOT_O
	add	x23, x23, 224
	ldr	z18, [x23]
	add	x0, x0, :lo12:_ZL6CDOT_O
	addvl	x23, sp, #9
	add	x23, x23, 352
	ldr	z30, [x23]
	zip1	z18.h, z18.h, z30.h
	addvl	x23, sp, #9
	add	x23, x23, 480
	ldr	z11, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 608
	ldr	z30, [x23]
	zip1	z11.h, z11.h, z30.h
	addvl	x23, sp, #9
	add	x23, x23, 736
	ldr	z12, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 864
	ldr	z30, [x23]
	zip1	z12.h, z12.h, z30.h
	addvl	x23, sp, #9
	add	x23, x23, 992
	ldr	z13, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 1120
	ldr	z30, [x23]
	zip1	z13.h, z13.h, z30.h
	addvl	x23, sp, #9
	add	x23, x23, 1248
	ldr	z14, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 1376
	ldr	z30, [x23]
	zip1	z14.h, z14.h, z30.h
	addvl	x23, sp, #9
	add	x23, x23, 1504
	ldr	z15, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 1632
	ldr	z30, [x23]
	zip1	z15.h, z15.h, z30.h
	addvl	x23, sp, #9
	add	x23, x23, 1760
	ldr	z16, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 1888
	ldr	z30, [x23]
	zip1	z16.h, z16.h, z30.h
	addvl	x23, sp, #9
	add	x23, x23, 2016
	ldr	z17, [x23]
	addvl	x23, sp, #9
	add	x23, x23, 2144
	ldr	z30, [x23]
	zip1	z17.h, z17.h, z30.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z30.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z18.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+32
	add	x0, x0, :lo12:_ZL6CDOT_O+32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+64
	add	x0, x0, :lo12:_ZL6CDOT_O+64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+96
	add	x0, x0, :lo12:_ZL6CDOT_O+96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+128
	add	x0, x0, :lo12:_ZL6CDOT_O+128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+160
	add	x0, x0, :lo12:_ZL6CDOT_O+160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+192
	add	x0, x0, :lo12:_ZL6CDOT_O+192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+224
	add	x0, x0, :lo12:_ZL6CDOT_O+224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 144
	str	z30, [x0]
	adrp	x0, _ZL6CDOT_O+256
	add	x0, x0, :lo12:_ZL6CDOT_O+256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z30.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z18.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+288
	add	x0, x0, :lo12:_ZL6CDOT_O+288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+320
	add	x0, x0, :lo12:_ZL6CDOT_O+320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+352
	add	x0, x0, :lo12:_ZL6CDOT_O+352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+384
	add	x0, x0, :lo12:_ZL6CDOT_O+384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+416
	add	x0, x0, :lo12:_ZL6CDOT_O+416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+448
	add	x0, x0, :lo12:_ZL6CDOT_O+448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+480
	add	x0, x0, :lo12:_ZL6CDOT_O+480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z27.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 144
	str	z27, [x0]
	adrp	x0, _ZL6CDOT_O+512
	add	x0, x0, :lo12:_ZL6CDOT_O+512
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z30.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z18.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+544
	add	x0, x0, :lo12:_ZL6CDOT_O+544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+576
	add	x0, x0, :lo12:_ZL6CDOT_O+576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+608
	add	x0, x0, :lo12:_ZL6CDOT_O+608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+640
	add	x0, x0, :lo12:_ZL6CDOT_O+640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+672
	add	x0, x0, :lo12:_ZL6CDOT_O+672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+704
	add	x0, x0, :lo12:_ZL6CDOT_O+704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+736
	add	x0, x0, :lo12:_ZL6CDOT_O+736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z26.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	add	x0, x0, 144
	str	z26, [x0]
	adrp	x0, _ZL6CDOT_O+768
	add	x0, x0, :lo12:_ZL6CDOT_O+768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z30.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z18.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+800
	add	x0, x0, :lo12:_ZL6CDOT_O+800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+832
	add	x0, x0, :lo12:_ZL6CDOT_O+832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+864
	add	x0, x0, :lo12:_ZL6CDOT_O+864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+896
	add	x0, x0, :lo12:_ZL6CDOT_O+896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+928
	add	x0, x0, :lo12:_ZL6CDOT_O+928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+960
	add	x0, x0, :lo12:_ZL6CDOT_O+960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+992
	add	x0, x0, :lo12:_ZL6CDOT_O+992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z25.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1024
	add	x0, x0, :lo12:_ZL6CDOT_O+1024
	str	z25, [x25]
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z28.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z18.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1056
	add	x0, x0, :lo12:_ZL6CDOT_O+1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1088
	add	x0, x0, :lo12:_ZL6CDOT_O+1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1120
	add	x0, x0, :lo12:_ZL6CDOT_O+1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1152
	add	x0, x0, :lo12:_ZL6CDOT_O+1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1184
	add	x0, x0, :lo12:_ZL6CDOT_O+1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1216
	add	x0, x0, :lo12:_ZL6CDOT_O+1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1248
	add	x0, x0, :lo12:_ZL6CDOT_O+1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z17.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x22]
// 0 "" 2
#NO_APP
	mov	z27.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z18.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x21]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x20]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x19]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x30]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x18]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x15]
// 0 "" 2
#NO_APP
	mov	z26.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z18.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x14]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x13]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x12]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x11]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x10]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x9]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x8]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x7]
// 0 "" 2
#NO_APP
	mov	z25.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z18.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x6]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x4]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z30.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x16, _ZL6CDOT_O+1952
	add	x16, x16, :lo12:_ZL6CDOT_O+1952
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x15, _ZL6CDOT_O+1984
	add	x15, x15, :lo12:_ZL6CDOT_O+1984
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x15]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+2016
	add	x14, x14, :lo12:_ZL6CDOT_O+2016
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x14]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x13, _ZL6CDOT_O+2048
	add	x13, x13, :lo12:_ZL6CDOT_O+2048
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x13]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z18.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+2080
	add	x12, x12, :lo12:_ZL6CDOT_O+2080
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x12]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+2112
	add	x11, x11, :lo12:_ZL6CDOT_O+2112
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x11]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+2144
	add	x10, x10, :lo12:_ZL6CDOT_O+2144
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x10]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+2176
	add	x9, x9, :lo12:_ZL6CDOT_O+2176
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x9]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+2208
	add	x8, x8, :lo12:_ZL6CDOT_O+2208
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x8]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+2240
	add	x7, x7, :lo12:_ZL6CDOT_O+2240
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x7]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+2272
	add	x6, x6, :lo12:_ZL6CDOT_O+2272
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x6]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+2304
	add	x5, x5, :lo12:_ZL6CDOT_O+2304
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2336
	add	x0, x0, :lo12:_ZL6CDOT_O+2336
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2368
	add	x0, x0, :lo12:_ZL6CDOT_O+2368
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2400
	add	x0, x0, :lo12:_ZL6CDOT_O+2400
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2432
	add	x0, x0, :lo12:_ZL6CDOT_O+2432
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2464
	add	x0, x0, :lo12:_ZL6CDOT_O+2464
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2496
	add	x0, x0, :lo12:_ZL6CDOT_O+2496
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2528
	add	x0, x0, :lo12:_ZL6CDOT_O+2528
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2560
	add	x0, x0, :lo12:_ZL6CDOT_O+2560
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z18.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2592
	add	x0, x0, :lo12:_ZL6CDOT_O+2592
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2624
	add	x0, x0, :lo12:_ZL6CDOT_O+2624
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2656
	add	x0, x0, :lo12:_ZL6CDOT_O+2656
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2688
	add	x0, x0, :lo12:_ZL6CDOT_O+2688
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2720
	add	x0, x0, :lo12:_ZL6CDOT_O+2720
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2752
	add	x0, x0, :lo12:_ZL6CDOT_O+2752
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2784
	add	x0, x0, :lo12:_ZL6CDOT_O+2784
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z17.h, z22.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2816
	add	x0, x0, :lo12:_ZL6CDOT_O+2816
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z18.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2848
	add	x0, x0, :lo12:_ZL6CDOT_O+2848
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2880
	add	x0, x0, :lo12:_ZL6CDOT_O+2880
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2912
	add	x0, x0, :lo12:_ZL6CDOT_O+2912
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2944
	add	x0, x0, :lo12:_ZL6CDOT_O+2944
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2976
	add	x0, x0, :lo12:_ZL6CDOT_O+2976
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3008
	add	x0, x0, :lo12:_ZL6CDOT_O+3008
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3040
	add	x0, x0, :lo12:_ZL6CDOT_O+3040
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z17.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3072
	add	x0, x0, :lo12:_ZL6CDOT_O+3072
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z18.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3104
	add	x0, x0, :lo12:_ZL6CDOT_O+3104
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3136
	add	x0, x0, :lo12:_ZL6CDOT_O+3136
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3168
	add	x0, x0, :lo12:_ZL6CDOT_O+3168
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3200
	add	x0, x0, :lo12:_ZL6CDOT_O+3200
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3232
	add	x0, x0, :lo12:_ZL6CDOT_O+3232
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3264
	add	x0, x0, :lo12:_ZL6CDOT_O+3264
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3296
	add	x0, x0, :lo12:_ZL6CDOT_O+3296
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z17.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3328
	add	x0, x0, :lo12:_ZL6CDOT_O+3328
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d20, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z18.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3360
	add	x0, x0, :lo12:_ZL6CDOT_O+3360
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3392
	add	x0, x0, :lo12:_ZL6CDOT_O+3392
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3424
	add	x0, x0, :lo12:_ZL6CDOT_O+3424
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3456
	add	x0, x0, :lo12:_ZL6CDOT_O+3456
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3488
	add	x0, x0, :lo12:_ZL6CDOT_O+3488
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3520
	add	x0, x0, :lo12:_ZL6CDOT_O+3520
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3552
	add	x0, x0, :lo12:_ZL6CDOT_O+3552
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z17.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3584
	add	x0, x0, :lo12:_ZL6CDOT_O+3584
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d19, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z18.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3616
	add	x0, x0, :lo12:_ZL6CDOT_O+3616
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3648
	add	x0, x0, :lo12:_ZL6CDOT_O+3648
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3680
	add	x0, x0, :lo12:_ZL6CDOT_O+3680
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3712
	add	x0, x0, :lo12:_ZL6CDOT_O+3712
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3744
	add	x0, x0, :lo12:_ZL6CDOT_O+3744
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3776
	add	x0, x0, :lo12:_ZL6CDOT_O+3776
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3808
	add	x0, x0, :lo12:_ZL6CDOT_O+3808
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3840
	add	x0, x0, :lo12:_ZL6CDOT_O+3840
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d10, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z18.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3872
	add	x0, x0, :lo12:_ZL6CDOT_O+3872
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z18.d, z10.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3904
	add	x0, x0, :lo12:_ZL6CDOT_O+3904
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3936
	add	x0, x0, :lo12:_ZL6CDOT_O+3936
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3968
	add	x0, x0, :lo12:_ZL6CDOT_O+3968
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+4000
	add	x0, x0, :lo12:_ZL6CDOT_O+4000
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+4032
	add	x0, x0, :lo12:_ZL6CDOT_O+4032
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+4064
	add	x0, x0, :lo12:_ZL6CDOT_O+4064
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z16.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	adrp	x0, .LANCHOR0
	add	x3, x3, 288
	ldr	z6, [x3]
	add	x0, x0, :lo12:.LANCHOR0
	addvl	x3, sp, #9
	add	x3, x3, 544
	ldr	z17, [x3]
	zip1	z6.h, z6.h, z17.h
	addvl	x3, sp, #9
	add	x3, x3, 800
	ldr	z13, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 1056
	ldr	z17, [x3]
	zip1	z13.h, z13.h, z17.h
	addvl	x3, sp, #9
	add	x3, x3, 1312
	ldr	z14, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 1568
	ldr	z17, [x3]
	zip1	z14.h, z14.h, z17.h
	addvl	x3, sp, #9
	add	x3, x3, 1824
	ldr	z15, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 2080
	ldr	z17, [x3]
	zip1	z15.h, z15.h, z17.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d16, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z17.h
// 0 "" 2
#NO_APP
	add	x3, x0, 32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z13.h, z17.h
// 0 "" 2
#NO_APP
	add	x3, x0, 64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z14.h, z17.h
// 0 "" 2
#NO_APP
	add	x3, x0, 96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z15.h, z17.h
// 0 "" 2
#NO_APP
	add	x3, x0, 128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d17, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z12.h
// 0 "" 2
#NO_APP
	add	x3, x0, 160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	add	x3, x0, 192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	add	x3, x0, 224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	add	x3, x0, 256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d12, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z11.h
// 0 "" 2
#NO_APP
	add	x3, x0, 288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	add	x3, x0, 320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	add	x3, x0, 352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	add	x3, x0, 384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d11, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 512
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d9, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d7, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z6.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d8, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x3, x0, 896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d10, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z5.h
// 0 "" 2
#NO_APP
	add	x3, x0, 928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z13.h, z6.h
// 0 "" 2
#NO_APP
	add	x3, x0, 960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x3, x0, 992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 416
	ldr	z14, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 928
	ldr	z13, [x3]
	zip1	z14.h, z14.h, z13.h
	addvl	x3, sp, #9
	add	x3, x3, 1440
	ldr	z15, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 1952
	ldr	z13, [x3]
	zip1	z15.h, z15.h, z13.h
	add	x3, x0, 1024
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d6, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d4, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d3, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d5, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x3]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 672
	ldr	z15, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 1696
	ldr	z14, [x3]
	zip1	z15.h, z15.h, z14.h
	add	x3, x0, 1280
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d0, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d1, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 160
	ldr	z13, [x3]
	addvl	x3, sp, #9
	add	x3, x3, 1184
	ldr	z15, [x3]
	zip1	z13.h, z13.h, z15.h
	add	x3, x0, 1344
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x3]
// 0 "" 2
#NO_APP
	movi	d14, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x0, x0, 1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d15, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z13.h, z2.h
// 0 "" 2
#NO_APP
	add	x3, sp, 144
	addvl	x17, sp, #2
	add	z13.s, z14.s, z0.s
	add	x17, x17, 144
	str	z13, [x3]
	addvl	x3, sp, #1
	add	z2.s, z13.s, z6.s
	add	x3, x3, 144
	add	z13.s, z2.s, z16.s
	addvl	x20, sp, #3
	str	z13, [x17]
	addvl	x17, sp, #5
	str	z2, [x3]
	add	x4, x1, x2, lsl 4
	add	x17, x17, 144
	ldr	z2, [x17]
	add	x20, x20, 144
	add	z2.s, z13.s, z2.s
	sqrshrnb	z2.h, z2.s, #12
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p7, [x4, z31.s, sxtw 1]
	sub	z14.s, z14.s, z0.s
	add	z2.s, z15.s, z1.s
	sub	z15.s, z15.s, z1.s
	add	z0.s, z2.s, z4.s
	add	z1.s, z0.s, z17.s
	str	z1, [x20]
	addvl	x20, sp, #6
	lsl	x0, x2, 4
	add	x20, x20, 144
	add	x0, x0, 2
	mov	z13.d, z1.d
	ldr	z1, [x20]
	addvl	x20, sp, #4
	add	x19, x1, x0
	add	x20, x20, 144
	add	z1.s, z13.s, z1.s
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x19, z31.s, sxtw 1]
	add	x3, x0, 2
	add	z1.s, z15.s, z3.s
	sub	z15.s, z15.s, z3.s
	add	z3.s, z1.s, z12.s
	str	z3, [x20]
	addvl	x20, sp, #7
	add	x3, x1, x3
	sub	z2.s, z2.s, z4.s
	add	x17, x0, 4
	add	x20, x20, 144
	ldr	z4, [x20]
	add	z4.s, z3.s, z4.s
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x3, z31.s, sxtw 1]
	add	x17, x1, x17
	add	z4.s, z14.s, z5.s
	add	x20, sp, 144
	ldr	z13, [x20]
	add	z3.s, z4.s, z11.s
	sub	z13.s, z13.s, z6.s
	ldr	z6, [x25]
	add	x18, x0, 6
	add	z6.s, z3.s, z6.s
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x17, z31.s, sxtw 1]
	add	x18, x1, x18
	sub	z14.s, z14.s, z5.s
	add	x22, x0, 8
	add	z6.s, z14.s, z9.s
	add	z5.s, z6.s, z28.s
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x18, z31.s, sxtw 1]
	add	x22, x1, x22
	add	z5.s, z15.s, z7.s
	add	x19, x0, 10
	sub	z15.s, z15.s, z7.s
	add	z7.s, z5.s, z27.s
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x22, z31.s, sxtw 1]
	lsl	x3, x2, 4
	add	x19, x1, x19
	add	z7.s, z2.s, z8.s
	add	x21, x0, 12
	sub	z2.s, z2.s, z8.s
	add	z8.s, z7.s, z26.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p7, [x19, z31.s, sxtw 1]
	sub	z14.s, z14.s, z9.s
	add	x21, x1, x21
	add	z9.s, z13.s, z10.s
	add	x17, x3, 16
	sub	z13.s, z13.s, z10.s
	add	z10.s, z9.s, z25.s
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x21, z31.s, sxtw 1]
	add	x17, x1, x17
	add	z10.s, z13.s, z29.s
	add	x20, x0, 16
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x17, z31.s, sxtw 1]
	sub	z4.s, z4.s, z11.s
	add	x20, x1, x20
	add	z11.s, z2.s, z24.s
	add	x18, x0, 18
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x20, z31.s, sxtw 1]
	add	x18, x1, x18
	add	z11.s, z15.s, z23.s
	add	x19, x0, 20
	add	x17, x0, 22
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x18, z31.s, sxtw 1]
	add	x17, x1, x17
	sub	z1.s, z1.s, z12.s
	add	x19, x1, x19
	add	z12.s, z14.s, z22.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x19, z31.s, sxtw 1]
	add	x18, x0, 24
	add	z12.s, z4.s, z21.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x17, z31.s, sxtw 1]
	add	x17, x0, 26
	add	x18, x1, x18
	add	x17, x1, x17
	add	z12.s, z1.s, z20.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x18, z31.s, sxtw 1]
	sub	z17.s, z0.s, z17.s
	add	z12.s, z17.s, z19.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x17, z31.s, sxtw 1]
	addvl	x17, sp, #1
	add	x18, x0, 28
	add	x17, x17, 144
	ldr	z12, [x17]
	add	x18, x1, x18
	add	x17, x3, 32
	sub	z16.s, z12.s, z16.s
	add	z12.s, z16.s, z18.s
	add	x17, x1, x17
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x18, z31.s, sxtw 1]
	sub	z16.s, z16.s, z18.s
	add	x18, x0, 32
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p7, [x17, z31.s, sxtw 1]
	add	x17, x0, 34
	add	x18, x1, x18
	add	x17, x1, x17
	sub	z17.s, z17.s, z19.s
	sqrshrnb	z17.h, z17.s, #12
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	st1h	z17.s, p7, [x18, z31.s, sxtw 1]
	sub	z1.s, z1.s, z20.s
	add	x18, x0, 36
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x17, z31.s, sxtw 1]
	add	x17, x0, 38
	add	x18, x1, x18
	add	x17, x1, x17
	sub	z4.s, z4.s, z21.s
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x18, z31.s, sxtw 1]
	sub	z14.s, z14.s, z22.s
	add	x18, x0, 40
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p7, [x17, z31.s, sxtw 1]
	add	x17, x0, 42
	add	x18, x1, x18
	sub	z15.s, z15.s, z23.s
	add	x17, x1, x17
	sub	z2.s, z2.s, z24.s
	sqrshrnb	z15.h, z15.s, #12
	sqrshrnb	z2.h, z2.s, #12
	uzp1	z15.h, z15.h, z15.h
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z15.s, z15.h
	sunpklo	z2.s, z2.h
	st1h	z15.s, p7, [x18, z31.s, sxtw 1]
	st1h	z2.s, p7, [x17, z31.s, sxtw 1]
	add	x18, x0, 44
	add	x17, x3, 48
	add	x18, x1, x18
	add	x17, x1, x17
	sub	z13.s, z13.s, z29.s
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p7, [x18, z31.s, sxtw 1]
	sub	z9.s, z9.s, z25.s
	add	x18, x0, 48
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p7, [x17, z31.s, sxtw 1]
	add	x17, x0, 50
	add	x18, x1, x18
	add	x17, x1, x17
	sub	z7.s, z7.s, z26.s
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x18, z31.s, sxtw 1]
	sub	z5.s, z5.s, z27.s
	add	x18, x0, 52
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x17, z31.s, sxtw 1]
	add	x17, x0, 54
	add	x18, x1, x18
	sub	z6.s, z6.s, z28.s
	add	x17, x1, x17
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x18, z31.s, sxtw 1]
	add	x18, x0, 56
	ldr	z6, [x25]
	sub	z3.s, z3.s, z6.s
	sqrshrnb	z3.h, z3.s, #12
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	st1h	z3.s, p7, [x17, z31.s, sxtw 1]
	addvl	x17, sp, #4
	add	x18, x1, x18
	add	x17, x17, 144
	ldr	z3, [x17]
	addvl	x17, sp, #7
	add	x17, x17, 144
	ldr	z4, [x17]
	sub	z29.s, z3.s, z4.s
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p7, [x18, z31.s, sxtw 1]
	addvl	x18, sp, #3
	add	x17, x0, 58
	add	x18, x18, 144
	ldr	z29, [x18]
	add	x17, x1, x17
	addvl	x18, sp, #6
	add	x0, x0, 60
	add	x18, x18, 144
	ldr	z1, [x18]
	sub	z29.s, z29.s, z1.s
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p7, [x17, z31.s, sxtw 1]
	addvl	x17, sp, #2
	add	x0, x1, x0
	add	x17, x17, 144
	ldr	z13, [x17]
	addvl	x17, sp, #5
	add	x17, x17, 144
	ldr	z2, [x17]
	sub	z29.s, z13.s, z2.s
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p7, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #9
	adrp	x17, _ZL6CDOT_O
	add	x0, x0, 240
	ldr	z10, [x0]
	add	x17, x17, :lo12:_ZL6CDOT_O
	addvl	x0, sp, #9
	add	x0, x0, 368
	ldr	z29, [x0]
	zip1	z10.h, z10.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 496
	ldr	z11, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 624
	ldr	z29, [x0]
	zip1	z11.h, z11.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 752
	ldr	z12, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 880
	ldr	z29, [x0]
	zip1	z12.h, z12.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 1008
	ldr	z13, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 1136
	ldr	z29, [x0]
	zip1	z13.h, z13.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 1264
	ldr	z14, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 1392
	ldr	z29, [x0]
	zip1	z14.h, z14.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 1520
	ldr	z15, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 1648
	ldr	z29, [x0]
	zip1	z15.h, z15.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 1776
	ldr	z16, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 1904
	ldr	z29, [x0]
	zip1	z16.h, z16.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 2032
	ldr	z17, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 2160
	ldr	z29, [x0]
	zip1	z17.h, z17.h, z29.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z10.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+32
	add	x0, x0, :lo12:_ZL6CDOT_O+32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+64
	add	x0, x0, :lo12:_ZL6CDOT_O+64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+96
	add	x0, x0, :lo12:_ZL6CDOT_O+96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+128
	add	x0, x0, :lo12:_ZL6CDOT_O+128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+160
	add	x0, x0, :lo12:_ZL6CDOT_O+160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+192
	add	x0, x0, :lo12:_ZL6CDOT_O+192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+224
	add	x0, x0, :lo12:_ZL6CDOT_O+224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 144
	str	z29, [x0]
	adrp	x0, _ZL6CDOT_O+256
	add	x0, x0, :lo12:_ZL6CDOT_O+256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z10.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+288
	add	x0, x0, :lo12:_ZL6CDOT_O+288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+320
	add	x0, x0, :lo12:_ZL6CDOT_O+320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+352
	add	x0, x0, :lo12:_ZL6CDOT_O+352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+384
	add	x0, x0, :lo12:_ZL6CDOT_O+384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+416
	add	x0, x0, :lo12:_ZL6CDOT_O+416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+448
	add	x0, x0, :lo12:_ZL6CDOT_O+448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+480
	add	x0, x0, :lo12:_ZL6CDOT_O+480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z27.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+512
	add	x0, x0, :lo12:_ZL6CDOT_O+512
	str	z27, [x18]
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z10.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+544
	add	x0, x0, :lo12:_ZL6CDOT_O+544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+576
	add	x0, x0, :lo12:_ZL6CDOT_O+576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+608
	add	x0, x0, :lo12:_ZL6CDOT_O+608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+640
	add	x0, x0, :lo12:_ZL6CDOT_O+640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+672
	add	x0, x0, :lo12:_ZL6CDOT_O+672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+704
	add	x0, x0, :lo12:_ZL6CDOT_O+704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+736
	add	x0, x0, :lo12:_ZL6CDOT_O+736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z26.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	add	x0, x0, 144
	str	z26, [x0]
	adrp	x0, _ZL6CDOT_O+768
	add	x0, x0, :lo12:_ZL6CDOT_O+768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z10.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+800
	add	x0, x0, :lo12:_ZL6CDOT_O+800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+832
	add	x0, x0, :lo12:_ZL6CDOT_O+832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+864
	add	x0, x0, :lo12:_ZL6CDOT_O+864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+896
	add	x0, x0, :lo12:_ZL6CDOT_O+896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+928
	add	x0, x0, :lo12:_ZL6CDOT_O+928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+960
	add	x0, x0, :lo12:_ZL6CDOT_O+960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+992
	add	x0, x0, :lo12:_ZL6CDOT_O+992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z25.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1024
	add	x0, x0, :lo12:_ZL6CDOT_O+1024
	str	z25, [x25]
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d28, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z10.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1056
	add	x0, x0, :lo12:_ZL6CDOT_O+1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1088
	add	x0, x0, :lo12:_ZL6CDOT_O+1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1120
	add	x0, x0, :lo12:_ZL6CDOT_O+1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1152
	add	x0, x0, :lo12:_ZL6CDOT_O+1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1184
	add	x0, x0, :lo12:_ZL6CDOT_O+1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1216
	add	x0, x0, :lo12:_ZL6CDOT_O+1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1248
	add	x0, x0, :lo12:_ZL6CDOT_O+1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1280
	add	x0, x0, :lo12:_ZL6CDOT_O+1280
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d27, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z10.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1312
	add	x0, x0, :lo12:_ZL6CDOT_O+1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1344
	add	x0, x0, :lo12:_ZL6CDOT_O+1344
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1376
	add	x0, x0, :lo12:_ZL6CDOT_O+1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x30]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1440
	add	x0, x0, :lo12:_ZL6CDOT_O+1440
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1472
	add	x0, x0, :lo12:_ZL6CDOT_O+1472
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1504
	add	x0, x0, :lo12:_ZL6CDOT_O+1504
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1536
	add	x0, x0, :lo12:_ZL6CDOT_O+1536
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d26, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z10.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1568
	add	x0, x0, :lo12:_ZL6CDOT_O+1568
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1600
	add	x0, x0, :lo12:_ZL6CDOT_O+1600
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1632
	add	x0, x0, :lo12:_ZL6CDOT_O+1632
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1664
	add	x0, x0, :lo12:_ZL6CDOT_O+1664
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1696
	add	x0, x0, :lo12:_ZL6CDOT_O+1696
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1728
	add	x0, x0, :lo12:_ZL6CDOT_O+1728
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1760
	add	x0, x0, :lo12:_ZL6CDOT_O+1760
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1792
	add	x0, x0, :lo12:_ZL6CDOT_O+1792
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d25, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z10.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1824
	add	x0, x0, :lo12:_ZL6CDOT_O+1824
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1856
	add	x0, x0, :lo12:_ZL6CDOT_O+1856
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1888
	add	x0, x0, :lo12:_ZL6CDOT_O+1888
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1920
	add	x0, x0, :lo12:_ZL6CDOT_O+1920
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x15]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x14]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z17.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x13]
// 0 "" 2
#NO_APP
	movi	d24, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z10.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x12]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x11]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x10]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x9]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x8]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x7]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x6]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z17.h, z29.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	movi	d23, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z10.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x16, _ZL6CDOT_O+2336
	add	x16, x16, :lo12:_ZL6CDOT_O+2336
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x15, _ZL6CDOT_O+2368
	add	x15, x15, :lo12:_ZL6CDOT_O+2368
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x15]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x14, _ZL6CDOT_O+2400
	add	x14, x14, :lo12:_ZL6CDOT_O+2400
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x14]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x13, _ZL6CDOT_O+2432
	add	x13, x13, :lo12:_ZL6CDOT_O+2432
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x13]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x12, _ZL6CDOT_O+2464
	add	x12, x12, :lo12:_ZL6CDOT_O+2464
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x12]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x11, _ZL6CDOT_O+2496
	add	x11, x11, :lo12:_ZL6CDOT_O+2496
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x11]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x10, _ZL6CDOT_O+2528
	add	x10, x10, :lo12:_ZL6CDOT_O+2528
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x10]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x9, _ZL6CDOT_O+2560
	add	x9, x9, :lo12:_ZL6CDOT_O+2560
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x9]
// 0 "" 2
#NO_APP
	movi	d22, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z10.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x8, _ZL6CDOT_O+2592
	add	x8, x8, :lo12:_ZL6CDOT_O+2592
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x8]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x7, _ZL6CDOT_O+2624
	add	x7, x7, :lo12:_ZL6CDOT_O+2624
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x7]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x6, _ZL6CDOT_O+2656
	add	x6, x6, :lo12:_ZL6CDOT_O+2656
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x6]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x5, _ZL6CDOT_O+2688
	add	x5, x5, :lo12:_ZL6CDOT_O+2688
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2720
	add	x0, x0, :lo12:_ZL6CDOT_O+2720
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2752
	add	x0, x0, :lo12:_ZL6CDOT_O+2752
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2784
	add	x0, x0, :lo12:_ZL6CDOT_O+2784
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2816
	add	x0, x0, :lo12:_ZL6CDOT_O+2816
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d21, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z10.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2848
	add	x0, x0, :lo12:_ZL6CDOT_O+2848
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2880
	add	x0, x0, :lo12:_ZL6CDOT_O+2880
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2912
	add	x0, x0, :lo12:_ZL6CDOT_O+2912
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2944
	add	x0, x0, :lo12:_ZL6CDOT_O+2944
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2976
	add	x0, x0, :lo12:_ZL6CDOT_O+2976
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3008
	add	x0, x0, :lo12:_ZL6CDOT_O+3008
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3040
	add	x0, x0, :lo12:_ZL6CDOT_O+3040
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3072
	add	x0, x0, :lo12:_ZL6CDOT_O+3072
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d20, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z10.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3104
	add	x0, x0, :lo12:_ZL6CDOT_O+3104
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3136
	add	x0, x0, :lo12:_ZL6CDOT_O+3136
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3168
	add	x0, x0, :lo12:_ZL6CDOT_O+3168
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3200
	add	x0, x0, :lo12:_ZL6CDOT_O+3200
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3232
	add	x0, x0, :lo12:_ZL6CDOT_O+3232
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3264
	add	x0, x0, :lo12:_ZL6CDOT_O+3264
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3296
	add	x0, x0, :lo12:_ZL6CDOT_O+3296
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3328
	add	x0, x0, :lo12:_ZL6CDOT_O+3328
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d19, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z10.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3360
	add	x0, x0, :lo12:_ZL6CDOT_O+3360
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3392
	add	x0, x0, :lo12:_ZL6CDOT_O+3392
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3424
	add	x0, x0, :lo12:_ZL6CDOT_O+3424
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3456
	add	x0, x0, :lo12:_ZL6CDOT_O+3456
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3488
	add	x0, x0, :lo12:_ZL6CDOT_O+3488
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3520
	add	x0, x0, :lo12:_ZL6CDOT_O+3520
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3552
	add	x0, x0, :lo12:_ZL6CDOT_O+3552
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3584
	add	x0, x0, :lo12:_ZL6CDOT_O+3584
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d18, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z10.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3616
	add	x0, x0, :lo12:_ZL6CDOT_O+3616
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3648
	add	x0, x0, :lo12:_ZL6CDOT_O+3648
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3680
	add	x0, x0, :lo12:_ZL6CDOT_O+3680
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3712
	add	x0, x0, :lo12:_ZL6CDOT_O+3712
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3744
	add	x0, x0, :lo12:_ZL6CDOT_O+3744
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3776
	add	x0, x0, :lo12:_ZL6CDOT_O+3776
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3808
	add	x0, x0, :lo12:_ZL6CDOT_O+3808
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z29.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3840
	add	x0, x0, :lo12:_ZL6CDOT_O+3840
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d29, #0
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z10.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3872
	add	x0, x0, :lo12:_ZL6CDOT_O+3872
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3904
	add	x0, x0, :lo12:_ZL6CDOT_O+3904
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3936
	add	x0, x0, :lo12:_ZL6CDOT_O+3936
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3968
	add	x0, x0, :lo12:_ZL6CDOT_O+3968
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+4000
	add	x0, x0, :lo12:_ZL6CDOT_O+4000
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+4032
	add	x0, x0, :lo12:_ZL6CDOT_O+4032
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+4064
	add	x0, x0, :lo12:_ZL6CDOT_O+4064
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z30.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x17, sp, #9
	adrp	x0, .LANCHOR0
	add	x17, x17, 304
	ldr	z6, [x17]
	add	x0, x0, :lo12:.LANCHOR0
	addvl	x17, sp, #9
	add	x17, x17, 560
	ldr	z30, [x17]
	zip1	z6.h, z6.h, z30.h
	addvl	x17, sp, #9
	add	x17, x17, 816
	ldr	z13, [x17]
	addvl	x17, sp, #9
	add	x17, x17, 1072
	ldr	z30, [x17]
	zip1	z13.h, z13.h, z30.h
	addvl	x17, sp, #9
	add	x17, x17, 1328
	ldr	z14, [x17]
	addvl	x17, sp, #9
	add	x17, x17, 1584
	ldr	z30, [x17]
	zip1	z14.h, z14.h, z30.h
	addvl	x17, sp, #9
	add	x17, x17, 1840
	ldr	z15, [x17]
	addvl	x17, sp, #9
	add	x17, x17, 2096
	ldr	z30, [x17]
	zip1	z15.h, z15.h, z30.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	movi	d30, #0
	mov	z16.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z6.h, z17.h
// 0 "" 2
#NO_APP
	add	x17, x0, 32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z13.h, z17.h
// 0 "" 2
#NO_APP
	add	x17, x0, 64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z14.h, z17.h
// 0 "" 2
#NO_APP
	add	x17, x0, 96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z16.s, z15.h, z17.h
// 0 "" 2
#NO_APP
	add	x17, x0, 128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z17.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z6.h, z12.h
// 0 "" 2
#NO_APP
	add	x17, x0, 160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	add	x17, x0, 192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	add	x17, x0, 224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	add	x17, x0, 256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z12.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z6.h, z11.h
// 0 "" 2
#NO_APP
	add	x17, x0, 288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	add	x17, x0, 320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	add	x17, x0, 352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	add	x17, x0, 384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z11.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z6.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 512
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z9.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z6.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z7.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z6.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z8.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z6.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x17, x0, 896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z5.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z10.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z6.h, z5.h
// 0 "" 2
#NO_APP
	add	x17, x0, 928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z6.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z13.h, z6.h
// 0 "" 2
#NO_APP
	add	x17, x0, 960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x17, x0, 992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x17, sp, #9
	add	x17, x17, 432
	ldr	z14, [x17]
	addvl	x17, sp, #9
	add	x17, x17, 944
	ldr	z13, [x17]
	zip1	z14.h, z14.h, z13.h
	addvl	x17, sp, #9
	add	x17, x17, 1456
	ldr	z15, [x17]
	addvl	x17, sp, #9
	add	x17, x17, 1968
	ldr	z13, [x17]
	zip1	z15.h, z15.h, z13.h
	add	x17, x0, 1024
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z6.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x17, x0, 1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	add	x17, x0, 1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z4.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x17, x0, 1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	add	x17, x0, 1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z3.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x17, x0, 1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	add	x17, x0, 1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z5.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x17, x0, 1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x17]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x17, sp, #9
	add	x17, x17, 688
	ldr	z15, [x17]
	addvl	x17, sp, #9
	add	x17, x17, 1712
	ldr	z14, [x17]
	zip1	z15.h, z15.h, z14.h
	add	x17, x0, 1280
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z0.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z0.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x17, x0, 1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z1.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x17, sp, #9
	add	x17, x17, 176
	ldr	z13, [x17]
	addvl	x17, sp, #9
	add	x17, x17, 1200
	ldr	z15, [x17]
	zip1	z13.h, z13.h, z15.h
	add	x17, x0, 1344
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z14.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x0, x0, 1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z2.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z15.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z13.h, z2.h
// 0 "" 2
#NO_APP
	add	x17, sp, 144
	add	z13.s, z14.s, z0.s
	str	z13, [x17]
	addvl	x17, sp, #1
	add	z2.s, z13.s, z6.s
	addvl	x21, sp, #3
	add	x17, x17, 144
	str	z2, [x17]
	add	z13.s, z2.s, z16.s
	addvl	x17, sp, #2
	add	x4, x4, x3
	sub	z14.s, z14.s, z0.s
	add	x17, x17, 144
	str	z13, [x17]
	add	x21, x21, 144
	addvl	x17, sp, #5
	lsl	x0, x2, 5
	add	x17, x17, 144
	ldr	z2, [x17]
	add	z2.s, z13.s, z2.s
	sqrshrnb	z2.h, z2.s, #12
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p7, [x4, z31.s, sxtw 1]
	add	z2.s, z15.s, z1.s
	sub	z15.s, z15.s, z1.s
	add	z0.s, z2.s, z4.s
	add	z1.s, z0.s, z17.s
	str	z1, [x21]
	addvl	x21, sp, #6
	add	x0, x0, 2
	mov	z13.d, z1.d
	add	x21, x21, 144
	ldr	z1, [x21]
	add	x19, x1, x0
	addvl	x21, sp, #4
	add	z1.s, z13.s, z1.s
	sqrshrnb	z1.h, z1.s, #12
	add	x21, x21, 144
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x19, z31.s, sxtw 1]
	add	x20, x0, 2
	add	z1.s, z15.s, z3.s
	sub	z15.s, z15.s, z3.s
	add	z3.s, z1.s, z12.s
	str	z3, [x21]
	addvl	x21, sp, #7
	add	x20, x1, x20
	sub	z2.s, z2.s, z4.s
	add	x17, x0, 4
	add	x21, x21, 144
	ldr	z4, [x21]
	add	z4.s, z3.s, z4.s
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x20, z31.s, sxtw 1]
	add	x17, x1, x17
	add	z4.s, z14.s, z5.s
	add	x20, sp, 144
	ldr	z13, [x20]
	add	z3.s, z4.s, z11.s
	sub	z13.s, z13.s, z6.s
	ldr	z6, [x25]
	add	x18, x0, 6
	add	z6.s, z3.s, z6.s
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x17, z31.s, sxtw 1]
	add	x18, x1, x18
	sub	z14.s, z14.s, z5.s
	add	x22, x0, 8
	add	z6.s, z14.s, z9.s
	add	z5.s, z6.s, z28.s
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x18, z31.s, sxtw 1]
	add	x22, x1, x22
	add	z5.s, z15.s, z7.s
	add	x19, x0, 10
	sub	z15.s, z15.s, z7.s
	add	z7.s, z5.s, z27.s
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x22, z31.s, sxtw 1]
	add	x19, x1, x19
	add	z7.s, z2.s, z8.s
	add	x21, x0, 12
	sub	z2.s, z2.s, z8.s
	add	z8.s, z7.s, z26.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p7, [x19, z31.s, sxtw 1]
	sub	z14.s, z14.s, z9.s
	add	x21, x1, x21
	add	z9.s, z13.s, z10.s
	add	x17, x0, 14
	sub	z13.s, z13.s, z10.s
	add	z10.s, z9.s, z25.s
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x21, z31.s, sxtw 1]
	add	x17, x1, x17
	add	z10.s, z13.s, z24.s
	add	x20, x0, 16
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x17, z31.s, sxtw 1]
	sub	z4.s, z4.s, z11.s
	add	x18, x0, 18
	add	z11.s, z2.s, z23.s
	add	x20, x1, x20
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x20, z31.s, sxtw 1]
	add	x18, x1, x18
	add	z11.s, z15.s, z22.s
	add	x19, x0, 20
	add	x17, x0, 22
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x18, z31.s, sxtw 1]
	add	x17, x1, x17
	sub	z1.s, z1.s, z12.s
	add	x19, x1, x19
	add	z12.s, z14.s, z21.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x19, z31.s, sxtw 1]
	add	x18, x0, 24
	add	z12.s, z4.s, z20.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x17, z31.s, sxtw 1]
	add	x17, x0, 26
	add	x18, x1, x18
	add	x17, x1, x17
	add	z12.s, z1.s, z19.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x18, z31.s, sxtw 1]
	sub	z17.s, z0.s, z17.s
	add	z12.s, z17.s, z18.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x17, z31.s, sxtw 1]
	addvl	x17, sp, #1
	add	x18, x0, 28
	add	x17, x17, 144
	ldr	z12, [x17]
	add	x18, x1, x18
	add	x17, x1, x2, lsl 5
	sub	z16.s, z12.s, z16.s
	add	z12.s, z16.s, z29.s
	add	x17, x17, 32
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x18, z31.s, sxtw 1]
	sub	z16.s, z16.s, z29.s
	add	x18, x0, 32
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p7, [x17, z31.s, sxtw 1]
	add	x17, x0, 34
	add	x18, x1, x18
	add	x17, x1, x17
	sub	z17.s, z17.s, z18.s
	sqrshrnb	z17.h, z17.s, #12
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	st1h	z17.s, p7, [x18, z31.s, sxtw 1]
	sub	z1.s, z1.s, z19.s
	add	x18, x0, 36
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x17, z31.s, sxtw 1]
	add	x17, x0, 38
	add	x18, x1, x18
	add	x17, x1, x17
	sub	z4.s, z4.s, z20.s
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x18, z31.s, sxtw 1]
	sub	z14.s, z14.s, z21.s
	add	x18, x0, 40
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p7, [x17, z31.s, sxtw 1]
	add	x17, x0, 42
	add	x18, x1, x18
	sub	z15.s, z15.s, z22.s
	add	x17, x1, x17
	sub	z2.s, z2.s, z23.s
	sqrshrnb	z15.h, z15.s, #12
	sqrshrnb	z2.h, z2.s, #12
	uzp1	z15.h, z15.h, z15.h
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z15.s, z15.h
	sunpklo	z2.s, z2.h
	st1h	z15.s, p7, [x18, z31.s, sxtw 1]
	st1h	z2.s, p7, [x17, z31.s, sxtw 1]
	add	x18, x0, 44
	add	x17, x0, 46
	add	x18, x1, x18
	add	x17, x1, x17
	sub	z13.s, z13.s, z24.s
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p7, [x18, z31.s, sxtw 1]
	sub	z9.s, z9.s, z25.s
	add	x18, x0, 48
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p7, [x17, z31.s, sxtw 1]
	add	x17, x0, 50
	add	x18, x1, x18
	add	x17, x1, x17
	sub	z7.s, z7.s, z26.s
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x18, z31.s, sxtw 1]
	sub	z5.s, z5.s, z27.s
	add	x18, x0, 52
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x17, z31.s, sxtw 1]
	add	x17, x0, 54
	add	x18, x1, x18
	sub	z6.s, z6.s, z28.s
	add	x17, x1, x17
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x18, z31.s, sxtw 1]
	add	x18, x0, 56
	ldr	z6, [x25]
	sub	z3.s, z3.s, z6.s
	sqrshrnb	z3.h, z3.s, #12
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	st1h	z3.s, p7, [x17, z31.s, sxtw 1]
	addvl	x17, sp, #4
	add	x18, x1, x18
	add	x17, x17, 144
	ldr	z3, [x17]
	addvl	x17, sp, #7
	add	x17, x17, 144
	ldr	z4, [x17]
	sub	z29.s, z3.s, z4.s
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p7, [x18, z31.s, sxtw 1]
	addvl	x18, sp, #3
	add	x17, x0, 58
	add	x18, x18, 144
	ldr	z28, [x18]
	add	x17, x1, x17
	addvl	x18, sp, #6
	add	x0, x0, 60
	add	x18, x18, 144
	ldr	z1, [x18]
	sub	z29.s, z28.s, z1.s
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p7, [x17, z31.s, sxtw 1]
	addvl	x17, sp, #2
	add	x0, x1, x0
	add	x17, x17, 144
	ldr	z13, [x17]
	addvl	x17, sp, #5
	add	x17, x17, 144
	ldr	z2, [x17]
	sub	z29.s, z13.s, z2.s
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p7, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #9
	adrp	x17, _ZL6CDOT_O
	add	x0, x0, 256
	ldr	z9, [x0]
	add	x17, x17, :lo12:_ZL6CDOT_O
	addvl	x0, sp, #9
	add	x0, x0, 384
	ldr	z29, [x0]
	zip1	z9.h, z9.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 512
	ldr	z10, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 640
	ldr	z29, [x0]
	zip1	z10.h, z10.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 768
	ldr	z11, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 896
	ldr	z29, [x0]
	zip1	z11.h, z11.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 1024
	ldr	z12, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 1152
	ldr	z29, [x0]
	zip1	z12.h, z12.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 1280
	ldr	z13, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 1408
	ldr	z29, [x0]
	zip1	z13.h, z13.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 1536
	ldr	z14, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 1664
	ldr	z29, [x0]
	zip1	z14.h, z14.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 1792
	ldr	z15, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 1920
	ldr	z29, [x0]
	zip1	z15.h, z15.h, z29.h
	addvl	x0, sp, #9
	add	x0, x0, 2048
	ldr	z16, [x0]
	addvl	x0, sp, #9
	add	x0, x0, 2176
	ldr	z29, [x0]
	zip1	z16.h, z16.h, z29.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x17]
// 0 "" 2
#NO_APP
	mov	z29.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+32
	add	x0, x0, :lo12:_ZL6CDOT_O+32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z10.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+64
	add	x0, x0, :lo12:_ZL6CDOT_O+64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+96
	add	x0, x0, :lo12:_ZL6CDOT_O+96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+128
	add	x0, x0, :lo12:_ZL6CDOT_O+128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+160
	add	x0, x0, :lo12:_ZL6CDOT_O+160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+192
	add	x0, x0, :lo12:_ZL6CDOT_O+192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+224
	add	x0, x0, :lo12:_ZL6CDOT_O+224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 144
	str	z29, [x0]
	adrp	x0, _ZL6CDOT_O+256
	add	x0, x0, :lo12:_ZL6CDOT_O+256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z29.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+288
	add	x0, x0, :lo12:_ZL6CDOT_O+288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z10.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+320
	add	x0, x0, :lo12:_ZL6CDOT_O+320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+352
	add	x0, x0, :lo12:_ZL6CDOT_O+352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+384
	add	x0, x0, :lo12:_ZL6CDOT_O+384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+416
	add	x0, x0, :lo12:_ZL6CDOT_O+416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+448
	add	x0, x0, :lo12:_ZL6CDOT_O+448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+480
	add	x0, x0, :lo12:_ZL6CDOT_O+480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z27.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+512
	add	x0, x0, :lo12:_ZL6CDOT_O+512
	str	z27, [x18]
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z29.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+544
	add	x0, x0, :lo12:_ZL6CDOT_O+544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z10.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+576
	add	x0, x0, :lo12:_ZL6CDOT_O+576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+608
	add	x0, x0, :lo12:_ZL6CDOT_O+608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+640
	add	x0, x0, :lo12:_ZL6CDOT_O+640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+672
	add	x0, x0, :lo12:_ZL6CDOT_O+672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+704
	add	x0, x0, :lo12:_ZL6CDOT_O+704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+736
	add	x0, x0, :lo12:_ZL6CDOT_O+736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z26.d, z29.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	add	x0, x0, 144
	str	z26, [x0]
	adrp	x0, _ZL6CDOT_O+768
	add	x0, x0, :lo12:_ZL6CDOT_O+768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z29.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z9.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+800
	add	x0, x0, :lo12:_ZL6CDOT_O+800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z10.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+832
	add	x0, x0, :lo12:_ZL6CDOT_O+832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+864
	add	x0, x0, :lo12:_ZL6CDOT_O+864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+896
	add	x0, x0, :lo12:_ZL6CDOT_O+896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+928
	add	x0, x0, :lo12:_ZL6CDOT_O+928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+960
	add	x0, x0, :lo12:_ZL6CDOT_O+960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+992
	add	x0, x0, :lo12:_ZL6CDOT_O+992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z28.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z29.s, z16.h, z28.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1024
	add	x0, x0, :lo12:_ZL6CDOT_O+1024
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z28.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z9.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1056
	add	x0, x0, :lo12:_ZL6CDOT_O+1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z10.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1088
	add	x0, x0, :lo12:_ZL6CDOT_O+1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1120
	add	x0, x0, :lo12:_ZL6CDOT_O+1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1152
	add	x0, x0, :lo12:_ZL6CDOT_O+1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1184
	add	x0, x0, :lo12:_ZL6CDOT_O+1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1216
	add	x0, x0, :lo12:_ZL6CDOT_O+1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1248
	add	x0, x0, :lo12:_ZL6CDOT_O+1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z27.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z28.s, z16.h, z27.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1280
	add	x0, x0, :lo12:_ZL6CDOT_O+1280
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z27.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z9.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1312
	add	x0, x0, :lo12:_ZL6CDOT_O+1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z10.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1344
	add	x0, x0, :lo12:_ZL6CDOT_O+1344
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z11.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1376
	add	x0, x0, :lo12:_ZL6CDOT_O+1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z12.h, z26.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x30]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z13.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1440
	add	x0, x0, :lo12:_ZL6CDOT_O+1440
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z14.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1472
	add	x0, x0, :lo12:_ZL6CDOT_O+1472
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1504
	add	x0, x0, :lo12:_ZL6CDOT_O+1504
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z26.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z27.s, z16.h, z26.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1536
	add	x0, x0, :lo12:_ZL6CDOT_O+1536
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z26.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z9.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1568
	add	x0, x0, :lo12:_ZL6CDOT_O+1568
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z10.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1600
	add	x0, x0, :lo12:_ZL6CDOT_O+1600
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z11.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1632
	add	x0, x0, :lo12:_ZL6CDOT_O+1632
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z12.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1664
	add	x0, x0, :lo12:_ZL6CDOT_O+1664
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z13.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1696
	add	x0, x0, :lo12:_ZL6CDOT_O+1696
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z14.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1728
	add	x0, x0, :lo12:_ZL6CDOT_O+1728
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z15.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1760
	add	x0, x0, :lo12:_ZL6CDOT_O+1760
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z25.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z26.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1792
	add	x0, x0, :lo12:_ZL6CDOT_O+1792
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z25.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z9.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1824
	add	x0, x0, :lo12:_ZL6CDOT_O+1824
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z10.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1856
	add	x0, x0, :lo12:_ZL6CDOT_O+1856
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z11.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1888
	add	x0, x0, :lo12:_ZL6CDOT_O+1888
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z12.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1920
	add	x0, x0, :lo12:_ZL6CDOT_O+1920
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z13.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1952
	add	x0, x0, :lo12:_ZL6CDOT_O+1952
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z14.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+1984
	add	x0, x0, :lo12:_ZL6CDOT_O+1984
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z15.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2016
	add	x0, x0, :lo12:_ZL6CDOT_O+2016
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z24.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z25.s, z16.h, z24.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2048
	add	x0, x0, :lo12:_ZL6CDOT_O+2048
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z24.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z9.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2080
	add	x0, x0, :lo12:_ZL6CDOT_O+2080
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z10.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2112
	add	x0, x0, :lo12:_ZL6CDOT_O+2112
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z11.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2144
	add	x0, x0, :lo12:_ZL6CDOT_O+2144
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z12.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2176
	add	x0, x0, :lo12:_ZL6CDOT_O+2176
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z13.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2208
	add	x0, x0, :lo12:_ZL6CDOT_O+2208
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z14.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2240
	add	x0, x0, :lo12:_ZL6CDOT_O+2240
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2272
	add	x0, x0, :lo12:_ZL6CDOT_O+2272
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z23.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z24.s, z16.h, z23.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2304
	add	x0, x0, :lo12:_ZL6CDOT_O+2304
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z23.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z9.h, z22.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x16]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z10.h, z22.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x15]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z11.h, z22.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x14]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z12.h, z22.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x13]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z13.h, z22.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x12]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z14.h, z22.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x11]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z15.h, z22.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z22.h, p6/z, [x10]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z23.s, z16.h, z22.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x9]
// 0 "" 2
#NO_APP
	mov	z22.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z9.h, z21.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x8]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z10.h, z21.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x7]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z11.h, z21.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x6]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z12.h, z21.h
// 0 "" 2
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z13.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2720
	add	x0, x0, :lo12:_ZL6CDOT_O+2720
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z14.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2752
	add	x0, x0, :lo12:_ZL6CDOT_O+2752
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z15.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2784
	add	x0, x0, :lo12:_ZL6CDOT_O+2784
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z21.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z22.s, z16.h, z21.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2816
	add	x0, x0, :lo12:_ZL6CDOT_O+2816
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z21.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z9.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2848
	add	x0, x0, :lo12:_ZL6CDOT_O+2848
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z10.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2880
	add	x0, x0, :lo12:_ZL6CDOT_O+2880
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z11.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2912
	add	x0, x0, :lo12:_ZL6CDOT_O+2912
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z12.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2944
	add	x0, x0, :lo12:_ZL6CDOT_O+2944
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z13.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+2976
	add	x0, x0, :lo12:_ZL6CDOT_O+2976
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z14.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3008
	add	x0, x0, :lo12:_ZL6CDOT_O+3008
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z15.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3040
	add	x0, x0, :lo12:_ZL6CDOT_O+3040
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z20.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z21.s, z16.h, z20.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3072
	add	x0, x0, :lo12:_ZL6CDOT_O+3072
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z20.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z9.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3104
	add	x0, x0, :lo12:_ZL6CDOT_O+3104
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z10.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3136
	add	x0, x0, :lo12:_ZL6CDOT_O+3136
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z11.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3168
	add	x0, x0, :lo12:_ZL6CDOT_O+3168
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z12.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3200
	add	x0, x0, :lo12:_ZL6CDOT_O+3200
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z13.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3232
	add	x0, x0, :lo12:_ZL6CDOT_O+3232
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z14.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3264
	add	x0, x0, :lo12:_ZL6CDOT_O+3264
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z15.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3296
	add	x0, x0, :lo12:_ZL6CDOT_O+3296
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z19.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z20.s, z16.h, z19.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3328
	add	x0, x0, :lo12:_ZL6CDOT_O+3328
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z19.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z9.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3360
	add	x0, x0, :lo12:_ZL6CDOT_O+3360
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z10.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3392
	add	x0, x0, :lo12:_ZL6CDOT_O+3392
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z11.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3424
	add	x0, x0, :lo12:_ZL6CDOT_O+3424
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z12.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3456
	add	x0, x0, :lo12:_ZL6CDOT_O+3456
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z13.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3488
	add	x0, x0, :lo12:_ZL6CDOT_O+3488
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z14.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3520
	add	x0, x0, :lo12:_ZL6CDOT_O+3520
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z15.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3552
	add	x0, x0, :lo12:_ZL6CDOT_O+3552
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z18.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z19.s, z16.h, z18.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3584
	add	x0, x0, :lo12:_ZL6CDOT_O+3584
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z18.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z9.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3616
	add	x0, x0, :lo12:_ZL6CDOT_O+3616
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z10.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3648
	add	x0, x0, :lo12:_ZL6CDOT_O+3648
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z11.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3680
	add	x0, x0, :lo12:_ZL6CDOT_O+3680
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z12.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3712
	add	x0, x0, :lo12:_ZL6CDOT_O+3712
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z13.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3744
	add	x0, x0, :lo12:_ZL6CDOT_O+3744
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z14.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3776
	add	x0, x0, :lo12:_ZL6CDOT_O+3776
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z15.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3808
	add	x0, x0, :lo12:_ZL6CDOT_O+3808
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z17.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z18.s, z16.h, z17.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3840
	add	x0, x0, :lo12:_ZL6CDOT_O+3840
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z17.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z9.h, z8.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3872
	add	x0, x0, :lo12:_ZL6CDOT_O+3872
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z10.h, z9.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3904
	add	x0, x0, :lo12:_ZL6CDOT_O+3904
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z11.h, z10.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3936
	add	x0, x0, :lo12:_ZL6CDOT_O+3936
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z11.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+3968
	add	x0, x0, :lo12:_ZL6CDOT_O+3968
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+4000
	add	x0, x0, :lo12:_ZL6CDOT_O+4000
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+4032
	add	x0, x0, :lo12:_ZL6CDOT_O+4032
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	adrp	x0, _ZL6CDOT_O+4064
	add	x0, x0, :lo12:_ZL6CDOT_O+4064
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z17.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #9
	adrp	x0, .LANCHOR0
	add	x5, x5, 320
	ldr	z13, [x5]
	add	x0, x0, :lo12:.LANCHOR0
	addvl	x5, sp, #9
	add	x5, x5, 576
	ldr	z16, [x5]
	zip1	z13.h, z13.h, z16.h
	addvl	x5, sp, #9
	add	x5, x5, 832
	ldr	z14, [x5]
	addvl	x5, sp, #9
	add	x5, x5, 1088
	ldr	z16, [x5]
	zip1	z14.h, z14.h, z16.h
	addvl	x5, sp, #9
	add	x5, x5, 1344
	ldr	z15, [x5]
	addvl	x5, sp, #9
	add	x5, x5, 1600
	ldr	z12, [x5]
	zip1	z15.h, z15.h, z12.h
	addvl	x5, sp, #9
	add	x5, x5, 1856
	ldr	z16, [x5]
	addvl	x5, sp, #9
	add	x5, x5, 2112
	ldr	z12, [x5]
	zip1	z16.h, z16.h, z12.h
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x0]
// 0 "" 2
#NO_APP
	mov	z11.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	add	x5, x0, 32
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	add	x5, x0, 64
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	add	x5, x0, 96
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z12.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z11.s, z16.h, z12.h
// 0 "" 2
#NO_APP
	add	x5, x0, 128
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z12.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x0, 160
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x0, 192
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x0, 224
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z10.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z12.s, z16.h, z10.h
// 0 "" 2
#NO_APP
	add	x5, x0, 256
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z10.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z13.h, z9.h
// 0 "" 2
#NO_APP
	add	x5, x0, 288
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z14.h, z9.h
// 0 "" 2
#NO_APP
	add	x5, x0, 320
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	add	x5, x0, 352
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z9.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z10.s, z16.h, z9.h
// 0 "" 2
#NO_APP
	add	x5, x0, 384
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z9.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	add	x5, x0, 416
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	add	x5, x0, 448
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	add	x5, x0, 480
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z8.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z9.s, z16.h, z8.h
// 0 "" 2
#NO_APP
	add	x5, x0, 512
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z8.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z13.h, z7.h
// 0 "" 2
#NO_APP
	add	x5, x0, 544
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z14.h, z7.h
// 0 "" 2
#NO_APP
	add	x5, x0, 576
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	add	x5, x0, 608
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z8.s, z16.h, z7.h
// 0 "" 2
#NO_APP
	add	x5, x0, 640
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z5.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z13.h, z7.h
// 0 "" 2
#NO_APP
	add	x5, x0, 672
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z14.h, z7.h
// 0 "" 2
#NO_APP
	add	x5, x0, 704
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	add	x5, x0, 736
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z5.s, z16.h, z7.h
// 0 "" 2
#NO_APP
	add	x5, x0, 768
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z6.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z13.h, z7.h
// 0 "" 2
#NO_APP
	add	x5, x0, 800
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z14.h, z7.h
// 0 "" 2
#NO_APP
	add	x5, x0, 832
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	add	x5, x0, 864
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z7.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z6.s, z16.h, z7.h
// 0 "" 2
#NO_APP
	add	x5, x0, 896
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z7.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z13.h, z4.h
// 0 "" 2
#NO_APP
	add	x5, x0, 928
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	add	x5, x0, 960
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x5, x0, 992
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z7.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #9
	add	x5, x5, 448
	ldr	z15, [x5]
	addvl	x5, sp, #9
	add	x5, x5, 960
	ldr	z14, [x5]
	zip1	z15.h, z15.h, z14.h
	addvl	x5, sp, #9
	add	x5, x5, 1472
	ldr	z16, [x5]
	addvl	x5, sp, #9
	add	x5, x5, 1984
	ldr	z14, [x5]
	zip1	z16.h, z16.h, z14.h
	add	x5, x0, 1024
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z2.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x5, x0, 1056
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z14.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z2.s, z16.h, z14.h
// 0 "" 2
#NO_APP
	add	x5, x0, 1088
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z14.d, z30.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	add	x5, x0, 1120
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z14.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	add	x5, x0, 1152
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	add	x5, x0, 1184
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z13.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z30.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	add	x5, x0, 1216
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	movi	d13, #0
	mov	z3.d, z13.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z15.h, z4.h
// 0 "" 2
#NO_APP
	add	x5, x0, 1248
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z15.h, p6/z, [x5]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z3.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #9
	add	x5, x5, 704
	ldr	z16, [x5]
	addvl	x5, sp, #9
	add	x5, x5, 1728
	ldr	z15, [x5]
	zip1	z16.h, z16.h, z15.h
	add	x5, x0, 1280
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z4.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z15.d, z13.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z15.s, z16.h, z4.h
// 0 "" 2
#NO_APP
	add	x5, x0, 1312
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z1.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z4.d, z13.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z4.s, z16.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x5, sp, #9
	add	x5, x5, 192
	ldr	z16, [x5]
	addvl	x5, sp, #9
	add	x5, x5, 1216
	ldr	z1, [x5]
	zip1	z16.h, z16.h, z1.h
	add	x5, x0, 1344
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p6/z, [x5]
// 0 "" 2
#NO_APP
	mov	z1.d, z13.d
#APP
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z1.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	add	x0, x0, 1376
#APP
// 272 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	ld1h z0.h, p6/z, [x0]
// 0 "" 2
// 260 "/home/chiro/projects/a64-simd-dyn-optimizer/kernels/idct32/candidates/best_sve2.cpp" 1
	sdot z13.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	add	x3, x3, x4
	addvl	x4, sp, #2
	add	z16.s, z1.s, z15.s
	add	x2, x2, x2, lsl 1
	add	x4, x4, 144
	add	z0.s, z16.s, z2.s
	add	x0, sp, 144
	str	z0, [x0]
	add	z0.s, z0.s, z11.s
	str	z0, [x4]
	addvl	x4, sp, #5
	sub	z1.s, z1.s, z15.s
	lsl	x0, x2, 4
	add	x4, x4, 144
	ldr	z15, [x4]
	addvl	x5, sp, #3
	add	z15.s, z0.s, z15.s
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p7, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	add	x0, x0, 2
	add	z15.s, z13.s, z4.s
	add	x3, x3, 144
	add	z0.s, z15.s, z14.s
	sub	z13.s, z13.s, z4.s
	add	x5, x5, 144
	add	z4.s, z0.s, z12.s
	addvl	x7, sp, #4
	str	z0, [x3]
	str	z4, [x5]
	add	x4, x1, x0
	mov	z0.d, z4.d
	ldr	z4, [x18]
	add	x7, x7, 144
	add	z4.s, z0.s, z4.s
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x4, z31.s, sxtw 1]
	add	x6, x0, 2
	add	z4.s, z13.s, z30.s
	sub	z13.s, z13.s, z30.s
	add	z30.s, z4.s, z10.s
	str	z30, [x7]
	addvl	x7, sp, #7
	add	x6, x1, x6
	mov	z0.d, z30.d
	add	x3, x0, 4
	add	x7, x7, 144
	ldr	z30, [x7]
	add	z30.s, z0.s, z30.s
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	st1h	z30.s, p7, [x6, z31.s, sxtw 1]
	add	x3, x1, x3
	sub	z30.s, z1.s, z3.s
	sub	z15.s, z15.s, z14.s
	add	x4, x0, 6
	add	z14.s, z1.s, z3.s
	add	z3.s, z14.s, z9.s
	add	z1.s, z3.s, z29.s
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x3, z31.s, sxtw 1]
	add	x4, x1, x4
	sub	z16.s, z16.s, z2.s
	add	x5, x0, 8
	add	z2.s, z30.s, z8.s
	add	z1.s, z2.s, z28.s
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x4, z31.s, sxtw 1]
	add	x5, x1, x5
	add	z1.s, z13.s, z5.s
	add	x7, x0, 10
	add	z0.s, z1.s, z27.s
	sqrshrnb	z0.h, z0.s, #12
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	st1h	z0.s, p7, [x5, z31.s, sxtw 1]
	add	x7, x1, x7
	sub	z13.s, z13.s, z5.s
	add	x3, x0, 12
	add	z5.s, z15.s, z6.s
	sub	z15.s, z15.s, z6.s
	add	z6.s, z5.s, z26.s
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x7, z31.s, sxtw 1]
	add	x3, x1, x3
	add	z6.s, z16.s, z7.s
	add	x6, x0, 14
	sub	z16.s, z16.s, z7.s
	add	z7.s, z6.s, z25.s
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p7, [x3, z31.s, sxtw 1]
	add	x6, x1, x6
	sub	z30.s, z30.s, z8.s
	add	x4, x0, 16
	add	z8.s, z16.s, z24.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p7, [x6, z31.s, sxtw 1]
	add	x4, x1, x4
	add	z8.s, z15.s, z23.s
	add	x5, x0, 18
	add	x3, x0, 20
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p7, [x4, z31.s, sxtw 1]
	add	x5, x1, x5
	add	x3, x1, x3
	sub	z14.s, z14.s, z9.s
	add	z9.s, z13.s, z22.s
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p7, [x5, z31.s, sxtw 1]
	add	x4, x0, 22
	add	z9.s, z30.s, z21.s
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p7, [x3, z31.s, sxtw 1]
	add	x3, x0, 24
	add	x4, x1, x4
	add	x3, x1, x3
	add	z9.s, z14.s, z20.s
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p7, [x4, z31.s, sxtw 1]
	sub	z4.s, z4.s, z10.s
	add	z10.s, z4.s, z19.s
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	add	x4, x0, 26
	add	x3, x3, 144
	ldr	z10, [x3]
	add	x4, x1, x4
	add	x3, x0, 28
	sub	z12.s, z10.s, z12.s
	add	z10.s, z12.s, z18.s
	add	x3, x1, x3
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x4, z31.s, sxtw 1]
	add	x4, sp, 144
	ldr	z0, [x4]
	add	x4, x0, 30
	sub	z11.s, z0.s, z11.s
	add	z10.s, z11.s, z17.s
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p7, [x3, z31.s, sxtw 1]
	add	x3, x0, 32
	add	x4, x1, x4
	add	x3, x1, x3
	sub	z11.s, z11.s, z17.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p7, [x4, z31.s, sxtw 1]
	sub	z12.s, z12.s, z18.s
	add	x4, x0, 34
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p7, [x3, z31.s, sxtw 1]
	add	x3, x0, 36
	add	x4, x1, x4
	add	x3, x1, x3
	sub	z4.s, z4.s, z19.s
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p7, [x4, z31.s, sxtw 1]
	sub	z14.s, z14.s, z20.s
	add	x4, x0, 38
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p7, [x3, z31.s, sxtw 1]
	add	x3, x0, 40
	add	x4, x1, x4
	sub	z30.s, z30.s, z21.s
	add	x3, x1, x3
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	st1h	z30.s, p7, [x4, z31.s, sxtw 1]
	add	x2, x1, x2, lsl 4
	add	x4, x0, 42
	sub	z13.s, z13.s, z22.s
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p7, [x3, z31.s, sxtw 1]
	add	x3, x0, 44
	add	x4, x1, x4
	sub	z15.s, z15.s, z23.s
	add	x3, x1, x3
	add	x2, x2, 48
	sub	z16.s, z16.s, z24.s
	sqrshrnb	z15.h, z15.s, #12
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z15.h, z15.h, z15.h
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z15.s, z15.h
	sunpklo	z16.s, z16.h
	st1h	z15.s, p7, [x4, z31.s, sxtw 1]
	st1h	z16.s, p7, [x3, z31.s, sxtw 1]
	sub	z6.s, z6.s, z25.s
	add	x3, x0, 48
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p7, [x2, z31.s, sxtw 1]
	add	x2, x0, 50
	add	x3, x1, x3
	add	x2, x1, x2
	sub	z5.s, z5.s, z26.s
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p7, [x3, z31.s, sxtw 1]
	sub	z1.s, z1.s, z27.s
	add	x3, x0, 52
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p7, [x2, z31.s, sxtw 1]
	add	x2, x0, 54
	add	x3, x1, x3
	add	x2, x1, x2
	sub	z2.s, z2.s, z28.s
	sqrshrnb	z2.h, z2.s, #12
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p7, [x3, z31.s, sxtw 1]
	sub	z3.s, z3.s, z29.s
	sqrshrnb	z3.h, z3.s, #12
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	st1h	z3.s, p7, [x2, z31.s, sxtw 1]
	addvl	x2, sp, #4
	add	x2, x2, 144
	ldr	z28, [x2]
	add	x3, x0, 56
	addvl	x2, sp, #7
	add	x3, x1, x3
	add	x2, x2, 144
	ldr	z30, [x2]
	sub	z30.s, z28.s, z30.s
	add	x2, x0, 58
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	add	x2, x1, x2
	sunpklo	z30.s, z30.h
	st1h	z30.s, p7, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #3
	ldr	z4, [x18]
	add	x0, x0, 60
	add	x3, x3, 144
	ldr	z30, [x3]
	sub	z30.s, z30.s, z4.s
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	st1h	z30.s, p7, [x2, z31.s, sxtw 1]
	addvl	x2, sp, #2
	add	x1, x1, x0
	add	x2, x2, 144
	ldr	z0, [x2]
	addvl	x2, sp, #5
	add	x2, x2, 144
	ldr	z15, [x2]
	sub	z30.s, z0.s, z15.s
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	st1h	z30.s, p7, [x1, z31.s, sxtw 1]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	d8, d9, [sp, 80]
	ldp	d10, d11, [sp, 96]
	ldp	d12, d13, [sp, 112]
	ldp	d14, d15, [sp, 128]
	.cfi_restore 25
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
