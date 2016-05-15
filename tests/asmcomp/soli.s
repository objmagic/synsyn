	.file ""
	.data
	.globl	_camltest__data_begin
_camltest__data_begin:
	.text
	.globl	_camltest__code_begin
_camltest__code_begin:
	nop
	.data
_d1:
	.quad	0
	.quad	1
_d2:
	.quad	1
	.quad	0
_d3:
	.quad	0
	.quad	-1
_d4:
	.quad	-1
	.quad	0
_dir:
	.quad	_d1
	.quad	_d2
	.quad	_d3
	.quad	_d4
	.data
_counter:
	.quad	0
	.data
_line0:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
_line1:
	.quad	0
	.quad	0
	.quad	0
	.quad	2
	.quad	2
	.quad	2
	.quad	0
	.quad	0
	.quad	0
_line2:
	.quad	0
	.quad	0
	.quad	0
	.quad	2
	.quad	2
	.quad	2
	.quad	0
	.quad	0
	.quad	0
_line3:
	.quad	0
	.quad	2
	.quad	2
	.quad	2
	.quad	2
	.quad	2
	.quad	2
	.quad	2
	.quad	0
_line4:
	.quad	0
	.quad	2
	.quad	2
	.quad	2
	.quad	1
	.quad	2
	.quad	2
	.quad	2
	.quad	0
_line5:
	.quad	0
	.quad	2
	.quad	2
	.quad	2
	.quad	2
	.quad	2
	.quad	2
	.quad	2
	.quad	0
_line6:
	.quad	0
	.quad	0
	.quad	0
	.quad	2
	.quad	2
	.quad	2
	.quad	0
	.quad	0
	.quad	0
_line7:
	.quad	0
	.quad	0
	.quad	0
	.quad	2
	.quad	2
	.quad	2
	.quad	0
	.quad	0
	.quad	0
_line8:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
_board:
	.quad	_line0
	.quad	_line1
	.quad	_line2
	.quad	_line3
	.quad	_line4
	.quad	_line5
	.quad	_line6
	.quad	_line7
	.quad	_line8
	.data
_format:
	.ascii	"%d\12\0"
	.text
	.align	4
	.globl	_solve
_solve:
	.cfi_startproc
	subq	$72, %rsp
	.cfi_adjust_cfa_offset 72
L112:
	addq	$1, _counter(%rip)
	cmpq	$31, %rax
	jne	L111
	movq	_board+32(%rip), %rax
	movq	32(%rax), %rax
	cmpq	$2, %rax
	sete	%al
	movzbq	%al, %rax
	addq	$72, %rsp
	.cfi_adjust_cfa_offset -72
	ret
	.cfi_adjust_cfa_offset 72
	.align	2
L111:
	movq	%rax, (%rsp)
	call	L110
	movq	$1, %rax
	addq	$72, %rsp
	.cfi_adjust_cfa_offset -72
	ret
	.cfi_adjust_cfa_offset 72
	.align	2
L110:
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	movq	%rsp, %r14
	movq	$500, %rcx
	movq	_counter(%rip), %rsi
	movq	%rsi, %rax
	cqto
	idivq	%rcx
	testq	%rdx, %rdx
	jne	L109
	leaq	_format(%rip), %rdi
	call	_printf_int
L109:
	movq	$1, %rcx
	movq	%rcx, 32(%rsp)
L102:
	cmpq	$7, %rcx
	jg	L101
	movq	$1, %rdx
	movq	%rdx, 40(%rsp)
L104:
	cmpq	$7, %rdx
	jg	L103
	leaq	_board(%rip), %rax
	movq	(%rax,%rcx,8), %rax
	movq	(%rax,%rdx,8), %rax
	cmpq	$2, %rax
	jne	L105
	xorq	%rax, %rax
	movq	%rax, 24(%rsp)
L106:
	cmpq	$3, %rax
	jg	L105
	leaq	_dir(%rip), %rbx
	movq	(%rbx,%rax,8), %rax
	movq	(%rax), %rbx
	movq	8(%rax), %r8
	movq	%rcx, %rax
	addq	%rbx, %rax
	movq	%rax, 48(%rsp)
	movq	%rax, %rdi
	addq	%rbx, %rdi
	movq	%rdi, 64(%rsp)
	movq	%rdx, %rbx
	addq	%r8, %rbx
	movq	%rbx, 56(%rsp)
	movq	%rbx, %rsi
	addq	%r8, %rsi
	movq	%rsi, 72(%rsp)
	leaq	_board(%rip), %r8
	movq	(%r8,%rax,8), %r9
	movq	(%r9,%rbx,8), %r9
	cmpq	$2, %r9
	jne	L107
	movq	(%r8,%rdi,8), %r9
	movq	(%r9,%rsi,8), %r9
	cmpq	$1, %r9
	jne	L107
	movq	(%r8,%rcx,8), %rcx
	movq	$1, (%rcx,%rdx,8)
	movq	(%r8,%rax,8), %rax
	movq	$1, (%rax,%rbx,8)
	movq	(%r8,%rdi,8), %rax
	movq	$2, (%rax,%rsi,8)
	movq	16(%rsp), %rax
	incq	%rax
	call	_solve
L113:
	testq	%rax, %rax
	je	L108
	xorq	%rax, %rax
	movq	%r14, %rsp
	popq	%r14
	ret
	.align	2
L108:
	leaq	_board(%rip), %rax
	movq	32(%rsp), %rcx
	movq	(%rax,%rcx,8), %rbx
	movq	40(%rsp), %rdx
	movq	$2, (%rbx,%rdx,8)
	movq	48(%rsp), %rbx
	movq	(%rax,%rbx,8), %rbx
	movq	56(%rsp), %rdi
	movq	$2, (%rbx,%rdi,8)
	movq	64(%rsp), %rbx
	movq	(%rax,%rbx,8), %rax
	movq	72(%rsp), %rbx
	movq	$1, (%rax,%rbx,8)
L107:
	movq	24(%rsp), %rax
	incq	%rax
	movq	%rax, 24(%rsp)
	jmp	L106
	.align	2
L105:
	incq	%rdx
	movq	%rdx, 40(%rsp)
	jmp	L104
	.align	2
L103:
	incq	%rcx
	movq	%rcx, 32(%rsp)
	jmp	L102
	.align	2
L101:
	xorq	%rax, %rax
	popq	%r14
	.cfi_adjust_cfa_offset -8
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
L100:
	addq	$72, %rsp
	.cfi_adjust_cfa_offset -72
	ret
	.cfi_adjust_cfa_offset 72
	.cfi_adjust_cfa_offset -72
	.cfi_endproc
	.data
_format_out:
	.ascii	".\0"
	.data
_format_empty:
	.ascii	" \0"
	.data
_format_peg:
	.ascii	"$\0"
	.data
_format_newline:
	.ascii	"\12\0"
	.text
	.align	4
	.globl	_print_board
_print_board:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
L122:
	xorq	%r12, %r12
L115:
	cmpq	$9, %r12
	jge	L114
	xorq	%rbx, %rbx
L117:
	cmpq	$9, %rbx
	jge	L116
	leaq	_board(%rip), %rax
	movq	(%rax,%r12,8), %rax
	movq	(%rax,%rbx,8), %rax
	cmpq	$1, %rax
	je	L120
	jg	L119
L121:
	leaq	_format_out(%rip), %rdi
	call	_print_string
	jmp	L118
	.align	2
L120:
	leaq	_format_empty(%rip), %rdi
	call	_print_string
	jmp	L118
	.align	2
L119:
	leaq	_format_peg(%rip), %rdi
	call	_print_string
L118:
	incq	%rbx
	jmp	L117
	.align	2
L116:
	leaq	_format_newline(%rip), %rdi
	call	_print_string
	incq	%r12
	jmp	L115
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.align	2
L114:
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.text
	.align	4
	.globl	_solitaire
_solitaire:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
L124:
	xorq	%rax, %rax
	call	_solve
L125:
	testq	%rax, %rax
	je	L123
	call	_print_board
L126:
L123:
	xorq	%rax, %rax
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
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
	.quad	L126
	.word	16
	.word	0
	.align	3
	.quad	L125
	.word	16
	.word	0
	.align	3
	.quad	L113
	.word	96
	.word	0
	.align	3
