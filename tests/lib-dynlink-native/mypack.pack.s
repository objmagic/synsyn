	.file ""
	.section __TEXT,__literal16,16byte_literals
	.align	4
_caml_negf_mask:
	.quad	0x8000000000000000
	.quad	0
	.align	4
_caml_absf_mask:
	.quad	0x7fffffffffffffff
	.quad	-1
	.data
	.globl	_camlMypack__data_begin
_camlMypack__data_begin:
	.text
	.globl	_camlMypack__code_begin
_camlMypack__code_begin:
	nop
	.data
	.quad	1792
	.globl	_camlMypack
_camlMypack:
	.quad	1
	.data
	.globl	_camlMypack__gc_roots
_camlMypack__gc_roots:
	.quad	_camlMypack
	.quad	0
	.text
	.align	4
	.globl	_camlMypack__entry
_camlMypack__entry:
	.cfi_startproc
L100:
	movq	_camlMypack@GOTPCREL(%rip), %rax
	movq	_camlMypack__Packed1@GOTPCREL(%rip), %rbx
	movq	%rbx, (%rax)
	movq	$1, %rax
	ret
	.cfi_endproc
	.data
	.text
	nop
	.globl	_camlMypack__code_end
_camlMypack__code_end:
	.data
				/* relocation table start */
	.align	3
				/* relocation table end */
	.data
	.globl	_camlMypack__data_end
_camlMypack__data_end:
	.long	0
	.globl	_camlMypack__frametable
_camlMypack__frametable:
	.quad	0
