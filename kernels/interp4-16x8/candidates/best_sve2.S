	.file	"best_sve2.cpp"
	.text
	.globl	dynopt_interp4_16x8_sve2        // -- Begin function dynopt_interp4_16x8_sve2
	.p2align	2
	.type	dynopt_interp4_16x8_sve2,@function
dynopt_interp4_16x8_sve2:               // @dynopt_interp4_16x8_sve2
	.cfi_startproc
// %bb.0:
	ptrue	p0.b
	mov	x8, #-1                         // =0xffffffffffffffff
	and	w9, w4, #0x7
	adrp	x10, _ZL4IX_A
	add	x10, x10, :lo12:_ZL4IX_A
	movi	v2.2d, #0000000000000000
	ld1b	{ z3.b }, p0/z, [x0, x8]
	adrp	x8, _ZL8CHROMA_C
	add	x8, x8, :lo12:_ZL8CHROMA_C
	add	x8, x8, w9, uxtw #2
	adrp	x9, _ZL4IX_B
	add	x9, x9, :lo12:_ZL4IX_B
	ldr	z0, [x10]
	ldr	z1, [x9]
	ptrue	p1.b, vl16
	sub	z3.b, z3.b, #128                // =0x80
	ldr	h4, [x8]
	ldr	h5, [x8, #2]
	sub	x8, x0, #1
	lsl	x9, x1, #1
	lsl	x10, x3, #1
	mov	z4.h, h4
	tbl	z6.b, { z3.b }, z0.b
	tbl	z7.b, { z3.b }, z1.b
	mov	z3.h, h5
	//APP
	movprfx	z5, z2
	sdot	z5.h, z6.b, z4.b
	//NO_APP
	//APP
	sdot	z5.h, z7.b, z3.b
	//NO_APP
	add	z5.h, z5.h, #8192               // =0x2000
	sqrshrunb	z5.b, z5.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p1, [x2]
	ld1b	{ z5.b }, p0/z, [x8, x1]
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z2
	sdot	z7.h, z6.b, z4.b
	//NO_APP
	tbl	z5.b, { z5.b }, z1.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	add	z7.h, z7.h, #8192               // =0x2000
	sqrshrunb	z5.b, z7.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p1, [x2, x3]
	ld1b	{ z5.b }, p0/z, [x8, x9]
	add	x9, x9, x1
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z2
	sdot	z7.h, z6.b, z4.b
	//NO_APP
	tbl	z5.b, { z5.b }, z1.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	add	z7.h, z7.h, #8192               // =0x2000
	sqrshrunb	z5.b, z7.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p1, [x2, x10]
	ld1b	{ z5.b }, p0/z, [x8, x9]
	add	x9, x10, x3
	lsl	x10, x1, #2
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z2
	sdot	z7.h, z6.b, z4.b
	//NO_APP
	tbl	z5.b, { z5.b }, z1.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	add	z7.h, z7.h, #8192               // =0x2000
	sqrshrunb	z5.b, z7.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p1, [x2, x9]
	lsl	x9, x3, #2
	ld1b	{ z5.b }, p0/z, [x8, x10]
	add	x10, x10, x1
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z2
	sdot	z7.h, z6.b, z4.b
	//NO_APP
	tbl	z5.b, { z5.b }, z1.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	add	z7.h, z7.h, #8192               // =0x2000
	sqrshrunb	z5.b, z7.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p1, [x2, x9]
	add	x9, x9, x3
	ld1b	{ z5.b }, p0/z, [x8, x10]
	mov	w10, #6                         // =0x6
	mul	x11, x1, x10
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z2
	sdot	z7.h, z6.b, z4.b
	//NO_APP
	tbl	z5.b, { z5.b }, z1.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	add	z7.h, z7.h, #8192               // =0x2000
	sqrshrunb	z5.b, z7.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p1, [x2, x9]
	mul	x9, x3, x10
	lsl	x10, x1, #3
	ld1b	{ z5.b }, p0/z, [x8, x11]
	sub	x8, x8, x1
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z2
	sdot	z7.h, z6.b, z4.b
	//NO_APP
	tbl	z5.b, { z5.b }, z1.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	add	z7.h, z7.h, #8192               // =0x2000
	sqrshrunb	z5.b, z7.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p1, [x2, x9]
	sub	x9, x2, x3
	ld1b	{ z5.b }, p0/z, [x8, x10]
	lsl	x8, x3, #3
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z0.b, { z5.b }, z0.b
	tbl	z1.b, { z5.b }, z1.b
	//APP
	movprfx	z5, z2
	sdot	z5.h, z0.b, z4.b
	//NO_APP
	//APP
	sdot	z5.h, z1.b, z3.b
	//NO_APP
	add	z5.h, z5.h, #8192               // =0x2000
	sqrshrunb	z0.b, z5.h, #6
	uzp1	z0.b, z0.b, z0.b
	st1b	{ z0.b }, p1, [x9, x8]
	ret
.Lfunc_end0:
	.size	dynopt_interp4_16x8_sve2, .Lfunc_end0-dynopt_interp4_16x8_sve2
	.cfi_endproc
                                        // -- End function
	.type	_ZL8CHROMA_C,@object            // @_ZL8CHROMA_C
	.section	.rodata.cst32,"aM",@progbits,32
_ZL8CHROMA_C:
	.asciz	"\000@\000"
	.ascii	"\376:\n\376"
	.ascii	"\3746\020\376"
	.ascii	"\372.\034\374"
	.ascii	"\374$$\374"
	.ascii	"\374\034.\372"
	.ascii	"\376\0206\374"
	.ascii	"\376\n:\376"
	.size	_ZL8CHROMA_C, 32

	.type	_ZL4IX_A,@object                // @_ZL4IX_A
_ZL4IX_A:
	.ascii	"\000\001\001\002\002\003\003\004\004\005\005\006\006\007\007\b\b\t\t\n\n\013\013\f\f\r\r\016\016\017\017\020"
	.size	_ZL4IX_A, 32

	.type	_ZL4IX_B,@object                // @_ZL4IX_B
_ZL4IX_B:
	.ascii	"\002\003\003\004\004\005\005\006\006\007\007\b\b\t\t\n\n\013\013\f\f\r\r\016\016\017\017\020\020\021\021\022"
	.size	_ZL4IX_B, 32

	.ident	"clang version 22.1.8"
	.section	".note.GNU-stack","",@progbits
	.addrsig
