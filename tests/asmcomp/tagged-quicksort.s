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
	.globl	_quick
_quick:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
L106:
	cmpq	%rbx, %rax
	jge	L100
	movq	%rdi, 16(%rsp)
	movq	%rbx, 8(%rsp)
	movq	%rax, %rdx
	movq	%rdx, (%rsp)
	movq	%rbx, %rsi
	movq	%rbx, %rcx
	sarq	$1, %rcx
	movq	(%rdi,%rcx,8), %rcx
L102:
	cmpq	%rsi, %rdx
	jge	L101
L105:
	cmpq	%rbx, %rdx
	jge	L104
	movq	%rdx, %r8
	sarq	$1, %r8
	movq	(%rdi,%r8,8), %r8
	cmpq	%rcx, %r8
	jg	L104
	addq	$2, %rdx
	movq	%rdx, (%rsp)
	jmp	L105
	.align	2
L104:
	cmpq	%rax, %rsi
	jle	L103
	movq	%rsi, %r8
	sarq	$1, %r8
	movq	(%rdi,%r8,8), %r8
	cmpq	%rcx, %r8
	jl	L103
	subq	$2, %rsi
	jmp	L104
	.align	2
L103:
	cmpq	%rsi, %rdx
	jge	L102
	movq	%rdx, %r8
	sarq	$1, %r8
	movq	(%rdi,%r8,8), %r9
	movq	%rsi, %r12
	sarq	$1, %r12
	movq	(%rdi,%r12,8), %r13
	movq	%r13, (%rdi,%r8,8)
	movq	%r9, (%rdi,%r12,8)
	jmp	L102
	.align	2
L101:
	movq	%rdx, %rsi
	sarq	$1, %rsi
	movq	(%rdi,%rsi,8), %rcx
	sarq	$1, %rbx
	movq	(%rdi,%rbx,8), %r8
	movq	%r8, (%rdi,%rsi,8)
	movq	%rcx, (%rdi,%rbx,8)
	movq	%rdx, %rbx
	subq	$2, %rbx
	call	_quick
L107:
	movq	(%rsp), %rax
	addq	$2, %rax
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rdi
	jmp	L106
	.align	2
L100:
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.text
	.align	4
	.globl	_quicksort
_quicksort:
	.cfi_startproc
L108:
	leaq	1(%rbx,%rbx), %rbx
	leaq	1(%rax,%rax), %rax
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
	.quad	1
	.quad	L107
	.word	32
	.word	1
	.word	16
	.align	3
