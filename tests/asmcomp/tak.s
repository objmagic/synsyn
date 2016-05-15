	.file ""
	.data
	.globl	_camltest__data_begin
_camltest__data_begin:
	.text
	.globl	_camltest__code_begin
_camltest__code_begin:
	nop
	.text
	.align	4
	.globl	_tak
_tak:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_adjust_cfa_offset 40
L101:
	movq	%rax, %rsi
	movq	%rbx, %rdx
	movq	%rdi, %rax
	cmpq	%rdx, %rsi
	jle	L100
	movq	%rax, 16(%rsp)
	movq	%rdx, 8(%rsp)
	movq	%rsi, (%rsp)
	decq	%rax
	movq	%rsi, %rbx
	movq	%rdx, %rdi
	call	_tak
L102:
	movq	%rax, 32(%rsp)
	movq	8(%rsp), %rax
	decq	%rax
	movq	16(%rsp), %rbx
	movq	(%rsp), %rdi
	call	_tak
L103:
	movq	%rax, 24(%rsp)
	movq	(%rsp), %rax
	decq	%rax
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rdi
	call	_tak
L104:
	movq	24(%rsp), %rbx
	movq	32(%rsp), %rdi
	jmp	L101
	.align	2
L100:
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.text
	.align	4
	.globl	_takmain
_takmain:
	.cfi_startproc
L105:
	movq	$6, %rdi
	movq	$12, %rbx
	movq	$18, %rax
	jmp	_tak
	.cfi_endproc
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
	.quad	3
	.quad	L104
	.word	48
	.word	0
	.align	3
	.quad	L103
	.word	48
	.word	0
	.align	3
	.quad	L102
	.word	48
	.word	0
	.align	3
