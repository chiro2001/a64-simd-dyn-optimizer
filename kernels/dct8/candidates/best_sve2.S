	.file	"best_sve2.cpp"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function dynopt_dct8_sve2_shared
.LCPI0_0:
	.hword	89                              // 0x59
	.hword	75                              // 0x4b
	.hword	50                              // 0x32
	.hword	18                              // 0x12
	.hword	89                              // 0x59
	.hword	75                              // 0x4b
	.hword	50                              // 0x32
	.hword	18                              // 0x12
.LCPI0_1:
	.hword	75                              // 0x4b
	.hword	65518                           // 0xffee
	.hword	65447                           // 0xffa7
	.hword	65486                           // 0xffce
	.hword	75                              // 0x4b
	.hword	65518                           // 0xffee
	.hword	65447                           // 0xffa7
	.hword	65486                           // 0xffce
.LCPI0_2:
	.hword	50                              // 0x32
	.hword	65447                           // 0xffa7
	.hword	18                              // 0x12
	.hword	75                              // 0x4b
	.hword	50                              // 0x32
	.hword	65447                           // 0xffa7
	.hword	18                              // 0x12
	.hword	75                              // 0x4b
.LCPI0_3:
	.hword	18                              // 0x12
	.hword	65486                           // 0xffce
	.hword	75                              // 0x4b
	.hword	65447                           // 0xffa7
	.hword	18                              // 0x12
	.hword	65486                           // 0xffce
	.hword	75                              // 0x4b
	.hword	65447                           // 0xffa7
.LCPI0_4:
	.word	83                              // 0x53
	.word	36                              // 0x24
	.word	83                              // 0x53
	.word	36                              // 0x24
.LCPI0_5:
	.word	64                              // 0x40
	.word	4294967232                      // 0xffffffc0
	.word	64                              // 0x40
	.word	4294967232                      // 0xffffffc0
.LCPI0_6:
	.word	36                              // 0x24
	.word	4294967213                      // 0xffffffad
	.word	36                              // 0x24
	.word	4294967213                      // 0xffffffad
	.text
	.globl	dynopt_dct8_sve2_shared
	.p2align	2
	.type	dynopt_dct8_sve2_shared,@function
dynopt_dct8_sve2_shared:                // @dynopt_dct8_sve2_shared
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	d15, d14, [sp, #16]             // 16-byte Folded Spill
	stp	d13, d12, [sp, #32]             // 16-byte Folded Spill
	stp	d11, d10, [sp, #48]             // 16-byte Folded Spill
	stp	d9, d8, [sp, #64]               // 16-byte Folded Spill
	.cfi_offset b8, -8
	.cfi_offset b9, -16
	.cfi_offset b10, -24
	.cfi_offset b11, -32
	.cfi_offset b12, -40
	.cfi_offset b13, -48
	.cfi_offset b14, -56
	.cfi_offset b15, -64
	mov	w8, #6                          // =0x6
	add	x9, x0, x2, lsl #1
	add	x11, x0, x2, lsl #2
	madd	x8, x2, x8, x0
	mov	w10, #10                        // =0xa
	mov	w12, #12                        // =0xc
	ldp	d16, d1, [x9]
	movi	v10.2d, #0000000000000000
	madd	x9, x2, x10, x0
	ldp	d0, d3, [x0]
	ldp	d2, d4, [x11]
	add	x10, x0, x2, lsl #3
	madd	x11, x2, x12, x0
	rev64	v18.4h, v1.4h
	movi	v11.2d, #0000000000000000
	ldp	d6, d5, [x8]
	mov	w8, #14                         // =0xe
	ldp	d1, d17, [x10]
	rev64	v3.4h, v3.4h
	madd	x8, x2, x8, x0
	rev64	v7.4h, v4.4h
	movi	v8.2d, #0000000000000000
	rev64	v19.4h, v5.4h
	movi	v13.2d, #0000000000000000
	rev64	v5.4h, v17.4h
	ldp	d20, d17, [x9]
	ldp	d4, d22, [x11]
	saddl	v29.4s, v3.4h, v0.4h
	mov	v0.d[1], v16.d[0]
	saddl	v16.4s, v18.4h, v16.4h
	mov	v3.d[1], v18.d[0]
	rev64	v23.4h, v17.4h
	saddl	v24.4s, v7.4h, v2.4h
	saddl	v25.4s, v19.4h, v6.4h
	rev64	v17.4h, v22.4h
	ldp	d18, d22, [x8]
	mov	v2.d[1], v6.d[0]
	zip2	v6.2d, v29.2d, v16.2d
	saddl	v26.4s, v5.4h, v1.4h
	mov	v7.d[1], v19.d[0]
	mov	v19.16b, v24.16b
	zip2	v28.2d, v24.2d, v25.2d
	rev64	v22.4h, v22.4h
	saddl	v27.4s, v23.4h, v20.4h
	mov	v29.d[1], v16.d[0]
	saddl	v30.4s, v17.4h, v4.4h
	adrp	x8, .LCPI0_0
	mov	v1.d[1], v20.d[0]
	rev64	v31.4s, v6.4s
	mov	v19.d[1], v25.d[0]
	sub	v6.8h, v0.8h, v3.8h
	zip2	v16.2d, v26.2d, v27.2d
	sub	v7.8h, v2.8h, v7.8h
	ldr	q2, [x8, :lo12:.LCPI0_0]
	saddl	v25.4s, v22.4h, v18.4h
	adrp	x8, .LCPI0_1
	rev64	v20.4s, v28.4s
	movi	v28.2d, #0000000000000000
	ldr	q3, [x8, :lo12:.LCPI0_1]
	adrp	x8, .LCPI0_2
	add	v21.4s, v31.4s, v29.4s
	sub	v12.4s, v29.4s, v31.4s
	movi	v29.2d, #0000000000000000
	zip2	v0.2d, v30.2d, v25.2d
	movi	v31.2d, #0000000000000000
	mov	v5.d[1], v23.d[0]
	mov	v23.16b, v26.16b
	rev64	v24.4s, v16.4s
	ldr	q16, [x8, :lo12:.LCPI0_2]
	mov	v4.d[1], v18.d[0]
	mov	v17.d[1], v22.d[0]
	mov	v30.d[1], v25.d[0]
	sdot	z10.d, z6.h, z16.h
	sdot	z11.d, z7.h, z16.h
	adrp	x8, .LCPI0_4
	mov	v23.d[1], v27.d[0]
	rev64	v9.4s, v0.4s
	sdot	z28.d, z6.h, z2.h
	sdot	z29.d, z7.h, z2.h
	sdot	z31.d, z6.h, z3.h
	sub	v22.4s, v19.4s, v20.4s
	sdot	z8.d, z7.h, z3.h
	sub	v27.8h, v1.8h, v5.8h
	ldr	q1, [x8, :lo12:.LCPI0_4]
	uzp1	v5.4s, v10.4s, v11.4s
	add	v18.4s, v20.4s, v19.4s
	sub	v4.8h, v4.8h, v17.8h
	add	v25.4s, v24.4s, v23.4s
	sub	v23.4s, v23.4s, v24.4s
	add	v26.4s, v9.4s, v30.4s
	sub	v24.4s, v30.4s, v9.4s
	uzp1	v20.4s, v28.4s, v29.4s
	movi	v28.2d, #0000000000000000
	uzp1	v17.4s, v31.4s, v8.4s
	movi	v29.2d, #0000000000000000
	movi	v30.2d, #0000000000000000
	movi	v31.2d, #0000000000000000
	mul	v8.4s, v12.4s, v1.4s
	mov	v19.16b, v12.16b
	movi	v9.2d, #0000000000000000
	movi	v10.2d, #0000000000000000
	movi	v12.2d, #0000000000000000
	mul	v11.4s, v22.4s, v1.4s
	adrp	x8, .LCPI0_3
	str	q5, [sp]                        // 16-byte Spill
	ldr	q5, [x8, :lo12:.LCPI0_3]
	sdot	z28.d, z27.h, z2.h
	sdot	z29.d, z4.h, z2.h
	sdot	z30.d, z27.h, z3.h
	sdot	z31.d, z4.h, z3.h
	addp	v14.4s, v21.4s, v18.4s
	sdot	z9.d, z27.h, z16.h
	sdot	z10.d, z4.h, z16.h
	adrp	x8, .LCPI0_5
	sdot	z12.d, z27.h, z5.h
	mul	v27.4s, v23.4s, v1.4s
	sdot	z13.d, z4.h, z5.h
	mul	v4.4s, v24.4s, v1.4s
	addp	v11.4s, v8.4s, v11.4s
	addp	v8.4s, v25.4s, v26.4s
	uzp1	v28.4s, v28.4s, v29.4s
	uzp1	v15.4s, v30.4s, v31.4s
	shl	v14.4s, v14.4s, #6
	uzp1	v31.4s, v9.4s, v10.4s
	movi	v10.2d, #0000000000000000
	rshrn	v29.4h, v20.4s, #2
	shl	v9.4s, v8.4s, #6
	uzp1	v8.4s, v12.4s, v13.4s
	movi	v13.2d, #0000000000000000
	addp	v12.4s, v27.4s, v4.4s
	ldr	q4, [x8, :lo12:.LCPI0_5]
	adrp	x8, .LCPI0_6
	rshrn	v0.4h, v28.4s, #2
	rshrn	v28.4h, v14.4s, #2
	rshrn	v14.4h, v15.4s, #2
	rshrn	v9.4h, v9.4s, #2
	mul	v25.4s, v25.4s, v4.4s
	mul	v26.4s, v26.4s, v4.4s
	rshrn	v12.4h, v12.4s, #2
	sdot	z10.d, z6.h, z5.h
	ldr	q6, [x8, :lo12:.LCPI0_6]
	rshrn	v30.4h, v17.4s, #2
	rshrn	v27.4h, v11.4s, #2
	mul	v11.4s, v21.4s, v4.4s
	rev64	v0.4h, v0.4h
	mul	v23.4s, v23.4s, v6.4s
	mul	v24.4s, v24.4s, v6.4s
	rev64	v21.4h, v9.4h
	mul	v9.4s, v18.4s, v4.4s
	sdot	z13.d, z7.h, z5.h
	rev64	v18.4h, v12.4h
	rev64	v12.4h, v14.4h
	addp	v25.4s, v25.4s, v26.4s
	mul	v14.4s, v19.4s, v6.4s
	mul	v22.4s, v22.4s, v6.4s
	ldr	q19, [sp]                       // 16-byte Reload
	saddl	v15.4s, v0.4h, v29.4h
	addp	v23.4s, v23.4s, v24.4s
	rshrn	v8.4h, v8.4s, #2
	saddl	v26.4s, v21.4h, v28.4h
	uzp1	v29.4s, v10.4s, v13.4s
	addp	v9.4s, v11.4s, v9.4s
	saddl	v24.4s, v12.4h, v30.4h
	rshrn	v30.4h, v31.4s, #2
	rshrn	v31.4h, v25.4s, #2
	saddl	v10.4s, v18.4h, v27.4h
	rshrn	v13.4h, v19.4s, #2
	addp	v14.4s, v14.4s, v22.4s
	zip2	v11.2d, v26.2d, v15.2d
	rshrn	v25.4h, v9.4s, #2
	rshrn	v23.4h, v23.4s, #2
	rshrn2	v28.8h, v20.4s, #2
	mov	v21.d[1], v0.d[0]
	mov	v26.d[1], v15.d[0]
	zip2	v22.2d, v10.2d, v24.2d
	rev64	v9.4h, v31.4h
	rev64	v30.4h, v30.4h
	mov	v10.d[1], v24.d[0]
	rshrn	v24.4h, v14.4s, #2
	rshrn2	v27.8h, v17.4s, #2
	rev64	v0.4s, v11.4s
	mov	v18.d[1], v12.d[0]
	rshrn	v12.4h, v29.4s, #2
	sub	v20.8h, v28.8h, v21.8h
	rev64	v28.4h, v23.4h
	movi	v14.2d, #0000000000000000
	rev64	v11.4s, v22.4s
	saddl	v31.4s, v9.4h, v25.4h
	saddl	v13.4s, v30.4h, v13.4h
	rev64	v22.4h, v8.4h
	rshrn2	v25.8h, v19.4s, #2
	mov	v9.d[1], v30.d[0]
	add	v17.4s, v0.4s, v26.4s
	sub	v0.4s, v26.4s, v0.4s
	sub	v21.8h, v27.8h, v18.8h
	zip2	v26.2d, v31.2d, v13.2d
	saddl	v23.4s, v28.4h, v24.4h
	rshrn2	v24.8h, v29.4s, #2
	movi	v27.2d, #0000000000000000
	movi	v30.2d, #0000000000000000
	add	v18.4s, v11.4s, v10.4s
	sdot	z14.d, z21.h, z16.h
	mov	v28.d[1], v22.d[0]
	sub	v19.4s, v10.4s, v11.4s
	sub	v25.8h, v25.8h, v9.8h
	movi	v10.2d, #0000000000000000
	mov	v29.16b, v31.16b
	rev64	v9.4s, v26.4s
	movi	v26.2d, #0000000000000000
	movi	v31.2d, #0000000000000000
	sdot	z27.d, z20.h, z2.h
	sdot	z30.d, z21.h, z2.h
	movi	v8.2d, #0000000000000000
	sub	v24.8h, v24.8h, v28.8h
	mov	v29.d[1], v13.d[0]
	saddl	v28.4s, v22.4h, v12.4h
	movi	v12.2d, #0000000000000000
	movi	v13.2d, #0000000000000000
	movi	v11.2d, #0000000000000000
	sdot	z26.d, z25.h, z2.h
	sdot	z31.d, z20.h, z3.h
	movi	v15.2d, #0000000000000000
	sdot	z10.d, z24.h, z2.h
	sdot	z8.d, z21.h, z3.h
	uzp1	v27.4s, v27.4s, v30.4s
	movi	v30.2d, #0000000000000000
	add	v22.4s, v9.4s, v29.4s
	sub	v2.4s, v29.4s, v9.4s
	sdot	z12.d, z25.h, z3.h
	sdot	z13.d, z24.h, z3.h
	zip2	v29.2d, v23.2d, v28.2d
	sdot	z11.d, z20.h, z16.h
	sdot	z15.d, z21.h, z5.h
	movi	v21.2d, #0000000000000000
	uzp1	v3.4s, v26.4s, v10.4s
	rshrn	v26.4h, v27.4s, #9
	movi	v7.2d, #0000000000000000
	sdot	z30.d, z20.h, z5.h
	movi	v20.2d, #0000000000000000
	mov	v23.d[1], v28.d[0]
	movi	v28.2d, #0000000000000000
	rev64	v29.4s, v29.4s
	uzp1	v31.4s, v31.4s, v8.4s
	sdot	z21.d, z24.h, z16.h
	uzp1	v27.4s, v12.4s, v13.4s
	addp	v8.4s, v17.4s, v18.4s
	sdot	z7.d, z24.h, z5.h
	ldp	d13, d12, [sp, #32]             // 16-byte Folded Reload
	sdot	z20.d, z25.h, z16.h
	rshrn	v3.4h, v3.4s, #9
	mul	v17.4s, v17.4s, v4.4s
	sdot	z28.d, z25.h, z5.h
	add	v5.4s, v29.4s, v23.4s
	sub	v23.4s, v23.4s, v29.4s
	rshrn	v31.4h, v31.4s, #9
	rshrn	v16.4h, v27.4s, #9
	mul	v25.4s, v0.4s, v1.4s
	mul	v18.4s, v18.4s, v4.4s
	mul	v0.4s, v0.4s, v6.4s
	uzp1	v30.4s, v30.4s, v15.4s
	stp	d26, d3, [x1, #16]
	uzp1	v26.4s, v11.4s, v14.4s
	uzp1	v3.4s, v20.4s, v21.4s
	ldp	d11, d10, [sp, #48]             // 16-byte Folded Reload
	mul	v21.4s, v2.4s, v1.4s
	stp	d31, d16, [x1, #48]
	ldp	d15, d14, [sp, #16]             // 16-byte Folded Reload
	addp	v16.4s, v22.4s, v5.4s
	mul	v22.4s, v22.4s, v4.4s
	mul	v4.4s, v5.4s, v4.4s
	rshrn	v24.4h, v26.4s, #9
	mul	v26.4s, v19.4s, v1.4s
	mul	v1.4s, v23.4s, v1.4s
	rshrn	v3.4h, v3.4s, #9
	mul	v5.4s, v19.4s, v6.4s
	mul	v2.4s, v2.4s, v6.4s
	mul	v6.4s, v23.4s, v6.4s
	uzp1	v7.4s, v28.4s, v7.4s
	shl	v27.4s, v8.4s, #6
	ldp	d9, d8, [sp, #64]               // 16-byte Folded Reload
	shl	v16.4s, v16.4s, #6
	addp	v25.4s, v25.4s, v26.4s
	addp	v1.4s, v21.4s, v1.4s
	addp	v4.4s, v22.4s, v4.4s
	stp	d24, d3, [x1, #80]
	addp	v3.4s, v17.4s, v18.4s
	addp	v0.4s, v0.4s, v5.4s
	addp	v2.4s, v2.4s, v6.4s
	rshrn	v20.4h, v30.4s, #9
	rshrn	v27.4h, v27.4s, #9
	rshrn	v17.4h, v25.4s, #9
	rshrn	v1.4h, v1.4s, #9
	rshrn	v7.4h, v7.4s, #9
	rshrn	v16.4h, v16.4s, #9
	rshrn	v3.4h, v3.4s, #9
	rshrn	v4.4h, v4.4s, #9
	rshrn	v0.4h, v0.4s, #9
	stp	d17, d1, [x1, #32]
	rshrn	v1.4h, v2.4s, #9
	stp	d20, d7, [x1, #112]
	stp	d27, d16, [x1]
	stp	d3, d4, [x1, #64]
	stp	d0, d1, [x1, #96]
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	ret
.Lfunc_end0:
	.size	dynopt_dct8_sve2_shared, .Lfunc_end0-dynopt_dct8_sve2_shared
	.cfi_endproc
                                        // -- End function
	.ident	"clang version 22.1.8"
	.section	".note.GNU-stack","",@progbits
	.addrsig
