	.file ""
	.data
	.globl	_camltest__data_begin
_camltest__data_begin:
	.text
	.globl	_camltest__code_begin
_camltest__code_begin:
	nop
	.data
_res_square:
	.space	8
	.data
_h:
	.space	8
	.data
_x:
	.space	8
	.data
_s:
	.space	8
	.data
_res_integr:
	.space	8
	.text
	.align	4
	.globl	_square
_square:
	.cfi_startproc
L100:
	leaq	_res_square(%rip), %rbx
	movsd	(%rax), %xmm0
	mulsd	(%rax), %xmm0
	movsd	%xmm0, (%rbx)
	movq	%rbx, %rax
	ret
	.cfi_endproc
	.text
	.align	4
	.globl	_integr
_integr:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_adjust_cfa_offset 40
L103:
	movq	%rax, (%rsp)
	leaq	_h(%rip), %rdx
	movq	%rdx, 24(%rsp)
	leaq	_x(%rip), %rax
	movq	%rax, 16(%rsp)
	leaq	_s(%rip), %rcx
	movq	%rcx, 8(%rsp)
	movq	%rsi, 32(%rsp)
	cvtsi2sdq	%rsi, %xmm0
	movsd	(%rdi), %xmm1
	subsd	(%rbx), %xmm1
	divsd	%xmm0, %xmm1
	movsd	%xmm1, (%rdx)
	movsd	(%rbx), %xmm0
	movsd	%xmm0, (%rax)
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, (%rcx)
L102:
	cmpq	$0, %rsi
	jle	L101
	movq	(%rsp), %rbx
	call	*%rbx
L104:
	movsd	(%rax), %xmm0
	movq	8(%rsp), %rcx
	addsd	(%rcx), %xmm0
	movsd	%xmm0, (%rcx)
	movq	16(%rsp), %rax
	movsd	(%rax), %xmm0
	movq	24(%rsp), %rdx
	addsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	movq	32(%rsp), %rsi
	decq	%rsi
	movq	%rsi, 32(%rsp)
	jmp	L102
	.align	2
L101:
	movsd	(%rcx), %xmm0
	mulsd	(%rdx), %xmm0
	movsd	%xmm0, _res_integr(%rip)
	leaq	_res_integr(%rip), %rax
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.data
_low:
	.space	8
	.data
_hi:
	.space	8
	.text
	.align	4
	.globl	_test
_test:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
L105:
	movq	%rax, %rsi
	xorpd	%xmm0, %xmm0
	movsd	%xmm0, _low(%rip)
	movsd	L106(%rip), %xmm0
	movsd	%xmm0, _hi(%rip)
	leaq	_hi(%rip), %rdi
	leaq	_low(%rip), %rbx
	leaq	_square(%rip), %rax
	call	_integr
L107:
	movsd	(%rax), %xmm0
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.section __TEXT,__literal8,8byte_literals
L106:
	.quad	0x3ff0000000000000
	.text
	nop
	.globl	_camltest__code_end
_camltest__code_end:
	.data
				/* relocation table start */
	.align	3
				/* relocation table end */
	.data
	.globl	_camltest__data_end
_camltest__data_end:
	.long	0
	.globl	_camltest__frametable
_camltest__frametable:
	.quad	2
	.quad	L107
	.word	16
	.word	0
	.align	3
	.quad	L104
	.word	48
	.word	4
	.word	0
	.word	8
	.word	16
	.word	24
	.align	3
