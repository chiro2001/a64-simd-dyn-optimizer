	.file	"best_sve2.cpp"
	.text
	.globl	dynopt_interp4_16x32_sve2       // -- Begin function dynopt_interp4_16x32_sve2
	.p2align	2
	.type	dynopt_interp4_16x32_sve2,@function
dynopt_interp4_16x32_sve2:              // @dynopt_interp4_16x32_sve2
	.cfi_startproc
// %bb.0:
	and	w8, w4, #0x7
	adrp	x9, _ZL8CHROMA_C
	add	x9, x9, :lo12:_ZL8CHROMA_C
	add	x8, x9, w8, uxtw #2
	movi	v1.2d, #0000000000000000
	ptrue	p0.b, vl16
	mov	w9, #32                         // =0x20
	ldr	h2, [x8]
	ldr	h3, [x8, #2]
	adrp	x8, _ZL4IX_A
	add	x8, x8, :lo12:_ZL4IX_A
	ldr	z0, [x8]
	adrp	x8, _ZL4IX_B
	add	x8, x8, :lo12:_ZL4IX_B
	mov	z2.h, h2
	mov	z3.h, h3
	ldr	z4, [x8]
	sub	x8, x0, #1
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
	ldr	z5, [x8]
	subs	x9, x9, #1
	add	x8, x8, x1
	sub	z5.b, z5.b, #128                // =0x80
	tbl	z6.b, { z5.b }, z0.b
	//APP
	movprfx	z7, z1
	sdot	z7.h, z6.b, z2.b
	//NO_APP
	tbl	z5.b, { z5.b }, z4.b
	//APP
	sdot	z7.h, z5.b, z3.b
	//NO_APP
	add	z7.h, z7.h, #8192               // =0x2000
	sqrshrunb	z5.b, z7.h, #6
	uzp1	z5.b, z5.b, z5.b
	st1b	{ z5.b }, p0, [x2]
	add	x2, x2, x3
	b.ne	.LBB0_1
// %bb.2:
	ret
.Lfunc_end0:
	.size	dynopt_interp4_16x32_sve2, .Lfunc_end0-dynopt_interp4_16x32_sve2
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
