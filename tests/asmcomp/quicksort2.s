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
	.globl	_cmp
_cmp:
	.cfi_startproc
L100:
	subq	%rbx, %rax
	ret
	.cfi_endproc
	.text
	.align	4
	.globl	_quick
_quick:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_adjust_cfa_offset 56
L107:
	cmpq	%rbx, %rax
	jge	L101
	movq	%rsi, 40(%rsp)
	movq	%rdi, 24(%rsp)
	movq	%rbx, 16(%rsp)
	movq	%rax, (%rsp)
	movq	%rax, 48(%rsp)
	movq	%rbx, 8(%rsp)
	movq	(%rdi,%rbx,8), %rdi
	movq	%rdi, 32(%rsp)
L103:
	cmpq	%rbx, %rax
	jge	L102
L106:
	movq	16(%rsp), %rbx
	cmpq	%rbx, %rax
	jge	L105
	movq	24(%rsp), %rbx
	movq	(%rbx,%rax,8), %rax
	movq	32(%rsp), %rbx
	movq	40(%rsp), %rdi
	call	*%rdi
L108:
	cmpq	$0, %rax
	jg	L105
	movq	48(%rsp), %rax
	incq	%rax
	movq	%rax, 48(%rsp)
	jmp	L106
	.align	2
L105:
	movq	8(%rsp), %rax
	movq	(%rsp), %rbx
	cmpq	%rbx, %rax
	jle	L104
	movq	24(%rsp), %rbx
	movq	(%rbx,%rax,8), %rax
	movq	32(%rsp), %rbx
	movq	40(%rsp), %rdi
	call	*%rdi
L109:
	cmpq	$0, %rax
	jl	L104
	movq	8(%rsp), %rax
	decq	%rax
	movq	%rax, 8(%rsp)
	jmp	L105
	.align	2
L104:
	movq	8(%rsp), %rbx
	movq	48(%rsp), %rax
	cmpq	%rbx, %rax
	jge	L103
	movq	24(%rsp), %rdx
	movq	(%rdx,%rax,8), %rdi
	movq	(%rdx,%rbx,8), %rsi
	movq	%rsi, (%rdx,%rax,8)
	movq	%rdi, (%rdx,%rbx,8)
	jmp	L103
	.align	2
L102:
	movq	24(%rsp), %rdi
	movq	(%rdi,%rax,8), %rbx
	movq	16(%rsp), %rdx
	movq	(%rdi,%rdx,8), %rsi
	movq	%rsi, (%rdi,%rax,8)
	movq	%rbx, (%rdi,%rdx,8)
	movq	%rax, %rbx
	decq	%rbx
	movq	(%rsp), %rax
	movq	40(%rsp), %rsi
	call	_quick
L110:
	movq	48(%rsp), %rax
	incq	%rax
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rdi
	movq	40(%rsp), %rsi
	jmp	L107
	.align	2
L101:
	addq	$56, %rsp
	.cfi_adjust_cfa_offset -56
	ret
	.cfi_adjust_cfa_offset 56
	.cfi_adjust_cfa_offset -56
	.cfi_endproc
	.text
	.align	4
	.globl	_quicksort
_quicksort:
	.cfi_startproc
L111:
	leaq	_cmp(%rip), %rsi
	jmp	_quick
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
	.quad	L110
	.word	64
	.word	2
	.word	24
	.word	40
	.align	3
	.quad	L109
	.word	64
	.word	2
	.word	24
	.word	40
	.align	3
	.quad	L108
	.word	64
	.word	2
	.word	24
	.word	40
	.align	3
