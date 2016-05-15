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
	.globl	_fib
_fib:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
L101:
	cmpq	$5, %rax
	jge	L100
	movq	$3, %rax
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
	.align	2
L100:
	movq	%rax, (%rsp)
	subq	$4, %rax
	call	_fib
L102:
	movq	%rax, 8(%rsp)
	movq	(%rsp), %rax
	subq	$2, %rax
	call	_fib
L103:
	movq	8(%rsp), %rbx
	addq	%rbx, %rax
	decq	%rax
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
	.cfi_adjust_cfa_offset -24
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
	.quad	2
	.quad	L103
	.word	32
	.word	0
	.align	3
	.quad	L102
	.word	32
	.word	0
	.align	3
