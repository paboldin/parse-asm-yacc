	.file	"kpatch_parse.c"
	.text
.Ltext0:
	.type	rb_init, @function
rb_init:
.LFB2:
	.file 1 "rbtree.h"
	.loc 1 34 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 35 0
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 36 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	rb_init, .-rb_init
	.type	rb_search_node, @function
rb_search_node:
.LFB3:
	.loc 1 54 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 1 56 0
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 58 0
	jmp	.L3
.L7:
	.loc 1 59 0
	movq	-40(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	movl	%eax, -12(%rbp)
	.loc 1 60 0
	cmpl	$0, -12(%rbp)
	jns	.L4
	.loc 1 61 0
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L3
.L4:
	.loc 1 62 0
	cmpl	$0, -12(%rbp)
	jle	.L5
	.loc 1 63 0
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L3
.L5:
	.loc 1 65 0
	movq	-8(%rbp), %rax
	jmp	.L6
.L3:
	.loc 1 58 0
	cmpq	$0, -8(%rbp)
	jne	.L7
	.loc 1 67 0
	movl	$0, %eax
.L6:
	.loc 1 68 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	rb_search_node, .-rb_search_node
	.type	rb_tree_insert, @function
rb_tree_insert:
.LFB9:
	.loc 1 151 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	.loc 1 154 0
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 155 0
	movq	-24(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 16(%rax)
	.loc 1 156 0
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 157 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	rb_tree_insert, .-rb_tree_insert
	.type	rb_insert_node, @function
rb_insert_node:
.LFB10:
	.loc 1 163 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	.loc 1 165 0
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 166 0
	movq	$0, -8(%rbp)
	.loc 1 168 0
	jmp	.L10
.L12:
	.loc 1 169 0
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 170 0
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	movl	%eax, -20(%rbp)
	.loc 1 171 0
	cmpl	$0, -20(%rbp)
	jg	.L11
	.loc 1 172 0
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$16, %rax
	movq	%rax, -16(%rbp)
	jmp	.L10
.L11:
	.loc 1 174 0
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movq	%rax, -16(%rbp)
.L10:
	.loc 1 168 0
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L12
	.loc 1 178 0
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	rb_tree_insert
	.loc 1 179 0
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	rb_insert_fixup
	.loc 1 181 0
	movl	$0, %eax
	.loc 1 182 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	rb_insert_node, .-rb_insert_node
	.type	kpstrset, @function
kpstrset:
.LFB12:
	.file 2 "kpatch_str.h"
	.loc 2 17 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	.loc 2 18 0
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 2 19 0
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 8(%rax)
	.loc 2 20 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	kpstrset, .-kpstrset
	.type	kpstrncmp, @function
kpstrncmp:
.LFB14:
	.loc 2 31 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	.loc 2 32 0
	movq	-32(%rbp), %rax
	movl	8(%rax), %edx
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, %edx
	cmovle	%edx, %eax
	movl	%eax, -8(%rbp)
	.loc 2 35 0
	movl	-8(%rbp), %eax
	cmpl	%eax, -36(%rbp)
	cmovle	-36(%rbp), %eax
	movl	%eax, -8(%rbp)
	.loc 2 36 0
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rcx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcmp
	movl	%eax, -4(%rbp)
	.loc 2 37 0
	cmpl	$0, -4(%rbp)
	je	.L16
	.loc 2 38 0
	movl	-4(%rbp), %eax
	jmp	.L17
.L16:
	.loc 2 40 0
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, %edx
	jle	.L18
	.loc 2 40 0 is_stmt 0 discriminator 1
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	-36(%rbp), %eax
	jge	.L18
	.loc 2 41 0 is_stmt 1
	movl	$1, %eax
	jmp	.L17
.L18:
	.loc 2 42 0
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, %edx
	jge	.L19
	.loc 2 42 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	-36(%rbp), %eax
	jge	.L19
	.loc 2 43 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L17
.L19:
	.loc 2 45 0
	movl	$0, %eax
.L17:
	.loc 2 46 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	kpstrncmp, .-kpstrncmp
	.type	kpstrcmp, @function
kpstrcmp:
.LFB15:
	.loc 2 49 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 2 50 0
	movq	-16(%rbp), %rax
	movl	8(%rax), %edx
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	kpstrncmp
	.loc 2 51 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	kpstrcmp, .-kpstrcmp
	.type	kpstrcmpz, @function
kpstrcmpz:
.LFB16:
	.loc 2 55 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 2 55 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 2 57 0
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, %edx
	movq	-48(%rbp), %rcx
	leaq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	kpstrset
	.loc 2 58 0
	leaq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	kpstrcmp
	.loc 2 59 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L24
	call	__stack_chk_fail
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	kpstrcmpz, .-kpstrcmpz
	.type	kpstrncmpz, @function
kpstrncmpz:
.LFB17:
	.loc 2 63 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 2 63 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 2 65 0
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, %edx
	movq	-48(%rbp), %rcx
	leaq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	kpstrset
	.loc 2 66 0
	movl	-24(%rbp), %edx
	leaq	-32(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	kpstrncmp
	.loc 2 67 0
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L27
	call	__stack_chk_fail
.L27:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	kpstrncmpz, .-kpstrncmpz
	.type	skip_blanks, @function
skip_blanks:
.LFB18:
	.loc 2 72 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 2 73 0
	jmp	.L29
.L30:
	.loc 2 74 0
	addq	$1, -8(%rbp)
.L29:
	.loc 2 73 0
	call	__ctype_b_loc
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L30
	.loc 2 75 0
	movq	-8(%rbp), %rax
	.loc 2 76 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	skip_blanks, .-skip_blanks
	.globl	cline
	.type	cline, @function
cline:
.LFB20:
	.file 3 "kpatch_parse.c"
	.loc 3 7 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	.loc 3 8 0
	cmpl	$0, -12(%rbp)
	js	.L33
	.loc 3 8 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	movl	40(%rax), %eax
	cmpl	-12(%rbp), %eax
	jg	.L34
.L33:
	.loc 3 9 0 is_stmt 1
	movl	$0, %eax
	jmp	.L35
.L34:
	.loc 3 11 0
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
.L35:
	.loc 3 12 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	cline, .-cline
	.globl	clinenum
	.type	clinenum, @function
clinenum:
.LFB21:
	.loc 3 15 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	.loc 3 16 0
	cmpl	$0, -12(%rbp)
	js	.L37
	.loc 3 16 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	movl	40(%rax), %eax
	cmpl	-12(%rbp), %eax
	jg	.L38
.L37:
	.loc 3 17 0 is_stmt 1
	movl	$0, %eax
	jmp	.L39
.L38:
	.loc 3 19 0
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
.L39:
	.loc 3 20 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	clinenum, .-clinenum
	.section	.rodata
.LC0:
	.string	""
	.text
	.globl	__get_token
	.type	__get_token, @function
__get_token:
.LFB22:
	.loc 3 23 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 3 24 0
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 3 26 0
	movq	-32(%rbp), %rax
	movl	$0, %edx
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	kpstrset
	.loc 3 27 0
	cmpq	$0, -8(%rbp)
	je	.L57
	.loc 3 30 0
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	skip_blanks
	movq	%rax, -8(%rbp)
	.loc 3 31 0
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L43
	.loc 3 31 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L44
.L43:
	.loc 3 32 0 is_stmt 1
	movq	-24(%rbp), %rax
	movq	$0, (%rax)
	.loc 3 33 0
	jmp	.L40
.L44:
	.loc 3 36 0
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$34, %al
	jne	.L45
	.loc 3 37 0
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.L46
.L49:
	.loc 3 38 0
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$92, %al
	jne	.L47
	.loc 3 38 0 is_stmt 0 discriminator 1
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L47
	.loc 3 38 0 discriminator 2
	addq	$1, -16(%rbp)
.L47:
	.loc 3 37 0 is_stmt 1 discriminator 2
	addq	$1, -16(%rbp)
.L46:
	.loc 3 37 0 is_stmt 0 discriminator 1
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L48
	.loc 3 37 0 discriminator 3
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$34, %al
	jne	.L49
.L48:
	.loc 3 39 0 is_stmt 1
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$34, %al
	jne	.L51
	.loc 3 39 0 is_stmt 0 discriminator 1
	addq	$1, -16(%rbp)
	jmp	.L51
.L45:
	.loc 3 41 0 is_stmt 1
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L52
.L53:
	.loc 3 41 0 is_stmt 0 discriminator 4
	addq	$1, -16(%rbp)
.L52:
	.loc 3 41 0 discriminator 1
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L51
	.loc 3 41 0 discriminator 3
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	strchr
	testq	%rax, %rax
	je	.L53
.L51:
	.loc 3 43 0 is_stmt 1
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jne	.L54
	.loc 3 44 0
	addq	$1, -16(%rbp)
.L54:
	.loc 3 46 0
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movl	%eax, %edx
	movq	-8(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	kpstrset
	.loc 3 48 0
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	skip_blanks
	movq	%rax, -16(%rbp)
	.loc 3 49 0
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L55
	.loc 3 49 0 is_stmt 0 discriminator 1
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L56
.L55:
	.loc 3 50 0 is_stmt 1
	movq	$0, -16(%rbp)
.L56:
	.loc 3 51 0
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L40
.L57:
	.loc 3 28 0
	nop
.L40:
	.loc 3 52 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	__get_token, .-__get_token
	.section	.rodata
.LC1:
	.string	" \t,;:-+*()[]$\n"
	.text
	.globl	get_token
	.type	get_token, @function
get_token:
.LFB23:
	.loc 3 55 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 3 56 0
	movq	$.LC1, -8(%rbp)
	.loc 3 57 0
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	__get_token
	.loc 3 58 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	get_token, .-get_token
	.section	.rodata
.LC2:
	.string	".align"
.LC3:
	.string	".p2align"
.LC4:
	.string	".type"
.LC5:
	.string	".comm"
.LC6:
	.string	".size"
.LC7:
	.string	".weak"
.LC8:
	.string	".text"
.LC9:
	.string	".data"
.LC10:
	.string	".bss"
.LC11:
	.string	".section"
.LC12:
	.string	".pushsection"
.LC13:
	.string	".popsection"
.LC14:
	.string	".previous"
.LC15:
	.string	".subsection"
.LC16:
	.string	".globl"
.LC17:
	.string	".local"
.LC18:
	.string	".hidden"
.LC19:
	.string	".protected"
.LC20:
	.string	".internal"
.LC21:
	.string	".set"
.LC22:
	.string	".kpgensrc_flags"
	.data
	.align 32
	.type	asm_directives, @object
	.size	asm_directives, 336
asm_directives:
	.long	1
	.zero	4
	.quad	.LC2
	.long	1
	.zero	4
	.quad	.LC3
	.long	2
	.zero	4
	.quad	.LC4
	.long	3
	.zero	4
	.quad	.LC5
	.long	5
	.zero	4
	.quad	.LC6
	.long	4
	.zero	4
	.quad	.LC7
	.long	20
	.zero	4
	.quad	.LC8
	.long	21
	.zero	4
	.quad	.LC9
	.long	22
	.zero	4
	.quad	.LC10
	.long	30
	.zero	4
	.quad	.LC11
	.long	31
	.zero	4
	.quad	.LC12
	.long	32
	.zero	4
	.quad	.LC13
	.long	34
	.zero	4
	.quad	.LC14
	.long	33
	.zero	4
	.quad	.LC15
	.long	10
	.zero	4
	.quad	.LC16
	.long	11
	.zero	4
	.quad	.LC17
	.long	12
	.zero	4
	.quad	.LC18
	.long	13
	.zero	4
	.quad	.LC19
	.long	14
	.zero	4
	.quad	.LC20
	.long	41
	.zero	4
	.quad	.LC21
	.long	500
	.zero	4
	.quad	.LC22
	.section	.rodata
.LC23:
	.string	","
.LC24:
	.string	"can't parse .type command"
	.text
	.type	get_type_args, @function
get_type_args:
.LFB24:
	.loc 3 94 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	.loc 3 94 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 97 0
	leaq	-48(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 98 0
	leaq	-48(%rbp), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	testl	%eax, %eax
	jne	.L64
	.loc 3 101 0
	movq	-64(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 102 0
	leaq	-32(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 103 0
	movq	-72(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 105 0
	leaq	-32(%rbp), %rax
	movl	$.LC23, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	testl	%eax, %eax
	je	.L59
	.loc 3 106 0
	movl	$.LC24, %edi
	movl	$0, %eax
	call	kpfatal
.L64:
	.loc 3 99 0
	nop
.L59:
	.loc 3 107 0
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L63
	call	__stack_chk_fail
.L63:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	get_type_args, .-get_type_args
	.type	find_ctype, @function
find_ctype:
.LFB25:
	.loc 3 110 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 3 112 0
	movl	$0, -4(%rbp)
	jmp	.L66
.L69:
	.loc 3 113 0
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$asm_directives+8, %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	kpstrcmpz
	testl	%eax, %eax
	jne	.L67
	.loc 3 114 0
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$asm_directives, %rax
	movl	(%rax), %eax
	jmp	.L68
.L67:
	.loc 3 112 0 discriminator 2
	addl	$1, -4(%rbp)
.L66:
	.loc 3 112 0 is_stmt 0 discriminator 1
	cmpl	$20, -4(%rbp)
	jle	.L69
	.loc 3 116 0 is_stmt 1
	movl	$-1, %eax
.L68:
	.loc 3 117 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	find_ctype, .-find_ctype
	.section	.rodata
	.align 8
.LC25:
	.string	"Human writed asm? Found directive we care about right after local label '%s'"
	.text
	.globl	parse_ctype
	.type	parse_ctype, @function
parse_ctype:
.LFB26:
	.loc 3 120 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, %eax
	movb	%al, -60(%rbp)
	.loc 3 120 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 121 0
	movq	-56(%rbp), %rax
	movq	%rax, -40(%rbp)
	.loc 3 125 0
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	skip_blanks
	movq	%rax, -40(%rbp)
	.loc 3 126 0
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$35, %al
	jne	.L71
	.loc 3 127 0
	movl	$40, %eax
	jmp	.L78
.L71:
	.loc 3 129 0
	leaq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 130 0
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	find_ctype
	movl	%eax, -44(%rbp)
	.loc 3 132 0
	cmpl	$0, -44(%rbp)
	js	.L73
	.loc 3 133 0
	movl	-44(%rbp), %eax
	jmp	.L78
.L73:
	.loc 3 139 0
	movq	-40(%rbp), %rax
	testq	%rax, %rax
	je	.L74
	.loc 3 139 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	jne	.L74
	.loc 3 140 0 is_stmt 1
	call	__ctype_b_loc
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	testl	%eax, %eax
	jne	.L75
	.loc 3 140 0 is_stmt 0 discriminator 1
	movl	$6, %eax
	jmp	.L78
.L75:
	.loc 3 140 0 discriminator 2
	movl	$7, %eax
	jmp	.L78
.L74:
	.loc 3 143 0 is_stmt 1
	cmpb	$0, -60(%rbp)
	je	.L77
	.loc 3 143 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	testq	%rax, %rax
	je	.L77
	.loc 3 143 0 discriminator 2
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	jne	.L77
	.loc 3 143 0 discriminator 3
	call	__ctype_b_loc
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	testl	%eax, %eax
	je	.L77
	.loc 3 152 0 is_stmt 1
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
	leaq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 153 0
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	find_ctype
	movl	%eax, -44(%rbp)
	cmpl	$0, -44(%rbp)
	js	.L77
	.loc 3 154 0
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC25, %edi
	movl	$0, %eax
	call	kpfatal
.L77:
	.loc 3 157 0
	movl	$100, %eax
.L78:
	.loc 3 158 0 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L79
	.loc 3 158 0 is_stmt 0
	call	__stack_chk_fail
.L79:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	parse_ctype, .-parse_ctype
	.section	.rodata
.LC26:
	.string	"ctype access beyond EOF"
	.text
	.globl	ctype
	.type	ctype, @function
ctype:
.LFB27:
	.loc 3 161 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	.loc 3 162 0
	movq	-8(%rbp), %rax
	movl	40(%rax), %eax
	cmpl	-12(%rbp), %eax
	jg	.L81
	.loc 3 163 0
	movl	$.LC26, %edi
	movl	$0, %eax
	call	kpfatal
.L81:
	.loc 3 165 0
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	.loc 3 166 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	ctype, .-ctype
	.globl	is_sect_cmd
	.type	is_sect_cmd, @function
is_sect_cmd:
.LFB28:
	.loc 3 169 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	.loc 3 170 0
	movl	-28(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	movl	%eax, -4(%rbp)
	.loc 3 174 0
	cmpl	$20, -4(%rbp)
	je	.L84
	.loc 3 172 0
	cmpl	$21, -4(%rbp)
	je	.L84
	.loc 3 172 0 is_stmt 0 discriminator 1
	cmpl	$22, -4(%rbp)
	je	.L84
	.loc 3 172 0 discriminator 2
	cmpl	$30, -4(%rbp)
	je	.L84
	.loc 3 172 0 discriminator 3
	cmpl	$31, -4(%rbp)
	je	.L84
	.loc 3 173 0 is_stmt 1
	cmpl	$32, -4(%rbp)
	je	.L84
	.loc 3 173 0 is_stmt 0 discriminator 1
	cmpl	$34, -4(%rbp)
	je	.L84
	.loc 3 174 0 is_stmt 1 discriminator 2
	cmpl	$33, -4(%rbp)
	jne	.L85
.L84:
	.loc 3 174 0 is_stmt 0 discriminator 1
	movl	$1, %eax
	jmp	.L86
.L85:
	.loc 3 174 0 discriminator 3
	movl	$0, %eax
.L86:
	.loc 3 175 0 is_stmt 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	is_sect_cmd, .-is_sect_cmd
	.section	.rodata
.LC27:
	.string	";:"
	.align 8
.LC28:
	.string	"oops, not prepared to handle >1000 asm statements in single line"
	.text
	.globl	init_multilines
	.type	init_multilines, @function
init_multilines:
.LFB29:
	.loc 3 179 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -120(%rbp)
	.loc 3 179 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 3 180 0
	movl	$64, -92(%rbp)
	.loc 3 181 0
	movq	$0, -72(%rbp)
	.loc 3 182 0
	movq	$0, -56(%rbp)
	.loc 3 185 0
	movl	$0, -96(%rbp)
	.loc 3 186 0
	movl	$0, -100(%rbp)
	jmp	.L89
.L103:
	.loc 3 187 0
	movl	-96(%rbp), %eax
	addl	$1000, %eax
	cmpl	-92(%rbp), %eax
	jge	.L90
	.loc 3 187 0 is_stmt 0 discriminator 1
	cmpq	$0, -72(%rbp)
	jne	.L91
.L90:
	.loc 3 188 0 is_stmt 1
	sall	-92(%rbp)
	.loc 3 189 0
	movl	-92(%rbp), %eax
	sall	$3, %eax
	movl	%eax, %esi
	movl	-92(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	sall	$3, %eax
	movl	%eax, %ecx
	movq	-72(%rbp), %rax
	movl	%esi, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	kp_realloc
	movq	%rax, -72(%rbp)
	.loc 3 190 0
	movl	-92(%rbp), %eax
	sall	$2, %eax
	movl	%eax, %esi
	movl	-92(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	sall	$2, %eax
	movl	%eax, %ecx
	movq	-56(%rbp), %rax
	movl	%esi, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	kp_realloc
	movq	%rax, -56(%rbp)
.L91:
	.loc 3 193 0
	movq	-120(%rbp), %rax
	movq	48(%rax), %rax
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -64(%rbp)
	.loc 3 194 0
	movq	-64(%rbp), %rax
	movl	$.LC27, %esi
	movq	%rax, %rdi
	call	strpbrk
	testq	%rax, %rax
	je	.L92
	.loc 3 195 0
	jmp	.L93
.L101:
	.loc 3 196 0
	movq	-64(%rbp), %rax
	movq	%rax, -80(%rbp)
	.loc 3 197 0
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, -88(%rbp)
	.loc 3 198 0
	movl	$1, -84(%rbp)
	.loc 3 199 0
	jmp	.L94
.L99:
	.loc 3 200 0
	leaq	-48(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 201 0
	movl	-40(%rbp), %eax
	cmpl	$1, %eax
	jne	.L95
	.loc 3 201 0 is_stmt 0 discriminator 1
	movq	-48(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$35, %al
	je	.L105
.L95:
	.loc 3 203 0 is_stmt 1
	movl	-40(%rbp), %eax
	cmpl	$1, %eax
	jne	.L96
	.loc 3 203 0 is_stmt 0 discriminator 1
	movq	-48(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$59, %al
	jne	.L96
	.loc 3 204 0 is_stmt 1
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movl	%eax, -88(%rbp)
	.loc 3 205 0
	jmp	.L97
.L96:
	.loc 3 212 0
	cmpl	$0, -84(%rbp)
	je	.L98
	.loc 3 212 0 is_stmt 0 discriminator 1
	movq	-80(%rbp), %rax
	testq	%rax, %rax
	je	.L98
	.loc 3 213 0 is_stmt 1 discriminator 2
	movq	-80(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 3 212 0 discriminator 2
	cmpb	$58, %al
	jne	.L98
	.loc 3 214 0
	movq	-80(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	skip_blanks
	movzbl	(%rax), %eax
	.loc 3 213 0
	testb	%al, %al
	je	.L98
	.loc 3 215 0
	movq	-80(%rbp), %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	.loc 3 216 0
	movq	-80(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -80(%rbp)
	.loc 3 217 0
	jmp	.L97
.L98:
	.loc 3 219 0
	movl	$0, -84(%rbp)
.L94:
	.loc 3 199 0
	movq	-80(%rbp), %rax
	testq	%rax, %rax
	jne	.L99
.L97:
	.loc 3 221 0
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-88(%rbp), %eax
	movslq	%eax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strndup
	movq	%rax, (%rbx)
	.loc 3 222 0
	movq	-80(%rbp), %rax
	movq	%rax, -64(%rbp)
	.loc 3 223 0
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movl	-100(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 3 224 0
	addl	$1, -96(%rbp)
	.loc 3 225 0
	movl	-96(%rbp), %eax
	cmpl	-92(%rbp), %eax
	jl	.L93
	.loc 3 226 0
	movl	$.LC28, %edi
	movl	$0, %eax
	call	kpfatal
.L93:
	.loc 3 195 0
	cmpq	$0, -64(%rbp)
	je	.L100
	.loc 3 195 0 is_stmt 0 discriminator 1
	movq	-64(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L101
.L100:
	.loc 3 228 0 is_stmt 1
	movq	-120(%rbp), %rax
	movq	48(%rax), %rax
	movl	-100(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free
	jmp	.L102
.L105:
	.loc 3 202 0
	nop
.L92:
	.loc 3 231 0
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rax, (%rdx)
	.loc 3 232 0
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rax, %rdx
	movl	-100(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 3 233 0
	addl	$1, -96(%rbp)
.L102:
	.loc 3 186 0 discriminator 2
	addl	$1, -100(%rbp)
.L89:
	.loc 3 186 0 is_stmt 0 discriminator 1
	movq	-120(%rbp), %rax
	movl	40(%rax), %eax
	cmpl	-100(%rbp), %eax
	jg	.L103
	.loc 3 236 0 is_stmt 1
	movq	-120(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, %rdi
	call	free
	.loc 3 237 0
	movq	-120(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, 48(%rax)
	.loc 3 238 0
	movq	-120(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, 56(%rax)
	.loc 3 239 0
	movq	-120(%rbp), %rax
	movl	-96(%rbp), %edx
	movl	%edx, 40(%rax)
	.loc 3 240 0
	nop
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L104
	call	__stack_chk_fail
.L104:
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	init_multilines, .-init_multilines
	.globl	init_ctypes
	.type	init_ctypes, @function
init_ctypes:
.LFB30:
	.loc 3 243 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	.loc 3 246 0
	movq	-40(%rbp), %rax
	movl	40(%rax), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 64(%rax)
	.loc 3 247 0
	movl	$0, -20(%rbp)
	jmp	.L107
.L108:
	.loc 3 248 0 discriminator 3
	movq	-40(%rbp), %rax
	movq	64(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	leaq	(%rax,%rdx), %rbx
	movl	-20(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movl	$1, %esi
	movq	%rax, %rdi
	call	parse_ctype
	movl	%eax, (%rbx)
	.loc 3 247 0 discriminator 3
	addl	$1, -20(%rbp)
.L107:
	.loc 3 247 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	movl	40(%rax), %eax
	cmpl	-20(%rbp), %eax
	jg	.L108
	.loc 3 250 0 is_stmt 1
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	init_ctypes, .-init_ctypes
	.type	cblock_name_cmp, @function
cblock_name_cmp:
.LFB31:
	.loc 3 255 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
.LBB2:
	.loc 3 256 0
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	subq	$64, %rax
.LBE2:
	movq	%rax, -16(%rbp)
	.loc 3 257 0
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 3 260 0
	movq	-16(%rbp), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	kpstrcmp
	movl	%eax, -28(%rbp)
	.loc 3 261 0
	movl	-28(%rbp), %eax
	.loc 3 262 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	cblock_name_cmp, .-cblock_name_cmp
	.type	cblock_human_name_cmp, @function
cblock_human_name_cmp:
.LFB32:
	.loc 3 265 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
.LBB3:
	.loc 3 266 0
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	subq	$88, %rax
.LBE3:
	movq	%rax, -16(%rbp)
	.loc 3 267 0
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 3 270 0
	movq	-16(%rbp), %rax
	leaq	32(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	kpstrcmp
	movl	%eax, -28(%rbp)
	.loc 3 271 0
	movl	-28(%rbp), %eax
	.loc 3 272 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	cblock_human_name_cmp, .-cblock_human_name_cmp
	.type	cblock_start_cmp, @function
cblock_start_cmp:
.LFB33:
	.loc 3 275 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
.LBB4:
	.loc 3 276 0
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	subq	$112, %rax
.LBE4:
	movq	%rax, -8(%rbp)
	.loc 3 278 0
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	cmpq	-32(%rbp), %rax
	je	.L114
	.loc 3 278 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	cmpq	-32(%rbp), %rax
	jbe	.L115
	.loc 3 278 0 discriminator 3
	movl	$-1, %eax
	jmp	.L118
.L115:
	.loc 3 278 0 discriminator 4
	movl	$1, %eax
	jmp	.L118
.L114:
	.loc 3 278 0 discriminator 2
	movl	$0, %eax
.L118:
	.loc 3 279 0 is_stmt 1 discriminator 9
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	cblock_start_cmp, .-cblock_start_cmp
	.section	.rodata
.LC29:
	.string	"\t\n.,"
.LC30:
	.string	"__mod_"
	.text
	.type	cblock_make_human_name, @function
cblock_make_human_name:
.LFB34:
	.loc 3 282 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	.loc 3 282 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 284 0
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	.loc 3 286 0
	movq	-56(%rbp), %rcx
	movq	-64(%rbp), %rax
	movq	8(%rax), %rdx
	movq	(%rax), %rax
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	.loc 3 295 0
	leaq	-32(%rbp), %rcx
	leaq	-40(%rbp), %rax
	movl	$.LC29, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	__get_token
	.loc 3 296 0
	movq	-40(%rbp), %rax
	testq	%rax, %rax
	je	.L120
	.loc 3 296 0 is_stmt 0 discriminator 1
	call	__ctype_b_loc
	movq	(%rax), %rdx
	movq	-64(%rbp), %rax
	movq	(%rax), %rcx
	movq	-64(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	subq	$1, %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	testl	%eax, %eax
	je	.L120
	.loc 3 297 0 is_stmt 1
	movq	-56(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	jmp	.L119
.L120:
	.loc 3 302 0
	movq	-64(%rbp), %rax
	movl	$.LC30, %esi
	movq	%rax, %rdi
	call	kpstrncmpz
	testl	%eax, %eax
	jne	.L119
	.loc 3 302 0 is_stmt 0 discriminator 1
	call	__ctype_b_loc
	movq	(%rax), %rdx
	movq	-64(%rbp), %rax
	movq	(%rax), %rcx
	movq	-64(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	subq	$1, %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	testl	%eax, %eax
	je	.L119
	.loc 3 303 0 is_stmt 1
	jmp	.L123
.L124:
	.loc 3 304 0
	movq	-56(%rbp), %rax
	movl	8(%rax), %eax
	leal	-1(%rax), %edx
	movq	-56(%rbp), %rax
	movl	%edx, 8(%rax)
.L123:
	.loc 3 303 0
	call	__ctype_b_loc
	movq	(%rax), %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rcx
	movq	-56(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	subq	$1, %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	testl	%eax, %eax
	jne	.L124
.L119:
	.loc 3 305 0
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L125
	call	__stack_chk_fail
.L125:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	cblock_make_human_name, .-cblock_make_human_name
	.section	.rodata
.LC31:
	.string	"duplicate cblock name '%.*s'"
.LC32:
	.string	"Add cblock %.*s (%d: %d-%d)"
	.text
	.globl	cblock_add
	.type	cblock_add, @function
cblock_add:
.LFB35:
	.loc 3 308 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movq	%rcx, -40(%rbp)
	movl	%r8d, -44(%rbp)
	movl	%r9d, -48(%rbp)
	.loc 3 309 0
	movl	$136, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	.loc 3 311 0
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	je	.L127
	.loc 3 311 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	cblock_find_by_name
	testq	%rax, %rax
	je	.L127
	.loc 3 312 0 is_stmt 1
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %esi
	movl	$.LC31, %edi
	movl	$0, %eax
	call	kpfatal
.L127:
	.loc 3 314 0
	movq	-8(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, 8(%rax)
	.loc 3 315 0
	movq	-8(%rbp), %rax
	movl	-32(%rbp), %edx
	movl	%edx, 12(%rax)
	.loc 3 316 0
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 3 317 0
	movq	-8(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movq	(%rax), %rax
	movq	%rax, 16(%rcx)
	movq	%rdx, 24(%rcx)
	.loc 3 318 0
	movq	-8(%rbp), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	$32, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	cblock_make_human_name
	.loc 3 319 0
	movq	-8(%rbp), %rax
	leaq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	$32, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	kpstrcmp
	testl	%eax, %eax
	setne	%al
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 48(%rax)
	.loc 3 320 0
	movl	-44(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 49(%rax)
	.loc 3 321 0
	movl	-48(%rbp), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, 50(%rax)
	.loc 3 322 0
	movq	-8(%rbp), %rax
	movb	$0, 53(%rax)
	movq	-8(%rbp), %rax
	movzbl	53(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, 52(%rax)
	movq	-8(%rbp), %rax
	movzbl	52(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, 51(%rax)
	.loc 3 323 0
	movq	-8(%rbp), %rax
	movq	$0, 56(%rax)
	.loc 3 324 0
	movq	-8(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	leaq	64(%rax), %rsi
	movq	-24(%rbp), %rax
	addq	$80, %rax
	movq	%rdx, %rcx
	movl	$cblock_name_cmp, %edx
	movq	%rax, %rdi
	call	rb_insert_node
	.loc 3 325 0
	movq	-8(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	leaq	88(%rax), %rsi
	movq	-24(%rbp), %rax
	addq	$88, %rax
	movq	%rdx, %rcx
	movl	$cblock_human_name_cmp, %edx
	movq	%rax, %rdi
	call	rb_insert_node
	.loc 3 326 0
	movl	-28(%rbp), %eax
	cltq
	movq	-8(%rbp), %rdx
	leaq	112(%rdx), %rsi
	movq	-24(%rbp), %rdx
	leaq	96(%rdx), %rdi
	movq	%rax, %rcx
	movl	$cblock_start_cmp, %edx
	call	rb_insert_node
	.loc 3 327 0
	movl	-32(%rbp), %eax
	leal	-1(%rax), %edi
	movq	-24(%rbp), %rax
	movl	(%rax), %ecx
	movq	-40(%rbp), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	movl	-28(%rbp), %esi
	subq	$8, %rsp
	pushq	%rdi
	movl	%esi, %r9d
	movl	%ecx, %r8d
	movq	%rdx, %rcx
	movl	%eax, %edx
	movl	$.LC32, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	kplog
	addq	$16, %rsp
	.loc 3 329 0
	movq	-8(%rbp), %rax
	.loc 3 330 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	cblock_add, .-cblock_add
	.globl	cblock_find_by_name
	.type	cblock_find_by_name, @function
cblock_find_by_name:
.LFB36:
	.loc 3 333 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 3 337 0
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	leaq	80(%rdx), %rcx
	movq	%rax, %rdx
	movl	$cblock_name_cmp, %esi
	movq	%rcx, %rdi
	call	rb_search_node
	movq	%rax, -24(%rbp)
	.loc 3 338 0
	cmpq	$0, -24(%rbp)
	jne	.L130
	.loc 3 339 0
	movl	$0, %eax
	jmp	.L131
.L130:
.LBB5:
	.loc 3 341 0
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	subq	$64, %rax
.LBE5:
	movq	%rax, -8(%rbp)
	.loc 3 342 0
	movq	-8(%rbp), %rax
.L131:
	.loc 3 343 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	cblock_find_by_name, .-cblock_find_by_name
	.globl	cblock_find_by_human_name
	.type	cblock_find_by_human_name, @function
cblock_find_by_human_name:
.LFB37:
	.loc 3 346 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	.loc 3 350 0
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rdx
	leaq	88(%rdx), %rcx
	movq	%rax, %rdx
	movl	$cblock_human_name_cmp, %esi
	movq	%rcx, %rdi
	call	rb_search_node
	movq	%rax, -40(%rbp)
	.loc 3 351 0
	cmpq	$0, -40(%rbp)
	jne	.L133
	.loc 3 352 0
	movl	$0, %eax
	jmp	.L134
.L133:
	.loc 3 355 0
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	rb_prev
	movq	%rax, -32(%rbp)
	jmp	.L135
.L138:
.LBB6:
	.loc 3 356 0
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	subq	$88, %rax
.LBE6:
	movq	%rax, -16(%rbp)
	.loc 3 357 0
	movq	-16(%rbp), %rax
	leaq	32(%rax), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	kpstrcmp
	testl	%eax, %eax
	jne	.L139
	.loc 3 359 0 discriminator 2
	movq	-32(%rbp), %rax
	movq	%rax, -40(%rbp)
	.loc 3 355 0 discriminator 2
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	rb_prev
	movq	%rax, -32(%rbp)
.L135:
	.loc 3 355 0 is_stmt 0 discriminator 1
	cmpq	$0, -32(%rbp)
	jne	.L138
	jmp	.L137
.L139:
	.loc 3 358 0 is_stmt 1
	nop
.L137:
.LBB7:
	.loc 3 362 0
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	$88, %rax
.LBE7:
	movq	%rax, -16(%rbp)
	.loc 3 363 0
	movq	-16(%rbp), %rax
.L134:
	.loc 3 364 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	cblock_find_by_human_name, .-cblock_find_by_human_name
	.section	.rodata
.LC33:
	.string	"KPGENSRC_ADAPTED"
	.text
	.type	get_kpatch_flags, @function
get_kpatch_flags:
.LFB38:
	.loc 3 367 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	.loc 3 367 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 369 0
	movl	$0, -36(%rbp)
	.loc 3 371 0
	leaq	-32(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 373 0
	jmp	.L141
.L142:
	.loc 3 374 0
	leaq	-32(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 375 0
	leaq	-32(%rbp), %rax
	movl	$.LC33, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	testl	%eax, %eax
	jne	.L141
	.loc 3 376 0
	orl	$1, -36(%rbp)
.L141:
	.loc 3 373 0
	movq	-56(%rbp), %rax
	testq	%rax, %rax
	jne	.L142
	.loc 3 379 0
	movl	-36(%rbp), %eax
	.loc 3 380 0
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L144
	call	__stack_chk_fail
.L144:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	get_kpatch_flags, .-get_kpatch_flags
	.type	init_func_block, @function
init_func_block:
.LFB39:
	.loc 3 383 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	.loc 3 384 0
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -24(%rbp)
	movl	$0, -20(%rbp)
	.loc 3 385 0
	movl	$0, -16(%rbp)
	.loc 3 388 0
	jmp	.L146
.L150:
	.loc 3 389 0
	movl	-24(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	cmpl	$10, %eax
	jne	.L147
	.loc 3 390 0
	movl	$1, -20(%rbp)
.L147:
	.loc 3 391 0
	movl	-24(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	cmpl	$500, %eax
	jne	.L148
	.loc 3 392 0
	movl	-24(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movq	%rax, %rdi
	call	get_kpatch_flags
	orl	%eax, -16(%rbp)
	.loc 3 393 0
	movl	-24(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movb	$0, (%rax)
.L148:
	.loc 3 395 0
	addl	$1, -24(%rbp)
.L146:
	.loc 3 388 0
	movq	-40(%rbp), %rax
	movl	40(%rax), %eax
	subl	$1, %eax
	cmpl	-24(%rbp), %eax
	jle	.L149
	.loc 3 388 0 is_stmt 0 discriminator 1
	movq	-56(%rbp), %rdx
	movl	-24(%rbp), %ecx
	movq	-40(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	is_function_end
	testl	%eax, %eax
	je	.L150
.L149:
	.loc 3 398 0 is_stmt 1
	addl	$1, -24(%rbp)
	.loc 3 400 0
	movl	-20(%rbp), %edi
	movq	-56(%rbp), %rcx
	movl	-24(%rbp), %edx
	movl	-12(%rbp), %esi
	movq	-40(%rbp), %rax
	movl	%edi, %r9d
	movl	$1, %r8d
	movq	%rax, %rdi
	call	cblock_add
	movq	%rax, -8(%rbp)
	.loc 3 401 0
	movl	-16(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L151
	.loc 3 402 0
	movq	-8(%rbp), %rax
	movb	$1, 54(%rax)
.L151:
	.loc 3 403 0
	movq	-48(%rbp), %rax
	movl	-24(%rbp), %edx
	movl	%edx, (%rax)
	.loc 3 404 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE39:
	.size	init_func_block, .-init_func_block
	.type	init_var_block, @function
init_var_block:
.LFB40:
	.loc 3 407 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%rdx, -104(%rbp)
	.loc 3 407 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 3 408 0
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -56(%rbp)
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -60(%rbp)
	movl	$0, -64(%rbp)
	movl	$0, -52(%rbp)
	.loc 3 411 0
	jmp	.L153
.L159:
	.loc 3 412 0
	leaq	-48(%rbp), %rdi
	leaq	-64(%rbp), %rcx
	leaq	-68(%rbp), %rdx
	movl	-60(%rbp), %esi
	movq	-88(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	is_variable_start
	testl	%eax, %eax
	je	.L154
	.loc 3 413 0
	leaq	-48(%rbp), %rdx
	movq	-104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	kpstrcmp
	testl	%eax, %eax
	jne	.L161
	.loc 3 415 0
	movl	-68(%rbp), %eax
	movl	%eax, -60(%rbp)
	.loc 3 416 0
	jmp	.L153
.L154:
	.loc 3 418 0
	movl	-60(%rbp), %edx
	movq	-88(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	movl	%eax, %ebx
	movl	-60(%rbp), %edx
	movq	-88(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movl	%ebx, %esi
	movq	%rax, %rdi
	call	is_data_def
	testl	%eax, %eax
	je	.L157
	.loc 3 419 0
	addl	$1, -60(%rbp)
	movl	$1, -52(%rbp)
	.loc 3 420 0
	jmp	.L153
.L157:
	.loc 3 422 0
	movq	-104(%rbp), %rdx
	movl	-60(%rbp), %ecx
	movq	-88(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	is_function_end
	testl	%eax, %eax
	je	.L162
	.loc 3 423 0
	addl	$1, -60(%rbp)
	.loc 3 424 0
	nop
.L153:
	.loc 3 411 0
	movq	-88(%rbp), %rax
	movl	40(%rax), %eax
	cmpl	-60(%rbp), %eax
	jg	.L159
	jmp	.L156
.L161:
	.loc 3 414 0
	nop
	jmp	.L156
.L162:
	.loc 3 426 0
	nop
.L156:
	.loc 3 433 0
	movl	-64(%rbp), %edi
	movq	-104(%rbp), %rcx
	movl	-60(%rbp), %edx
	movl	-56(%rbp), %esi
	movq	-88(%rbp), %rax
	movl	%edi, %r9d
	movl	$2, %r8d
	movq	%rax, %rdi
	call	cblock_add
	.loc 3 434 0
	movq	-96(%rbp), %rax
	movl	-60(%rbp), %edx
	movl	%edx, (%rax)
	.loc 3 435 0
	nop
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L160
	call	__stack_chk_fail
.L160:
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE40:
	.size	init_var_block, .-init_var_block
	.type	init_set_block, @function
init_set_block:
.LFB41:
	.loc 3 438 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 3 438 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 439 0
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movq	%rax, -16(%rbp)
	.loc 3 440 0
	movq	-40(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 441 0
	movq	-40(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 442 0
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edi
	movq	-32(%rbp), %rax
	movl	(%rax), %esi
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	movl	$0, %r9d
	movl	$2, %r8d
	movq	%rdx, %rcx
	movl	%edi, %edx
	movq	%rax, %rdi
	call	cblock_add
	.loc 3 443 0
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	.loc 3 444 0
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L164
	call	__stack_chk_fail
.L164:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE41:
	.size	init_set_block, .-init_set_block
	.type	init_other_block, @function
init_other_block:
.LFB42:
	.loc 3 447 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	.loc 3 447 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 448 0
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -36(%rbp)
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -40(%rbp)
	.loc 3 451 0
	jmp	.L166
.L168:
	.loc 3 452 0
	addl	$1, -40(%rbp)
.L166:
	.loc 3 451 0
	movq	-56(%rbp), %rax
	movl	40(%rax), %eax
	cmpl	-40(%rbp), %eax
	jle	.L167
	.loc 3 451 0 is_stmt 0 discriminator 1
	leaq	-32(%rbp), %rdx
	movl	-40(%rbp), %ecx
	movq	-56(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	is_function_start
	testl	%eax, %eax
	jne	.L167
	.loc 3 451 0 discriminator 2
	leaq	-32(%rbp), %rdx
	movl	-40(%rbp), %esi
	movq	-56(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rdi
	call	is_variable_start
	testl	%eax, %eax
	je	.L168
.L167:
	.loc 3 454 0 is_stmt 1
	leaq	-32(%rbp), %rax
	movl	$0, %edx
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	kpstrset
	.loc 3 455 0
	leaq	-32(%rbp), %rcx
	movl	-40(%rbp), %edx
	movl	-36(%rbp), %esi
	movq	-56(%rbp), %rax
	movl	$0, %r9d
	movl	$4, %r8d
	movq	%rax, %rdi
	call	cblock_add
	.loc 3 456 0
	movq	-64(%rbp), %rax
	movl	-40(%rbp), %edx
	movl	%edx, (%rax)
	.loc 3 457 0
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L169
	call	__stack_chk_fail
.L169:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE42:
	.size	init_other_block, .-init_other_block
	.type	init_attr_block, @function
init_attr_block:
.LFB43:
	.loc 3 460 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	.loc 3 460 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 462 0
	movq	-96(%rbp), %rax
	movl	(%rax), %edx
	movq	-88(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movq	%rax, -72(%rbp)
	.loc 3 463 0
	movl	$1, -76(%rbp)
	.loc 3 466 0
	leaq	-64(%rbp), %rdx
	leaq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 467 0
	leaq	-48(%rbp), %rdx
	leaq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 468 0
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, %edx
	movq	-64(%rbp), %rcx
	leaq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	kpstrset
	.loc 3 471 0
	movq	-96(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-88(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	testq	%rax, %rax
	je	.L171
.LBB8:
	.loc 3 474 0
	leaq	-32(%rbp), %rdx
	leaq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 475 0
	leaq	-32(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	kpstrcmp
	testl	%eax, %eax
	jne	.L171
	.loc 3 476 0
	addl	$1, -76(%rbp)
.L171:
.LBE8:
	.loc 3 479 0
	leaq	-64(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	cblock_find_by_name
	testq	%rax, %rax
	jne	.L173
	.loc 3 480 0
	movq	-96(%rbp), %rax
	movl	(%rax), %edx
	movl	-76(%rbp), %eax
	leal	(%rdx,%rax), %edi
	movq	-96(%rbp), %rax
	movl	(%rax), %esi
	leaq	-64(%rbp), %rdx
	movq	-88(%rbp), %rax
	movl	$0, %r9d
	movl	$3, %r8d
	movq	%rdx, %rcx
	movl	%edi, %edx
	movq	%rax, %rdi
	call	cblock_add
.L173:
	.loc 3 482 0
	movq	-96(%rbp), %rax
	movl	(%rax), %edx
	movl	-76(%rbp), %eax
	addl	%eax, %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	.loc 3 483 0
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L174
	call	__stack_chk_fail
.L174:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE43:
	.size	init_attr_block, .-init_attr_block
	.section	.rodata
	.align 8
.LC34:
	.string	"Add split cblock %.*s (%d: %d-%d)\n"
	.text
	.globl	cblock_split
	.type	cblock_split, @function
cblock_split:
.LFB44:
	.loc 3 486 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	.loc 3 487 0
	movl	$136, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	.loc 3 489 0
	movq	-8(%rbp), %rax
	movl	$136, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	.loc 3 490 0
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movl	-28(%rbp), %eax
	addl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 8(%rax)
	.loc 3 491 0
	movq	-24(%rbp), %rax
	movl	12(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 12(%rax)
	.loc 3 492 0
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 3 493 0
	movq	-8(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	24(%rax), %rdx
	movq	16(%rax), %rax
	movq	%rax, 16(%rcx)
	movq	%rdx, 24(%rcx)
	.loc 3 494 0
	movq	-24(%rbp), %rax
	movzbl	49(%rax), %edx
	movq	-8(%rbp), %rax
	movb	%dl, 49(%rax)
	.loc 3 495 0
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movl	-28(%rbp), %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, 12(%rax)
	.loc 3 496 0
	movq	-8(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	leaq	64(%rax), %rsi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$80, %rax
	movq	%rdx, %rcx
	movl	$cblock_name_cmp, %edx
	movq	%rax, %rdi
	call	rb_insert_node
	.loc 3 497 0
	movq	-8(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	leaq	88(%rax), %rsi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$88, %rax
	movq	%rdx, %rcx
	movl	$cblock_human_name_cmp, %edx
	movq	%rax, %rdi
	call	rb_insert_node
	.loc 3 498 0
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	movq	-8(%rbp), %rdx
	leaq	112(%rdx), %rsi
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rdx
	leaq	96(%rdx), %rdi
	movq	%rax, %rcx
	movl	$cblock_start_cmp, %edx
	call	rb_insert_node
	.loc 3 499 0
	movq	-8(%rbp), %rax
	movl	12(%rax), %eax
	leal	-1(%rax), %edi
	movq	-8(%rbp), %rax
	movl	8(%rax), %esi
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %ecx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	subq	$8, %rsp
	pushq	%rdi
	movl	%esi, %r9d
	movl	%ecx, %r8d
	movq	%rdx, %rcx
	movl	%eax, %edx
	movl	$.LC34, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	kplog
	addq	$16, %rsp
	.loc 3 500 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE44:
	.size	cblock_split, .-cblock_split
	.globl	cblocks_init
	.type	cblocks_init, @function
cblocks_init:
.LFB45:
	.loc 3 503 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	.loc 3 503 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 507 0
	movq	-56(%rbp), %rax
	addq	$80, %rax
	movq	%rax, %rdi
	call	rb_init
	.loc 3 508 0
	movq	-56(%rbp), %rax
	addq	$88, %rax
	movq	%rax, %rdi
	call	rb_init
	.loc 3 509 0
	movq	-56(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rdi
	call	rb_init
	.loc 3 510 0
	leaq	-32(%rbp), %rax
	movl	$0, %edx
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	kpstrset
	.loc 3 511 0
	movl	$1, -36(%rbp)
	jmp	.L177
.L184:
	.loc 3 512 0
	movl	-36(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L178
	.loc 3 513 0
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	.loc 3 514 0
	jmp	.L177
.L178:
	.loc 3 516 0
	movl	-36(%rbp), %ecx
	leaq	-32(%rbp), %rdx
	movq	-56(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	is_function_start
	testl	%eax, %eax
	je	.L179
	.loc 3 517 0
	leaq	-32(%rbp), %rdx
	leaq	-36(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	init_func_block
	jmp	.L177
.L179:
	.loc 3 518 0
	movl	-36(%rbp), %esi
	leaq	-32(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %r8
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rdi
	call	is_variable_start
	testl	%eax, %eax
	je	.L180
	.loc 3 519 0
	leaq	-32(%rbp), %rdx
	leaq	-36(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	init_var_block
	jmp	.L177
.L180:
	.loc 3 520 0
	movl	-36(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	cmpl	$41, %eax
	jne	.L181
	.loc 3 521 0
	leaq	-32(%rbp), %rdx
	leaq	-36(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	init_set_block
	jmp	.L177
.L181:
	.loc 3 522 0
	movl	-36(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	cmpl	$4, %eax
	je	.L182
	.loc 3 522 0 is_stmt 0 discriminator 1
	movl	-36(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	cmpl	$10, %eax
	jne	.L183
.L182:
	.loc 3 524 0 is_stmt 1
	leaq	-36(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	init_attr_block
	jmp	.L177
.L183:
	.loc 3 526 0
	leaq	-36(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	init_other_block
.L177:
	.loc 3 511 0 discriminator 1
	movq	-56(%rbp), %rax
	movl	40(%rax), %edx
	movl	-36(%rbp), %eax
	cmpl	%eax, %edx
	jg	.L184
	.loc 3 528 0
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L185
	call	__stack_chk_fail
.L185:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE45:
	.size	cblocks_init, .-cblocks_init
	.section	.rodata
.LC35:
	.string	"%-64s            %s"
	.text
	.globl	cblock_print2
	.type	cblock_print2, @function
cblock_print2:
.LFB46:
	.loc 3 531 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 3 534 0
	movq	-40(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -24(%rbp)
	movq	-48(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -20(%rbp)
	jmp	.L187
.L192:
	.loc 3 537 0
	movq	-48(%rbp), %rax
	movl	12(%rax), %eax
	.loc 3 535 0
	cmpl	-20(%rbp), %eax
	jle	.L188
	.loc 3 537 0 discriminator 1
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	.loc 3 535 0 discriminator 1
	movl	-20(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movq	%rax, %rbx
	jmp	.L189
.L188:
	.loc 3 535 0 is_stmt 0 discriminator 2
	movl	$.LC0, %ebx
.L189:
	.loc 3 536 0 is_stmt 1 discriminator 4
	movq	-40(%rbp), %rax
	movl	12(%rax), %eax
	.loc 3 535 0 discriminator 4
	cmpl	-24(%rbp), %eax
	jle	.L190
	.loc 3 536 0 discriminator 5
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	.loc 3 535 0 discriminator 5
	movl	-24(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	jmp	.L191
.L190:
	.loc 3 535 0 is_stmt 0 discriminator 6
	movl	$.LC0, %eax
.L191:
	.loc 3 535 0 discriminator 8
	movq	%rbx, %rcx
	movq	%rax, %rdx
	movl	$.LC35, %esi
	movl	$3, %edi
	movl	$0, %eax
	call	kplog
	.loc 3 534 0 is_stmt 1 discriminator 8
	addl	$1, -24(%rbp)
	addl	$1, -20(%rbp)
.L187:
	.loc 3 534 0 is_stmt 0 discriminator 2
	movq	-40(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	-24(%rbp), %eax
	jg	.L192
	.loc 3 534 0 discriminator 3
	movq	-48(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	-20(%rbp), %eax
	jg	.L192
	.loc 3 538 0 is_stmt 1
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE46:
	.size	cblock_print2, .-cblock_print2
	.globl	cblock_first
	.type	cblock_first, @function
cblock_first:
.LFB47:
	.loc 3 541 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 3 542 0
	movq	-24(%rbp), %rax
	addq	$96, %rax
	movq	%rax, %rdi
	call	rb_first
	movq	%rax, -16(%rbp)
	.loc 3 543 0
	cmpq	$0, -16(%rbp)
	jne	.L194
	.loc 3 544 0
	movl	$0, %eax
	jmp	.L195
.L194:
.LBB9:
	.loc 3 545 0
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	$112, %rax
.LBE9:
	nop
.L195:
	.loc 3 546 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE47:
	.size	cblock_first, .-cblock_first
	.globl	cblock_next
	.type	cblock_next, @function
cblock_next:
.LFB48:
	.loc 3 549 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 3 550 0
	movq	-24(%rbp), %rax
	addq	$112, %rax
	movq	%rax, %rdi
	call	rb_next
	movq	%rax, -16(%rbp)
	.loc 3 551 0
	cmpq	$0, -16(%rbp)
	jne	.L197
	.loc 3 552 0
	movl	$0, %eax
	jmp	.L198
.L197:
.LBB10:
	.loc 3 553 0
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	$112, %rax
.LBE10:
	nop
.L198:
	.loc 3 554 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE48:
	.size	cblock_next, .-cblock_next
	.globl	cblock_skip
	.type	cblock_skip, @function
cblock_skip:
.LFB49:
	.loc 3 557 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	.loc 3 558 0
	jmp	.L200
.L202:
	.loc 3 559 0
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	cblock_next
	movq	%rax, -8(%rbp)
.L200:
	.loc 3 558 0
	cmpq	$0, -8(%rbp)
	je	.L201
	.loc 3 558 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	movzbl	49(%rax), %eax
	movsbl	%al, %eax
	cmpl	-12(%rbp), %eax
	jne	.L202
.L201:
	.loc 3 560 0 is_stmt 1
	movq	-8(%rbp), %rax
	.loc 3 561 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE49:
	.size	cblock_skip, .-cblock_skip
	.section	.rodata
.LC36:
	.string	".init.data"
.LC37:
	.string	".init.text"
.LC38:
	.string	".exit.text"
.LC39:
	.string	".text.unlikely"
.LC40:
	.string	".text.hot"
.LC41:
	.string	".fixup"
.LC42:
	.string	".kpatch.fixup,\"ax\",@progbits"
.LC43:
	.string	".modinfo"
.LC44:
	.string	"__ex_table"
	.align 8
.LC45:
	.string	".kpatch.__ex_table,\"a\",@progbits"
.LC46:
	.string	"__bug_table"
.LC47:
	.string	".kpatch.__bug_table,\"a\""
.LC48:
	.string	".altinstructions"
.LC49:
	.string	".kpatch.altinstructions,\"a\""
.LC50:
	.string	".altinstr_replacement"
	.align 8
.LC51:
	.string	".kpatch.altinstr_replacement, \"ax\""
.LC52:
	.string	".smp_locks"
.LC53:
	.string	".kpatch.smp_locks,\"a\""
.LC54:
	.string	".parainstructions"
.LC55:
	.string	".kpatch.parainstructions,\"a\""
.LC56:
	.string	".kpatch.text"
.LC57:
	.string	".kpatch.init.pre"
	.align 8
.LC58:
	.string	".kpatch.init.pre,\"aw\",@progbits"
.LC59:
	.string	".kpatch.init"
.LC60:
	.string	".kpatch.init,\"aw\",@progbits"
.LC61:
	.string	".kpatch.init.post"
	.align 8
.LC62:
	.string	".kpatch.init.post,\"aw\",@progbits"
.LC63:
	.string	".kpatch.exit.pre"
	.align 8
.LC64:
	.string	".kpatch.exit.pre,\"aw\",@progbits"
.LC65:
	.string	".kpatch.exit"
.LC66:
	.string	".kpatch.exit,\"aw\",@progbits"
.LC67:
	.string	".kpatch.exit.post"
	.align 8
.LC68:
	.string	".kpatch.exit.post,\"aw\",@progbits"
.LC69:
	.string	".discard"
.LC70:
	.string	".discard,\"awx\",@progbits"
	.data
	.align 32
	.type	predefined_sections, @object
	.size	predefined_sections, 1400
predefined_sections:
	.quad	.LC10
	.zero	48
	.quad	.LC9
	.zero	48
	.quad	.LC36
	.zero	48
	.quad	.LC8
	.zero	8
	.long	268435456
	.zero	36
	.quad	.LC37
	.zero	8
	.long	268435456
	.zero	36
	.quad	.LC38
	.zero	8
	.long	268435456
	.zero	36
	.quad	.LC39
	.zero	8
	.long	268435456
	.zero	36
	.quad	.LC40
	.zero	8
	.long	268435456
	.zero	36
	.quad	.LC41
	.quad	.LC42
	.long	268435456
	.zero	36
	.quad	.LC43
	.zero	48
	.quad	.LC44
	.quad	.LC45
	.zero	40
	.quad	.LC46
	.quad	.LC47
	.zero	40
	.quad	.LC48
	.quad	.LC49
	.zero	40
	.quad	.LC50
	.quad	.LC51
	.long	268435456
	.zero	36
	.quad	.LC52
	.quad	.LC53
	.zero	40
	.quad	.LC54
	.quad	.LC55
	.zero	40
	.quad	.LC56
	.zero	8
	.long	268435456
	.zero	36
	.quad	.LC57
	.quad	.LC58
	.zero	40
	.quad	.LC59
	.quad	.LC60
	.zero	40
	.quad	.LC61
	.quad	.LC62
	.zero	40
	.quad	.LC63
	.quad	.LC64
	.zero	40
	.quad	.LC65
	.quad	.LC66
	.zero	40
	.quad	.LC67
	.quad	.LC68
	.zero	40
	.quad	.LC69
	.quad	.LC70
	.long	268435456
	.zero	36
	.quad	0
	.zero	48
	.local	sections_rbroot_byname
	.comm	sections_rbroot_byname,8,8
	.text
	.type	section_name_cmp, @function
section_name_cmp:
.LFB50:
	.loc 3 602 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
.LBB11:
	.loc 3 603 0
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	subq	$24, %rax
.LBE11:
	movq	%rax, -16(%rbp)
	.loc 3 604 0
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 3 606 0
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	.loc 3 607 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE50:
	.size	section_name_cmp, .-section_name_cmp
	.globl	find_section
	.type	find_section, @function
find_section:
.LFB51:
	.loc 3 610 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 3 614 0
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movl	$section_name_cmp, %esi
	movl	$sections_rbroot_byname, %edi
	call	rb_search_node
	movq	%rax, -24(%rbp)
	.loc 3 615 0
	cmpq	$0, -24(%rbp)
	jne	.L207
	.loc 3 616 0
	movl	$0, %eax
	jmp	.L208
.L207:
.LBB12:
	.loc 3 618 0
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	subq	$24, %rax
.LBE12:
	movq	%rax, -8(%rbp)
	.loc 3 619 0
	movq	-8(%rbp), %rax
.L208:
	.loc 3 620 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE51:
	.size	find_section, .-find_section
	.type	dup_section, @function
dup_section:
.LFB52:
	.loc 3 623 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 3 624 0
	movl	$56, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	.loc 3 625 0
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, (%rax)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%rax)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%rax)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%rax)
	movq	32(%rdx), %rcx
	movq	%rcx, 32(%rax)
	movq	40(%rdx), %rcx
	movq	%rcx, 40(%rax)
	movq	48(%rdx), %rdx
	movq	%rdx, 48(%rax)
	.loc 3 626 0
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	.loc 3 627 0
	movq	-8(%rbp), %rax
	addq	$24, %rax
	movl	$24, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	.loc 3 628 0
	movq	-8(%rbp), %rax
	.loc 3 629 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE52:
	.size	dup_section, .-dup_section
	.globl	csect
	.type	csect, @function
csect:
.LFB53:
	.loc 3 632 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	.loc 3 635 0
	cmpl	$0, -28(%rbp)
	js	.L212
	.loc 3 635 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax
	movl	40(%rax), %eax
	cmpl	-28(%rbp), %eax
	jg	.L213
.L212:
	.loc 3 636 0 is_stmt 1
	movl	$0, %eax
	jmp	.L214
.L213:
	.loc 3 638 0
	movq	-24(%rbp), %rax
	movq	72(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 3 639 0
	movq	-8(%rbp), %rax
.L214:
	.loc 3 640 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE53:
	.size	csect, .-csect
	.globl	is_data_sect
	.type	is_data_sect, @function
is_data_sect:
.LFB54:
	.loc 3 643 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 3 644 0
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	andl	$268435456, %eax
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	.loc 3 645 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE54:
	.size	is_data_sect, .-is_data_sect
	.globl	is_code_sect
	.type	is_code_sect, @function
is_code_sect:
.LFB55:
	.loc 3 648 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 3 649 0
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	andl	$268435456, %eax
	.loc 3 650 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE55:
	.size	is_code_sect, .-is_code_sect
	.section	.rodata
.LC71:
	.string	" \t,\n;"
.LC72:
	.string	"x\""
	.text
	.type	__parse_section, @function
__parse_section:
.LFB56:
	.loc 3 653 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	.loc 3 653 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 657 0
	movq	$.LC71, -64(%rbp)
	.loc 3 659 0
	leaq	-32(%rbp), %rdx
	leaq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 660 0
	movq	-64(%rbp), %rdx
	leaq	-32(%rbp), %rcx
	leaq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	__get_token
	.loc 3 663 0
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$34, %al
	jne	.L220
	.loc 3 663 0 is_stmt 0 discriminator 1
	movq	-32(%rbp), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	subq	$1, %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$34, %al
	jne	.L220
	.loc 3 664 0 is_stmt 1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
	.loc 3 665 0
	movl	-24(%rbp), %eax
	subl	$2, %eax
	movl	%eax, -24(%rbp)
.L220:
	.loc 3 667 0
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strndup
	movq	%rax, -56(%rbp)
	.loc 3 668 0
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	find_section
	movq	%rax, -48(%rbp)
	.loc 3 669 0
	cmpq	$0, -48(%rbp)
	je	.L221
	.loc 3 670 0
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free
	.loc 3 671 0
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	dup_section
	jmp	.L225
.L221:
	.loc 3 674 0
	movl	$56, %edi
	call	malloc
	movq	%rax, -48(%rbp)
	.loc 3 675 0
	movq	-48(%rbp), %rax
	movl	$56, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	.loc 3 676 0
	movq	-48(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 3 678 0
	movq	-72(%rbp), %rax
	testq	%rax, %rax
	je	.L223
	.loc 3 679 0
	leaq	-32(%rbp), %rdx
	leaq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 680 0
	leaq	-32(%rbp), %rax
	movl	$.LC23, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	testl	%eax, %eax
	jne	.L227
	.loc 3 682 0
	leaq	-32(%rbp), %rdx
	leaq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 683 0
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$34, %al
	jne	.L223
.LBB13:
	.loc 3 684 0
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movl	$.LC72, %esi
	movq	%rax, %rdi
	call	strpbrk
	movq	%rax, -40(%rbp)
	.loc 3 685 0
	cmpq	$0, -40(%rbp)
	je	.L223
	.loc 3 685 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$120, %al
	jne	.L223
	.loc 3 686 0 is_stmt 1
	movq	-48(%rbp), %rax
	movl	16(%rax), %eax
	orl	$268435456, %eax
	movl	%eax, %edx
	movq	-48(%rbp), %rax
	movl	%edx, 16(%rax)
	jmp	.L223
.L227:
.LBE13:
	.loc 3 681 0
	nop
.L223:
	.loc 3 690 0
	movq	-56(%rbp), %rax
	movq	-48(%rbp), %rdx
	leaq	24(%rdx), %rsi
	movq	%rax, %rcx
	movl	$section_name_cmp, %edx
	movl	$sections_rbroot_byname, %edi
	call	rb_insert_node
	.loc 3 691 0
	movq	-48(%rbp), %rax
.L225:
	.loc 3 692 0 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L226
	.loc 3 692 0 is_stmt 0
	call	__stack_chk_fail
.L226:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE56:
	.size	__parse_section, .-__parse_section
	.type	parse_section, @function
parse_section:
.LFB57:
	.loc 3 695 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	.loc 3 697 0
	movq	-40(%rbp), %rax
	movq	72(%rax), %rax
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 3 699 0
	movl	-44(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	movl	%eax, -20(%rbp)
	.loc 3 700 0
	movl	-20(%rbp), %eax
	subl	$20, %eax
	cmpl	$14, %eax
	ja	.L229
	movl	%eax, %eax
	movq	.L231(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L231:
	.quad	.L230
	.quad	.L232
	.quad	.L233
	.quad	.L229
	.quad	.L229
	.quad	.L229
	.quad	.L229
	.quad	.L229
	.quad	.L229
	.quad	.L229
	.quad	.L234
	.quad	.L234
	.quad	.L235
	.quad	.L236
	.quad	.L235
	.text
.L230:
	.loc 3 701 0
	movl	$.LC8, %edi
	call	find_section
	movq	%rax, %rdi
	call	dup_section
	jmp	.L237
.L232:
	.loc 3 702 0
	movl	$.LC9, %edi
	call	find_section
	movq	%rax, %rdi
	call	dup_section
	jmp	.L237
.L233:
	.loc 3 703 0
	movl	$.LC10, %edi
	call	find_section
	movq	%rax, %rdi
	call	dup_section
	jmp	.L237
.L234:
	.loc 3 706 0
	movl	-44(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movq	%rax, %rdi
	call	__parse_section
	jmp	.L237
.L235:
	.loc 3 709 0
	movq	-16(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, %rdi
	call	dup_section
	jmp	.L237
.L236:
	.loc 3 711 0
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	dup_section
	movq	%rax, -8(%rbp)
	.loc 3 712 0
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 48(%rax)
	.loc 3 713 0
	movq	-8(%rbp), %rax
	jmp	.L237
.L229:
	.loc 3 715 0
	movl	$0, %eax
.L237:
	.loc 3 716 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE57:
	.size	parse_section, .-parse_section
	.globl	init_sections
	.type	init_sections, @function
init_sections:
.LFB58:
	.loc 3 719 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	.loc 3 723 0
	movq	sections_rbroot_byname(%rip), %rax
	testq	%rax, %rax
	jne	.L239
	.loc 3 724 0
	movl	$0, -28(%rbp)
	jmp	.L240
.L241:
	.loc 3 725 0 discriminator 3
	movl	-28(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	0(,%rax,8), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	addq	$predefined_sections, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	movl	-28(%rbp), %eax
	cltq
	movq	%rax, %rdx
	leaq	0(,%rdx,8), %rax
	movq	%rax, %rdx
	leaq	0(,%rdx,8), %rax
	subq	%rdx, %rax
	addq	$16, %rax
	addq	$predefined_sections, %rax
	addq	$8, %rax
	movl	$section_name_cmp, %edx
	movq	%rax, %rsi
	movl	$sections_rbroot_byname, %edi
	call	rb_insert_node
	.loc 3 724 0 discriminator 3
	addl	$1, -28(%rbp)
.L240:
	.loc 3 724 0 is_stmt 0 discriminator 1
	movl	-28(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	0(,%rax,8), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	addq	$predefined_sections, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L241
.L239:
	.loc 3 727 0 is_stmt 1
	movq	-40(%rbp), %rax
	movl	40(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 72(%rax)
	.loc 3 728 0
	movq	-40(%rbp), %rax
	movq	72(%rax), %rbx
	movl	$.LC8, %edi
	call	find_section
	movq	%rax, (%rbx)
	.loc 3 729 0
	movl	$1, -28(%rbp)
	jmp	.L242
.L245:
	.loc 3 730 0
	movl	-28(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	parse_section
	movq	%rax, -24(%rbp)
	.loc 3 731 0
	cmpq	$0, -24(%rbp)
	je	.L243
	.loc 3 732 0
	movq	-40(%rbp), %rax
	movq	72(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	subq	$8, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 48(%rax)
	.loc 3 733 0
	movq	-40(%rbp), %rax
	movq	72(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, (%rdx)
	jmp	.L244
.L243:
	.loc 3 735 0
	movq	-40(%rbp), %rax
	movq	72(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	72(%rax), %rax
	movl	-28(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	subq	$8, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, (%rdx)
.L244:
	.loc 3 729 0 discriminator 2
	addl	$1, -28(%rbp)
.L242:
	.loc 3 729 0 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	movl	40(%rax), %eax
	cmpl	-28(%rbp), %eax
	jg	.L245
	.loc 3 738 0 is_stmt 1
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE58:
	.size	init_sections, .-init_sections
	.section	.rodata
.LC73:
	.string	"@function"
	.text
	.globl	is_function_start
	.type	is_function_start, @function
is_function_start:
.LFB59:
	.loc 3 743 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movl	%esi, -76(%rbp)
	movq	%rdx, -88(%rbp)
	.loc 3 743 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 746 0
	movl	-76(%rbp), %eax
	movl	%eax, -60(%rbp)
	movl	$0, -64(%rbp)
	.loc 3 748 0
	movq	-88(%rbp), %rax
	movl	$0, %edx
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	kpstrset
	.loc 3 749 0
	jmp	.L247
.L261:
	.loc 3 750 0
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	is_sect_cmd
	testl	%eax, %eax
	je	.L248
	.loc 3 750 0 is_stmt 0 discriminator 1
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	csect
	movq	%rax, %rdi
	call	is_code_sect
	testl	%eax, %eax
	jne	.L264
.L248:
	.loc 3 751 0 is_stmt 1 discriminator 3
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	.loc 3 750 0 discriminator 3
	cmpl	$1, %eax
	je	.L264
	.loc 3 753 0
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movq	%rax, %rcx
	leaq	-32(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	get_type_args
	.loc 3 754 0
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	cmpl	$4, %eax
	jne	.L252
	.loc 3 754 0 is_stmt 0 discriminator 1
	movl	-60(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jne	.L253
.L252:
	.loc 3 755 0 is_stmt 1 discriminator 3
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	.loc 3 754 0 discriminator 3
	cmpl	$10, %eax
	je	.L253
	.loc 3 755 0
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	cmpl	$12, %eax
	je	.L253
	.loc 3 756 0 discriminator 1
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	.loc 3 755 0 discriminator 1
	cmpl	$13, %eax
	je	.L253
	.loc 3 756 0
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	cmpl	$14, %eax
	je	.L253
	.loc 3 757 0 discriminator 1
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	.loc 3 756 0 discriminator 1
	cmpl	$2, %eax
	jne	.L265
	.loc 3 757 0
	leaq	-32(%rbp), %rax
	movl	$.LC73, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	testl	%eax, %eax
	jne	.L265
.L253:
	.loc 3 758 0
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movq	%rax, -56(%rbp)
	.loc 3 759 0
	leaq	-48(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 760 0
	leaq	-48(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 761 0
	movq	-88(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	je	.L255
	.loc 3 761 0 is_stmt 0 discriminator 1
	leaq	-48(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	kpstrcmp
	testl	%eax, %eax
	je	.L255
	.loc 3 762 0 is_stmt 1
	movl	$0, %eax
	jmp	.L262
.L255:
	.loc 3 763 0
	movq	-88(%rbp), %rcx
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	.loc 3 764 0
	cmpl	$0, -64(%rbp)
	jne	.L257
	.loc 3 764 0 is_stmt 0 discriminator 2
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	cmpl	$2, %eax
	jne	.L258
.L257:
	.loc 3 764 0 discriminator 3
	movl	$1, %eax
	jmp	.L259
.L258:
	.loc 3 764 0 discriminator 4
	movl	$0, %eax
.L259:
	.loc 3 764 0 discriminator 6
	movl	%eax, -64(%rbp)
	.loc 3 765 0 is_stmt 1 discriminator 6
	jmp	.L251
.L264:
	.loc 3 752 0
	nop
.L251:
	.loc 3 749 0
	addl	$1, -76(%rbp)
.L247:
	.loc 3 749 0 is_stmt 0 discriminator 1
	movq	-72(%rbp), %rax
	movl	40(%rax), %eax
	cmpl	-76(%rbp), %eax
	jg	.L261
	jmp	.L260
.L265:
	.loc 3 767 0 is_stmt 1
	nop
.L260:
	.loc 3 769 0
	movl	-64(%rbp), %eax
.L262:
	.loc 3 770 0 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L263
	.loc 3 770 0 is_stmt 0
	call	__stack_chk_fail
.L263:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE59:
	.size	is_function_start, .-is_function_start
	.globl	is_function_end
	.type	is_function_end, @function
is_function_end:
.LFB60:
	.loc 3 773 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movq	%rdx, -72(%rbp)
	.loc 3 773 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 775 0
	movl	-60(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	cmpl	$5, %eax
	je	.L267
	.loc 3 776 0
	movl	$0, %eax
	jmp	.L270
.L267:
	.loc 3 779 0
	movl	-60(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movq	%rax, -40(%rbp)
	.loc 3 780 0
	leaq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 781 0
	leaq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 782 0
	leaq	-32(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	kpstrcmp
	testl	%eax, %eax
	je	.L269
	.loc 3 783 0
	movl	$0, %eax
	jmp	.L270
.L269:
	.loc 3 785 0
	movl	$1, %eax
.L270:
	.loc 3 786 0 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L271
	.loc 3 786 0 is_stmt 0
	call	__stack_chk_fail
.L271:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE60:
	.size	is_function_end, .-is_function_end
	.section	.rodata
.LC74:
	.string	"@object"
	.text
	.globl	is_variable_start
	.type	is_variable_start, @function
is_variable_start:
.LFB61:
	.loc 3 789 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -72(%rbp)
	movl	%esi, -76(%rbp)
	movq	%rdx, -88(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%r8, -104(%rbp)
	.loc 3 789 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 791 0
	movl	-76(%rbp), %eax
	movl	%eax, -60(%rbp)
	movl	$0, -64(%rbp)
	.loc 3 794 0
	movq	-104(%rbp), %rax
	movl	$0, %edx
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	kpstrset
	.loc 3 795 0
	jmp	.L273
.L294:
	.loc 3 798 0
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movq	%rax, -56(%rbp)
	.loc 3 799 0
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	cmpl	$6, %eax
	je	.L275
	cmpl	$6, %eax
	jg	.L276
	cmpl	$2, %eax
	je	.L277
	jmp	.L274
.L276:
	subl	$10, %eax
	cmpl	$1, %eax
	ja	.L274
.L277:
	.loc 3 803 0
	leaq	-48(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
.L275:
	.loc 3 805 0
	leaq	-48(%rbp), %rdx
	leaq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 806 0
	movq	-104(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	je	.L278
	.loc 3 806 0 is_stmt 0 discriminator 1
	leaq	-48(%rbp), %rdx
	movq	-104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	kpstrcmp
	testl	%eax, %eax
	je	.L278
	.loc 3 807 0 is_stmt 1
	movl	$0, %eax
	jmp	.L295
.L278:
	.loc 3 808 0
	movq	-104(%rbp), %rcx
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rax, (%rcx)
	movq	%rdx, 8(%rcx)
	.loc 3 809 0
	nop
.L274:
	.loc 3 812 0
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	ctype
	cmpl	$34, %eax
	ja	.L280
	movl	%eax, %eax
	movq	.L282(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L282:
	.quad	.L280
	.quad	.L297
	.quad	.L283
	.quad	.L280
	.quad	.L280
	.quad	.L284
	.quad	.L285
	.quad	.L280
	.quad	.L280
	.quad	.L280
	.quad	.L286
	.quad	.L287
	.quad	.L280
	.quad	.L280
	.quad	.L280
	.quad	.L280
	.quad	.L280
	.quad	.L280
	.quad	.L280
	.quad	.L280
	.quad	.L297
	.quad	.L297
	.quad	.L297
	.quad	.L280
	.quad	.L280
	.quad	.L280
	.quad	.L280
	.quad	.L280
	.quad	.L280
	.quad	.L280
	.quad	.L297
	.quad	.L297
	.quad	.L297
	.quad	.L297
	.quad	.L297
	.text
.L283:
	.loc 3 823 0
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	movq	%rax, %rcx
	leaq	-32(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	get_type_args
	.loc 3 824 0
	leaq	-32(%rbp), %rax
	movl	$.LC74, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	testl	%eax, %eax
	je	.L298
	.loc 3 825 0
	movl	$0, %eax
	jmp	.L295
.L286:
	.loc 3 828 0
	movl	$1, -64(%rbp)
	.loc 3 829 0
	jmp	.L289
.L284:
	.loc 3 834 0
	movl	-60(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jne	.L299
	.loc 3 835 0
	movl	$0, %eax
	jmp	.L295
.L285:
	.loc 3 838 0
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	csect
	movq	%rax, %rdi
	call	is_data_sect
	testl	%eax, %eax
	jne	.L287
	.loc 3 839 0
	movl	$0, %eax
	jmp	.L295
.L287:
	.loc 3 842 0
	cmpq	$0, -88(%rbp)
	je	.L292
	.loc 3 843 0
	movl	-76(%rbp), %eax
	leal	1(%rax), %edx
	movq	-88(%rbp), %rax
	movl	%edx, (%rax)
.L292:
	.loc 3 844 0
	cmpq	$0, -96(%rbp)
	je	.L293
	.loc 3 845 0
	movq	-96(%rbp), %rax
	movl	-64(%rbp), %edx
	movl	%edx, (%rax)
.L293:
	.loc 3 846 0
	movl	$1, %eax
	jmp	.L295
.L280:
	.loc 3 848 0
	movl	$0, %eax
	jmp	.L295
.L297:
	.loc 3 831 0
	nop
	jmp	.L289
.L298:
	.loc 3 826 0
	nop
	jmp	.L289
.L299:
	.loc 3 836 0
	nop
.L289:
	.loc 3 795 0
	addl	$1, -76(%rbp)
.L273:
	.loc 3 795 0 is_stmt 0 discriminator 1
	movl	-76(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cline
	testq	%rax, %rax
	jne	.L294
	.loc 3 851 0 is_stmt 1
	movl	$0, %eax
.L295:
	.loc 3 852 0 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L296
	.loc 3 852 0 is_stmt 0
	call	__stack_chk_fail
.L296:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE61:
	.size	is_variable_start, .-is_variable_start
	.section	.rodata
.LC75:
	.string	".ascii"
.LC76:
	.string	".asciz"
.LC77:
	.string	".string"
.LC78:
	.string	".byte"
.LC79:
	.string	".word"
.LC80:
	.string	".short"
.LC81:
	.string	".int"
.LC82:
	.string	".long"
.LC83:
	.string	".quad"
.LC84:
	.string	".double"
.LC85:
	.string	".float"
.LC86:
	.string	".single"
.LC87:
	.string	".value"
.LC88:
	.string	".zero"
.LC89:
	.string	".uleb128"
.LC90:
	.string	".sleb128"
.LC91:
	.string	".4byte"
	.text
	.globl	is_data_def
	.type	is_data_def, @function
is_data_def:
.LFB62:
	.loc 3 855 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	.loc 3 855 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 858 0
	leaq	-32(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	get_token
	.loc 3 861 0
	leaq	-32(%rbp), %rax
	movl	$.LC75, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 859 0
	testl	%eax, %eax
	je	.L301
	.loc 3 862 0
	leaq	-32(%rbp), %rax
	movl	$.LC76, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 861 0
	testl	%eax, %eax
	je	.L301
	.loc 3 863 0
	leaq	-32(%rbp), %rax
	movl	$.LC77, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 862 0
	testl	%eax, %eax
	je	.L301
	.loc 3 865 0
	leaq	-32(%rbp), %rax
	movl	$.LC78, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 863 0
	testl	%eax, %eax
	je	.L301
	.loc 3 866 0
	leaq	-32(%rbp), %rax
	movl	$.LC79, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 865 0
	testl	%eax, %eax
	je	.L301
	.loc 3 867 0
	leaq	-32(%rbp), %rax
	movl	$.LC80, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 866 0
	testl	%eax, %eax
	je	.L301
	.loc 3 868 0
	leaq	-32(%rbp), %rax
	movl	$.LC81, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 867 0
	testl	%eax, %eax
	je	.L301
	.loc 3 869 0
	leaq	-32(%rbp), %rax
	movl	$.LC82, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 868 0
	testl	%eax, %eax
	je	.L301
	.loc 3 870 0
	leaq	-32(%rbp), %rax
	movl	$.LC83, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 869 0
	testl	%eax, %eax
	je	.L301
	.loc 3 872 0
	leaq	-32(%rbp), %rax
	movl	$.LC84, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 870 0
	testl	%eax, %eax
	je	.L301
	.loc 3 873 0
	leaq	-32(%rbp), %rax
	movl	$.LC85, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 872 0
	testl	%eax, %eax
	je	.L301
	.loc 3 874 0
	leaq	-32(%rbp), %rax
	movl	$.LC86, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 873 0
	testl	%eax, %eax
	je	.L301
	.loc 3 876 0
	leaq	-32(%rbp), %rax
	movl	$.LC87, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 874 0
	testl	%eax, %eax
	je	.L301
	.loc 3 877 0
	leaq	-32(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 876 0
	testl	%eax, %eax
	je	.L301
	.loc 3 878 0
	leaq	-32(%rbp), %rax
	movl	$.LC88, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 877 0
	testl	%eax, %eax
	je	.L301
	.loc 3 880 0
	leaq	-32(%rbp), %rax
	movl	$.LC89, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 878 0
	testl	%eax, %eax
	je	.L301
	.loc 3 881 0
	leaq	-32(%rbp), %rax
	movl	$.LC90, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 880 0
	testl	%eax, %eax
	je	.L301
	.loc 3 882 0
	leaq	-32(%rbp), %rax
	movl	$.LC91, %esi
	movq	%rax, %rdi
	call	kpstrcmpz
	.loc 3 881 0
	testl	%eax, %eax
	jne	.L302
.L301:
	.loc 3 884 0
	movl	$1, %eax
	jmp	.L304
.L302:
	.loc 3 885 0
	movl	$0, %eax
.L304:
	.loc 3 886 0 discriminator 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L305
	.loc 3 886 0 is_stmt 0
	call	__stack_chk_fail
.L305:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE62:
	.size	is_data_def, .-is_data_def
.Letext0:
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/libio.h"
	.file 8 "kpatch_io.h"
	.file 9 "kpatch_parse.h"
	.file 10 "/usr/include/ctype.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1a54
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF180
	.byte	0xc
	.long	.LASF181
	.long	.LASF182
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x4
	.byte	0xd8
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x5
	.byte	0x83
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x5
	.byte	0x84
	.long	0x69
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x6
	.byte	0x30
	.long	0xa7
	.uleb128 0x7
	.long	.LASF42
	.byte	0xd8
	.byte	0x7
	.byte	0xf1
	.long	0x224
	.uleb128 0x8
	.long	.LASF13
	.byte	0x7
	.byte	0xf2
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x7
	.byte	0xf7
	.long	0x8f
	.byte	0x8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x7
	.byte	0xf8
	.long	0x8f
	.byte	0x10
	.uleb128 0x8
	.long	.LASF16
	.byte	0x7
	.byte	0xf9
	.long	0x8f
	.byte	0x18
	.uleb128 0x8
	.long	.LASF17
	.byte	0x7
	.byte	0xfa
	.long	0x8f
	.byte	0x20
	.uleb128 0x8
	.long	.LASF18
	.byte	0x7
	.byte	0xfb
	.long	0x8f
	.byte	0x28
	.uleb128 0x8
	.long	.LASF19
	.byte	0x7
	.byte	0xfc
	.long	0x8f
	.byte	0x30
	.uleb128 0x8
	.long	.LASF20
	.byte	0x7
	.byte	0xfd
	.long	0x8f
	.byte	0x38
	.uleb128 0x8
	.long	.LASF21
	.byte	0x7
	.byte	0xfe
	.long	0x8f
	.byte	0x40
	.uleb128 0x9
	.long	.LASF22
	.byte	0x7
	.value	0x100
	.long	0x8f
	.byte	0x48
	.uleb128 0x9
	.long	.LASF23
	.byte	0x7
	.value	0x101
	.long	0x8f
	.byte	0x50
	.uleb128 0x9
	.long	.LASF24
	.byte	0x7
	.value	0x102
	.long	0x8f
	.byte	0x58
	.uleb128 0x9
	.long	.LASF25
	.byte	0x7
	.value	0x104
	.long	0x25c
	.byte	0x60
	.uleb128 0x9
	.long	.LASF26
	.byte	0x7
	.value	0x106
	.long	0x262
	.byte	0x68
	.uleb128 0x9
	.long	.LASF27
	.byte	0x7
	.value	0x108
	.long	0x62
	.byte	0x70
	.uleb128 0x9
	.long	.LASF28
	.byte	0x7
	.value	0x10c
	.long	0x62
	.byte	0x74
	.uleb128 0x9
	.long	.LASF29
	.byte	0x7
	.value	0x10e
	.long	0x70
	.byte	0x78
	.uleb128 0x9
	.long	.LASF30
	.byte	0x7
	.value	0x112
	.long	0x46
	.byte	0x80
	.uleb128 0x9
	.long	.LASF31
	.byte	0x7
	.value	0x113
	.long	0x54
	.byte	0x82
	.uleb128 0x9
	.long	.LASF32
	.byte	0x7
	.value	0x114
	.long	0x268
	.byte	0x83
	.uleb128 0x9
	.long	.LASF33
	.byte	0x7
	.value	0x118
	.long	0x278
	.byte	0x88
	.uleb128 0x9
	.long	.LASF34
	.byte	0x7
	.value	0x121
	.long	0x7b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF35
	.byte	0x7
	.value	0x129
	.long	0x8d
	.byte	0x98
	.uleb128 0x9
	.long	.LASF36
	.byte	0x7
	.value	0x12a
	.long	0x8d
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x7
	.value	0x12b
	.long	0x8d
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x7
	.value	0x12c
	.long	0x8d
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x7
	.value	0x12e
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x7
	.value	0x12f
	.long	0x62
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x7
	.value	0x131
	.long	0x27e
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF183
	.byte	0x7
	.byte	0x96
	.uleb128 0x7
	.long	.LASF43
	.byte	0x18
	.byte	0x7
	.byte	0x9c
	.long	0x25c
	.uleb128 0x8
	.long	.LASF44
	.byte	0x7
	.byte	0x9d
	.long	0x25c
	.byte	0
	.uleb128 0x8
	.long	.LASF45
	.byte	0x7
	.byte	0x9e
	.long	0x262
	.byte	0x8
	.uleb128 0x8
	.long	.LASF46
	.byte	0x7
	.byte	0xa2
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22b
	.uleb128 0x6
	.byte	0x8
	.long	0xa7
	.uleb128 0xb
	.long	0x95
	.long	0x278
	.uleb128 0xc
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x224
	.uleb128 0xb
	.long	0x95
	.long	0x28e
	.uleb128 0xc
	.long	0x86
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x294
	.uleb128 0xd
	.long	0x95
	.uleb128 0x6
	.byte	0x8
	.long	0x62
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF48
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF49
	.uleb128 0x7
	.long	.LASF50
	.byte	0x18
	.byte	0x1
	.byte	0xa
	.long	0x2e5
	.uleb128 0x8
	.long	.LASF51
	.byte	0x1
	.byte	0xc
	.long	0x38
	.byte	0
	.uleb128 0x8
	.long	.LASF52
	.byte	0x1
	.byte	0xd
	.long	0x2e5
	.byte	0x8
	.uleb128 0x8
	.long	.LASF53
	.byte	0x1
	.byte	0xe
	.long	0x2e5
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2b4
	.uleb128 0x7
	.long	.LASF54
	.byte	0x8
	.byte	0x1
	.byte	0x11
	.long	0x304
	.uleb128 0x8
	.long	.LASF50
	.byte	0x1
	.byte	0x13
	.long	0x2e5
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	.LASF55
	.byte	0x1
	.byte	0x32
	.long	0x30f
	.uleb128 0x6
	.byte	0x8
	.long	0x315
	.uleb128 0xe
	.long	0x62
	.long	0x329
	.uleb128 0xf
	.long	0x2e5
	.uleb128 0xf
	.long	0x38
	.byte	0
	.uleb128 0x7
	.long	.LASF56
	.byte	0x70
	.byte	0x8
	.byte	0x9
	.long	0x3db
	.uleb128 0x10
	.string	"id"
	.byte	0x8
	.byte	0xa
	.long	0x62
	.byte	0
	.uleb128 0x10
	.string	"f"
	.byte	0x8
	.byte	0xc
	.long	0x3db
	.byte	0x8
	.uleb128 0x8
	.long	.LASF57
	.byte	0x8
	.byte	0xd
	.long	0x8f
	.byte	0x10
	.uleb128 0x8
	.long	.LASF58
	.byte	0x8
	.byte	0xe
	.long	0x8f
	.byte	0x18
	.uleb128 0x8
	.long	.LASF59
	.byte	0x8
	.byte	0xf
	.long	0x8f
	.byte	0x20
	.uleb128 0x8
	.long	.LASF60
	.byte	0x8
	.byte	0x10
	.long	0x62
	.byte	0x28
	.uleb128 0x8
	.long	.LASF61
	.byte	0x8
	.byte	0x11
	.long	0x3e1
	.byte	0x30
	.uleb128 0x8
	.long	.LASF62
	.byte	0x8
	.byte	0x12
	.long	0x299
	.byte	0x38
	.uleb128 0x8
	.long	.LASF63
	.byte	0x8
	.byte	0x14
	.long	0x299
	.byte	0x40
	.uleb128 0x8
	.long	.LASF64
	.byte	0x8
	.byte	0x15
	.long	0x3e7
	.byte	0x48
	.uleb128 0x8
	.long	.LASF65
	.byte	0x8
	.byte	0x17
	.long	0x2eb
	.byte	0x50
	.uleb128 0x8
	.long	.LASF66
	.byte	0x8
	.byte	0x18
	.long	0x2eb
	.byte	0x58
	.uleb128 0x8
	.long	.LASF67
	.byte	0x8
	.byte	0x19
	.long	0x2eb
	.byte	0x60
	.uleb128 0x8
	.long	.LASF68
	.byte	0x8
	.byte	0x1a
	.long	0x2eb
	.byte	0x68
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0x6
	.byte	0x8
	.long	0x8f
	.uleb128 0x6
	.byte	0x8
	.long	0x8d
	.uleb128 0x11
	.byte	0x4
	.long	0x4d
	.byte	0xa
	.byte	0x2f
	.long	0x44a
	.uleb128 0x12
	.long	.LASF69
	.value	0x100
	.uleb128 0x12
	.long	.LASF70
	.value	0x200
	.uleb128 0x12
	.long	.LASF71
	.value	0x400
	.uleb128 0x12
	.long	.LASF72
	.value	0x800
	.uleb128 0x12
	.long	.LASF73
	.value	0x1000
	.uleb128 0x12
	.long	.LASF74
	.value	0x2000
	.uleb128 0x12
	.long	.LASF75
	.value	0x4000
	.uleb128 0x12
	.long	.LASF76
	.value	0x8000
	.uleb128 0x13
	.long	.LASF77
	.byte	0x1
	.uleb128 0x13
	.long	.LASF78
	.byte	0x2
	.uleb128 0x13
	.long	.LASF79
	.byte	0x4
	.uleb128 0x13
	.long	.LASF80
	.byte	0x8
	.byte	0
	.uleb128 0x14
	.byte	0x10
	.byte	0x2
	.byte	0xb
	.long	0x467
	.uleb128 0x10
	.string	"s"
	.byte	0x2
	.byte	0xc
	.long	0x8f
	.byte	0
	.uleb128 0x10
	.string	"l"
	.byte	0x2
	.byte	0xd
	.long	0x62
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF81
	.byte	0x2
	.byte	0xe
	.long	0x44a
	.uleb128 0x7
	.long	.LASF82
	.byte	0x38
	.byte	0x9
	.byte	0x3c
	.long	0x4bb
	.uleb128 0x8
	.long	.LASF83
	.byte	0x9
	.byte	0x3d
	.long	0x8f
	.byte	0
	.uleb128 0x8
	.long	.LASF84
	.byte	0x9
	.byte	0x3e
	.long	0x8f
	.byte	0x8
	.uleb128 0x8
	.long	.LASF85
	.byte	0x9
	.byte	0x40
	.long	0x62
	.byte	0x10
	.uleb128 0x8
	.long	.LASF86
	.byte	0x9
	.byte	0x41
	.long	0x2b4
	.byte	0x18
	.uleb128 0x8
	.long	.LASF87
	.byte	0x9
	.byte	0x42
	.long	0x4bb
	.byte	0x30
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x472
	.uleb128 0x7
	.long	.LASF88
	.byte	0x88
	.byte	0x9
	.byte	0x51
	.long	0x58c
	.uleb128 0x10
	.string	"f"
	.byte	0x9
	.byte	0x52
	.long	0x58c
	.byte	0
	.uleb128 0x8
	.long	.LASF89
	.byte	0x9
	.byte	0x53
	.long	0x62
	.byte	0x8
	.uleb128 0x10
	.string	"end"
	.byte	0x9
	.byte	0x53
	.long	0x62
	.byte	0xc
	.uleb128 0x8
	.long	.LASF83
	.byte	0x9
	.byte	0x55
	.long	0x467
	.byte	0x10
	.uleb128 0x8
	.long	.LASF90
	.byte	0x9
	.byte	0x56
	.long	0x467
	.byte	0x20
	.uleb128 0x8
	.long	.LASF91
	.byte	0x9
	.byte	0x57
	.long	0x95
	.byte	0x30
	.uleb128 0x8
	.long	.LASF85
	.byte	0x9
	.byte	0x5d
	.long	0x95
	.byte	0x31
	.uleb128 0x8
	.long	.LASF92
	.byte	0x9
	.byte	0x5e
	.long	0x95
	.byte	0x32
	.uleb128 0x8
	.long	.LASF93
	.byte	0x9
	.byte	0x5f
	.long	0x95
	.byte	0x33
	.uleb128 0x8
	.long	.LASF94
	.byte	0x9
	.byte	0x60
	.long	0x95
	.byte	0x34
	.uleb128 0x8
	.long	.LASF95
	.byte	0x9
	.byte	0x61
	.long	0x95
	.byte	0x35
	.uleb128 0x8
	.long	.LASF96
	.byte	0x9
	.byte	0x62
	.long	0x95
	.byte	0x36
	.uleb128 0x8
	.long	.LASF97
	.byte	0x9
	.byte	0x64
	.long	0x592
	.byte	0x38
	.uleb128 0x8
	.long	.LASF86
	.byte	0x9
	.byte	0x65
	.long	0x2b4
	.byte	0x40
	.uleb128 0x8
	.long	.LASF98
	.byte	0x9
	.byte	0x65
	.long	0x2b4
	.byte	0x58
	.uleb128 0x10
	.string	"rbs"
	.byte	0x9
	.byte	0x65
	.long	0x2b4
	.byte	0x70
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x329
	.uleb128 0x6
	.byte	0x8
	.long	0x4c1
	.uleb128 0x14
	.byte	0x10
	.byte	0x3
	.byte	0x3e
	.long	0x5b7
	.uleb128 0x8
	.long	.LASF85
	.byte	0x3
	.byte	0x3f
	.long	0x62
	.byte	0
	.uleb128 0x10
	.string	"s"
	.byte	0x3
	.byte	0x40
	.long	0x8f
	.byte	0x8
	.byte	0
	.uleb128 0x15
	.long	.LASF103
	.byte	0x1
	.byte	0x21
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x5e3
	.uleb128 0x16
	.long	.LASF99
	.byte	0x1
	.byte	0x21
	.long	0x5e3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2eb
	.uleb128 0x17
	.long	.LASF108
	.byte	0x1
	.byte	0x34
	.long	0x2e5
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x651
	.uleb128 0x16
	.long	.LASF99
	.byte	0x1
	.byte	0x34
	.long	0x5e3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.long	.LASF100
	.byte	0x1
	.byte	0x35
	.long	0x304
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x18
	.string	"key"
	.byte	0x1
	.byte	0x35
	.long	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x19
	.long	.LASF101
	.byte	0x1
	.byte	0x37
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.long	.LASF102
	.byte	0x1
	.byte	0x38
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.long	.LASF104
	.byte	0x1
	.byte	0x95
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x699
	.uleb128 0x16
	.long	.LASF105
	.byte	0x1
	.byte	0x95
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.long	.LASF106
	.byte	0x1
	.byte	0x96
	.long	0x699
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.long	.LASF107
	.byte	0x1
	.byte	0x96
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2e5
	.uleb128 0x17
	.long	.LASF109
	.byte	0x1
	.byte	0xa0
	.long	0x2e5
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x725
	.uleb128 0x16
	.long	.LASF99
	.byte	0x1
	.byte	0xa0
	.long	0x5e3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.long	.LASF107
	.byte	0x1
	.byte	0xa1
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x16
	.long	.LASF100
	.byte	0x1
	.byte	0xa2
	.long	0x304
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x18
	.string	"key"
	.byte	0x1
	.byte	0xa2
	.long	0x38
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x19
	.long	.LASF101
	.byte	0x1
	.byte	0xa4
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.long	.LASF102
	.byte	0x1
	.byte	0xa5
	.long	0x699
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.long	.LASF105
	.byte	0x1
	.byte	0xa6
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.long	.LASF110
	.byte	0x2
	.byte	0x10
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x769
	.uleb128 0x18
	.string	"x"
	.byte	0x2
	.byte	0x10
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.string	"s"
	.byte	0x2
	.byte	0x10
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x18
	.string	"len"
	.byte	0x2
	.byte	0x10
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x467
	.uleb128 0x17
	.long	.LASF111
	.byte	0x2
	.byte	0x1e
	.long	0x62
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x7d5
	.uleb128 0x18
	.string	"s1"
	.byte	0x2
	.byte	0x1e
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.string	"s2"
	.byte	0x2
	.byte	0x1e
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.long	.LASF112
	.byte	0x2
	.byte	0x1e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1a
	.string	"len"
	.byte	0x2
	.byte	0x20
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.string	"res"
	.byte	0x2
	.byte	0x21
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x17
	.long	.LASF113
	.byte	0x2
	.byte	0x30
	.long	0x62
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x811
	.uleb128 0x18
	.string	"s1"
	.byte	0x2
	.byte	0x30
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.string	"s2"
	.byte	0x2
	.byte	0x30
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x17
	.long	.LASF114
	.byte	0x2
	.byte	0x36
	.long	0x62
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x859
	.uleb128 0x18
	.string	"s1"
	.byte	0x2
	.byte	0x36
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x18
	.string	"s"
	.byte	0x2
	.byte	0x36
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1a
	.string	"s2"
	.byte	0x2
	.byte	0x38
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x17
	.long	.LASF115
	.byte	0x2
	.byte	0x3e
	.long	0x62
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x8a1
	.uleb128 0x18
	.string	"s1"
	.byte	0x2
	.byte	0x3e
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x18
	.string	"s"
	.byte	0x2
	.byte	0x3e
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1a
	.string	"s2"
	.byte	0x2
	.byte	0x40
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x17
	.long	.LASF116
	.byte	0x2
	.byte	0x47
	.long	0x8f
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x8cf
	.uleb128 0x18
	.string	"s"
	.byte	0x2
	.byte	0x47
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1b
	.long	.LASF117
	.byte	0x3
	.byte	0x6
	.long	0x8f
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x909
	.uleb128 0x18
	.string	"f"
	.byte	0x3
	.byte	0x6
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.string	"l"
	.byte	0x3
	.byte	0x6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1b
	.long	.LASF118
	.byte	0x3
	.byte	0xe
	.long	0x62
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x943
	.uleb128 0x18
	.string	"f"
	.byte	0x3
	.byte	0xe
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.string	"l"
	.byte	0x3
	.byte	0xe
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1c
	.long	.LASF120
	.byte	0x3
	.byte	0x16
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x9a1
	.uleb128 0x18
	.string	"str"
	.byte	0x3
	.byte	0x16
	.long	0x3e1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.string	"x"
	.byte	0x3
	.byte	0x16
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.long	.LASF119
	.byte	0x3
	.byte	0x16
	.long	0x28e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1a
	.string	"s"
	.byte	0x3
	.byte	0x18
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.string	"e"
	.byte	0x3
	.byte	0x18
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1c
	.long	.LASF121
	.byte	0x3
	.byte	0x36
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x9e7
	.uleb128 0x18
	.string	"str"
	.byte	0x3
	.byte	0x36
	.long	0x3e1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.string	"x"
	.byte	0x3
	.byte	0x36
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x19
	.long	.LASF119
	.byte	0x3
	.byte	0x38
	.long	0x28e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1d
	.long	.LASF122
	.byte	0x3
	.byte	0x5d
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xa48
	.uleb128 0x18
	.string	"s"
	.byte	0x3
	.byte	0x5d
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x18
	.string	"nm"
	.byte	0x3
	.byte	0x5d
	.long	0x769
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x16
	.long	.LASF123
	.byte	0x3
	.byte	0x5d
	.long	0x769
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1a
	.string	"t"
	.byte	0x3
	.byte	0x5f
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1a
	.string	"t2"
	.byte	0x3
	.byte	0x5f
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x17
	.long	.LASF124
	.byte	0x3
	.byte	0x6d
	.long	0x62
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0xa82
	.uleb128 0x18
	.string	"t"
	.byte	0x3
	.byte	0x6d
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.string	"i"
	.byte	0x3
	.byte	0x6f
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1e
	.long	.LASF125
	.byte	0x3
	.byte	0x77
	.long	0x62
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0xae8
	.uleb128 0x16
	.long	.LASF126
	.byte	0x3
	.byte	0x77
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x16
	.long	.LASF127
	.byte	0x3
	.byte	0x77
	.long	0xae8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1a
	.string	"s"
	.byte	0x3
	.byte	0x79
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x19
	.long	.LASF85
	.byte	0x3
	.byte	0x7a
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1a
	.string	"t"
	.byte	0x3
	.byte	0x7b
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF128
	.uleb128 0x1e
	.long	.LASF63
	.byte	0x3
	.byte	0xa0
	.long	0x62
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0xb29
	.uleb128 0x18
	.string	"f"
	.byte	0x3
	.byte	0xa0
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.string	"l"
	.byte	0x3
	.byte	0xa0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1e
	.long	.LASF129
	.byte	0x3
	.byte	0xa8
	.long	0x62
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0xb6f
	.uleb128 0x18
	.string	"f"
	.byte	0x3
	.byte	0xa8
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.string	"l"
	.byte	0x3
	.byte	0xa8
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1a
	.string	"t"
	.byte	0x3
	.byte	0xaa
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1c
	.long	.LASF130
	.byte	0x3
	.byte	0xb2
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0xc35
	.uleb128 0x18
	.string	"f"
	.byte	0x3
	.byte	0xb2
	.long	0x58c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x1a
	.string	"i"
	.byte	0x3
	.byte	0xb4
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x1a
	.string	"nr"
	.byte	0x3
	.byte	0xb4
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1a
	.string	"sz"
	.byte	0x3
	.byte	0xb4
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x19
	.long	.LASF131
	.byte	0x3
	.byte	0xb4
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x19
	.long	.LASF132
	.byte	0x3
	.byte	0xb4
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x19
	.long	.LASF61
	.byte	0x3
	.byte	0xb5
	.long	0x3e1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1a
	.string	"s"
	.byte	0x3
	.byte	0xb5
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1a
	.string	"se"
	.byte	0x3
	.byte	0xb5
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x19
	.long	.LASF62
	.byte	0x3
	.byte	0xb6
	.long	0x299
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1a
	.string	"t"
	.byte	0x3
	.byte	0xb7
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1f
	.long	.LASF168
	.byte	0x3
	.byte	0xe6
	.quad	.L92
	.byte	0
	.uleb128 0x1c
	.long	.LASF133
	.byte	0x3
	.byte	0xf2
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0xc6b
	.uleb128 0x18
	.string	"f"
	.byte	0x3
	.byte	0xf2
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1a
	.string	"i"
	.byte	0x3
	.byte	0xf4
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x17
	.long	.LASF134
	.byte	0x3
	.byte	0xfe
	.long	0x62
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0xcf6
	.uleb128 0x16
	.long	.LASF102
	.byte	0x3
	.byte	0xfe
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x18
	.string	"key"
	.byte	0x3
	.byte	0xfe
	.long	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.string	"blk"
	.byte	0x3
	.value	0x100
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.string	"nm"
	.byte	0x3
	.value	0x101
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.string	"res"
	.byte	0x3
	.value	0x102
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x21
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x22
	.long	.LASF135
	.byte	0x3
	.value	0x100
	.long	0xcf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xcfc
	.uleb128 0xd
	.long	0x2b4
	.uleb128 0x23
	.long	.LASF136
	.byte	0x3
	.value	0x108
	.long	0x62
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0xd8f
	.uleb128 0x24
	.long	.LASF102
	.byte	0x3
	.value	0x108
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.string	"key"
	.byte	0x3
	.value	0x108
	.long	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.string	"blk"
	.byte	0x3
	.value	0x10a
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.string	"nm"
	.byte	0x3
	.value	0x10b
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.string	"res"
	.byte	0x3
	.value	0x10c
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x21
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x22
	.long	.LASF135
	.byte	0x3
	.value	0x10a
	.long	0xcf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x26
	.long	.LASF137
	.byte	0x3
	.value	0x112
	.long	0x62
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.long	0xe00
	.uleb128 0x24
	.long	.LASF102
	.byte	0x3
	.value	0x112
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x25
	.string	"key"
	.byte	0x3
	.value	0x112
	.long	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.string	"blk"
	.byte	0x3
	.value	0x114
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x22
	.long	.LASF135
	.byte	0x3
	.value	0x114
	.long	0xcf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF138
	.byte	0x3
	.value	0x119
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0xe5a
	.uleb128 0x25
	.string	"hnm"
	.byte	0x3
	.value	0x119
	.long	0x769
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x25
	.string	"nm"
	.byte	0x3
	.value	0x119
	.long	0x769
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x22
	.long	.LASF139
	.byte	0x3
	.value	0x11b
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.string	"s"
	.byte	0x3
	.value	0x11c
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x28
	.long	.LASF140
	.byte	0x3
	.value	0x133
	.long	0x592
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0xedf
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x133
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x25
	.string	"s"
	.byte	0x3
	.value	0x133
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x25
	.string	"e"
	.byte	0x3
	.value	0x133
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x25
	.string	"nm"
	.byte	0x3
	.value	0x133
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.long	.LASF85
	.byte	0x3
	.value	0x133
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x24
	.long	.LASF92
	.byte	0x3
	.value	0x133
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.string	"blk"
	.byte	0x3
	.value	0x135
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x28
	.long	.LASF141
	.byte	0x3
	.value	0x14c
	.long	0x592
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0xf5b
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x14c
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.string	"nm"
	.byte	0x3
	.value	0x14c
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.string	"rb"
	.byte	0x3
	.value	0x14e
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.string	"blk"
	.byte	0x3
	.value	0x14f
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x22
	.long	.LASF135
	.byte	0x3
	.value	0x155
	.long	0xcf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x28
	.long	.LASF142
	.byte	0x3
	.value	0x159
	.long	0x592
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x100b
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x159
	.long	0x58c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x25
	.string	"nm"
	.byte	0x3
	.value	0x159
	.long	0x769
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x20
	.string	"n"
	.byte	0x3
	.value	0x15b
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.string	"n2"
	.byte	0x3
	.value	0x15b
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.string	"blk"
	.byte	0x3
	.value	0x15c
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x29
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0xfe9
	.uleb128 0x22
	.long	.LASF135
	.byte	0x3
	.value	0x164
	.long	0xcf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x21
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x22
	.long	.LASF135
	.byte	0x3
	.value	0x16a
	.long	0xcf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	.LASF143
	.byte	0x3
	.value	0x16e
	.long	0x62
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x1058
	.uleb128 0x25
	.string	"s"
	.byte	0x3
	.value	0x16e
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.string	"t"
	.byte	0x3
	.value	0x170
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x22
	.long	.LASF144
	.byte	0x3
	.value	0x171
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x27
	.long	.LASF145
	.byte	0x3
	.value	0x17e
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0x10e7
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x17e
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.string	"i"
	.byte	0x3
	.value	0x17e
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x25
	.string	"nm"
	.byte	0x3
	.value	0x17e
	.long	0x769
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.string	"s"
	.byte	0x3
	.value	0x180
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.string	"e"
	.byte	0x3
	.value	0x180
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x22
	.long	.LASF92
	.byte	0x3
	.value	0x180
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x22
	.long	.LASF144
	.byte	0x3
	.value	0x181
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.string	"blk"
	.byte	0x3
	.value	0x182
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x27
	.long	.LASF146
	.byte	0x3
	.value	0x196
	.quad	.LFB40
	.quad	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.long	0x118b
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x196
	.long	0x58c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x25
	.string	"i"
	.byte	0x3
	.value	0x196
	.long	0x299
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x25
	.string	"nm"
	.byte	0x3
	.value	0x196
	.long	0x769
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x20
	.string	"s"
	.byte	0x3
	.value	0x198
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.string	"e"
	.byte	0x3
	.value	0x198
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x20
	.string	"e2"
	.byte	0x3
	.value	0x198
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x22
	.long	.LASF92
	.byte	0x3
	.value	0x198
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x22
	.long	.LASF147
	.byte	0x3
	.value	0x198
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x20
	.string	"nm2"
	.byte	0x3
	.value	0x199
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x27
	.long	.LASF148
	.byte	0x3
	.value	0x1b5
	.quad	.LFB41
	.quad	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.long	0x11df
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x1b5
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x25
	.string	"i"
	.byte	0x3
	.value	0x1b5
	.long	0x299
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x25
	.string	"nm"
	.byte	0x3
	.value	0x1b5
	.long	0x769
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.string	"s"
	.byte	0x3
	.value	0x1b7
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x27
	.long	.LASF149
	.byte	0x3
	.value	0x1be
	.quad	.LFB42
	.quad	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.long	0x1242
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x1be
	.long	0x58c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x25
	.string	"i"
	.byte	0x3
	.value	0x1be
	.long	0x299
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x20
	.string	"s"
	.byte	0x3
	.value	0x1c0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.string	"e"
	.byte	0x3
	.value	0x1c0
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.string	"nm"
	.byte	0x3
	.value	0x1c1
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x27
	.long	.LASF150
	.byte	0x3
	.value	0x1cb
	.quad	.LFB43
	.quad	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.long	0x12db
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x1cb
	.long	0x58c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x25
	.string	"i"
	.byte	0x3
	.value	0x1cb
	.long	0x299
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x20
	.string	"tkn"
	.byte	0x3
	.value	0x1cd
	.long	0x467
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x22
	.long	.LASF151
	.byte	0x3
	.value	0x1cd
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.string	"s"
	.byte	0x3
	.value	0x1ce
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x22
	.long	.LASF152
	.byte	0x3
	.value	0x1cf
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x21
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x20
	.string	"nm2"
	.byte	0x3
	.value	0x1d8
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.uleb128 0x2a
	.long	.LASF153
	.byte	0x3
	.value	0x1e5
	.quad	.LFB44
	.quad	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.long	0x1325
	.uleb128 0x25
	.string	"b"
	.byte	0x3
	.value	0x1e5
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x25
	.string	"len"
	.byte	0x3
	.value	0x1e5
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.string	"blk"
	.byte	0x3
	.value	0x1e7
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2a
	.long	.LASF154
	.byte	0x3
	.value	0x1f6
	.quad	.LFB45
	.quad	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.long	0x136d
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x1f6
	.long	0x58c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.string	"i"
	.byte	0x3
	.value	0x1f8
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.string	"nm"
	.byte	0x3
	.value	0x1f9
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x2a
	.long	.LASF155
	.byte	0x3
	.value	0x212
	.quad	.LFB46
	.quad	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.long	0x13c4
	.uleb128 0x25
	.string	"b0"
	.byte	0x3
	.value	0x212
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.string	"b1"
	.byte	0x3
	.value	0x212
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.string	"i0"
	.byte	0x3
	.value	0x214
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.string	"i1"
	.byte	0x3
	.value	0x214
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x28
	.long	.LASF156
	.byte	0x3
	.value	0x21c
	.long	0x592
	.quad	.LFB47
	.quad	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.long	0x1422
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x21c
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.string	"n"
	.byte	0x3
	.value	0x21e
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x21
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0x22
	.long	.LASF135
	.byte	0x3
	.value	0x221
	.long	0xcf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x28
	.long	.LASF157
	.byte	0x3
	.value	0x224
	.long	0x592
	.quad	.LFB48
	.quad	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.long	0x1482
	.uleb128 0x25
	.string	"blk"
	.byte	0x3
	.value	0x224
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.string	"n"
	.byte	0x3
	.value	0x226
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x21
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0x22
	.long	.LASF135
	.byte	0x3
	.value	0x229
	.long	0xcf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x28
	.long	.LASF158
	.byte	0x3
	.value	0x22c
	.long	0x592
	.quad	.LFB49
	.quad	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.long	0x14c3
	.uleb128 0x25
	.string	"blk"
	.byte	0x3
	.value	0x22c
	.long	0x592
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x24
	.long	.LASF85
	.byte	0x3
	.value	0x22c
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x23
	.long	.LASF159
	.byte	0x3
	.value	0x259
	.long	0x62
	.quad	.LFB50
	.quad	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.long	0x1543
	.uleb128 0x24
	.long	.LASF102
	.byte	0x3
	.value	0x259
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.string	"key"
	.byte	0x3
	.value	0x259
	.long	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x22
	.long	.LASF160
	.byte	0x3
	.value	0x25b
	.long	0x4bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x22
	.long	.LASF83
	.byte	0x3
	.value	0x25c
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0x22
	.long	.LASF135
	.byte	0x3
	.value	0x25b
	.long	0xcf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x28
	.long	.LASF161
	.byte	0x3
	.value	0x261
	.long	0x4bb
	.quad	.LFB51
	.quad	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.long	0x15b3
	.uleb128 0x24
	.long	.LASF83
	.byte	0x3
	.value	0x261
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.string	"rb"
	.byte	0x3
	.value	0x263
	.long	0x2e5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x22
	.long	.LASF160
	.byte	0x3
	.value	0x264
	.long	0x4bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x22
	.long	.LASF135
	.byte	0x3
	.value	0x26a
	.long	0xcf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	.LASF162
	.byte	0x3
	.value	0x26e
	.long	0x4bb
	.quad	.LFB52
	.quad	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.long	0x15f2
	.uleb128 0x24
	.long	.LASF160
	.byte	0x3
	.value	0x26e
	.long	0x4bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.string	"s"
	.byte	0x3
	.value	0x270
	.long	0x4bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2b
	.long	.LASF163
	.byte	0x3
	.value	0x277
	.long	0x4bb
	.quad	.LFB53
	.quad	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.long	0x163e
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x277
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x25
	.string	"l"
	.byte	0x3
	.value	0x277
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x22
	.long	.LASF160
	.byte	0x3
	.value	0x279
	.long	0x4bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2b
	.long	.LASF164
	.byte	0x3
	.value	0x282
	.long	0x62
	.quad	.LFB54
	.quad	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.long	0x1670
	.uleb128 0x24
	.long	.LASF160
	.byte	0x3
	.value	0x282
	.long	0x4bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2b
	.long	.LASF165
	.byte	0x3
	.value	0x287
	.long	0x62
	.quad	.LFB55
	.quad	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.long	0x16a2
	.uleb128 0x24
	.long	.LASF160
	.byte	0x3
	.value	0x287
	.long	0x4bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x23
	.long	.LASF166
	.byte	0x3
	.value	0x28c
	.long	0x4bb
	.quad	.LFB56
	.quad	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.long	0x1740
	.uleb128 0x25
	.string	"s"
	.byte	0x3
	.value	0x28c
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x22
	.long	.LASF160
	.byte	0x3
	.value	0x28e
	.long	0x4bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x22
	.long	.LASF167
	.byte	0x3
	.value	0x28f
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.string	"nm"
	.byte	0x3
	.value	0x290
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x22
	.long	.LASF119
	.byte	0x3
	.value	0x291
	.long	0x28e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2c
	.long	.LASF168
	.byte	0x3
	.value	0x2b1
	.quad	.L223
	.uleb128 0x21
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x20
	.string	"cp"
	.byte	0x3
	.value	0x2ac
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	.LASF169
	.byte	0x3
	.value	0x2b6
	.long	0x4bb
	.quad	.LFB57
	.quad	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.long	0x17a8
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x2b6
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.string	"l"
	.byte	0x3
	.value	0x2b6
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x20
	.string	"t"
	.byte	0x3
	.value	0x2b8
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.string	"cur"
	.byte	0x3
	.value	0x2b9
	.long	0x4bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.string	"new"
	.byte	0x3
	.value	0x2b9
	.long	0x4bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2a
	.long	.LASF170
	.byte	0x3
	.value	0x2ce
	.quad	.LFB58
	.quad	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.long	0x17f0
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x2ce
	.long	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x22
	.long	.LASF160
	.byte	0x3
	.value	0x2d0
	.long	0x4bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.string	"i"
	.byte	0x3
	.value	0x2d1
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x28
	.long	.LASF171
	.byte	0x3
	.value	0x2e6
	.long	0x62
	.quad	.LFB59
	.quad	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.long	0x1889
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x2e6
	.long	0x58c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x25
	.string	"l"
	.byte	0x3
	.value	0x2e6
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x25
	.string	"nm"
	.byte	0x3
	.value	0x2e6
	.long	0x769
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x20
	.string	"s"
	.byte	0x3
	.value	0x2e8
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.string	"nm2"
	.byte	0x3
	.value	0x2e9
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x22
	.long	.LASF123
	.byte	0x3
	.value	0x2e9
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.string	"l0"
	.byte	0x3
	.value	0x2ea
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x22
	.long	.LASF172
	.byte	0x3
	.value	0x2ea
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x28
	.long	.LASF173
	.byte	0x3
	.value	0x304
	.long	0x62
	.quad	.LFB60
	.quad	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.long	0x18f3
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x304
	.long	0x58c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x25
	.string	"l"
	.byte	0x3
	.value	0x304
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x25
	.string	"nm"
	.byte	0x3
	.value	0x304
	.long	0x769
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x20
	.string	"nm2"
	.byte	0x3
	.value	0x30a
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.string	"s"
	.byte	0x3
	.value	0x30b
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x28
	.long	.LASF174
	.byte	0x3
	.value	0x314
	.long	0x62
	.quad	.LFB61
	.quad	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.long	0x19aa
	.uleb128 0x25
	.string	"f"
	.byte	0x3
	.value	0x314
	.long	0x58c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x25
	.string	"l"
	.byte	0x3
	.value	0x314
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -92
	.uleb128 0x25
	.string	"e"
	.byte	0x3
	.value	0x314
	.long	0x299
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x24
	.long	.LASF175
	.byte	0x3
	.value	0x314
	.long	0x299
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x25
	.string	"nm"
	.byte	0x3
	.value	0x314
	.long	0x769
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x20
	.string	"s"
	.byte	0x3
	.value	0x316
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.string	"l0"
	.byte	0x3
	.value	0x317
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x22
	.long	.LASF92
	.byte	0x3
	.value	0x317
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x20
	.string	"nm2"
	.byte	0x3
	.value	0x318
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x22
	.long	.LASF123
	.byte	0x3
	.value	0x318
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x28
	.long	.LASF176
	.byte	0x3
	.value	0x356
	.long	0x62
	.quad	.LFB62
	.quad	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.long	0x19f6
	.uleb128 0x25
	.string	"s"
	.byte	0x3
	.value	0x356
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.long	.LASF85
	.byte	0x3
	.value	0x356
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x20
	.string	"t"
	.byte	0x3
	.value	0x358
	.long	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0xb
	.long	0x598
	.long	0x1a06
	.uleb128 0xc
	.long	0x86
	.byte	0x14
	.byte	0
	.uleb128 0x19
	.long	.LASF177
	.byte	0x3
	.byte	0x41
	.long	0x19f6
	.uleb128 0x9
	.byte	0x3
	.quad	asm_directives
	.uleb128 0xb
	.long	0x472
	.long	0x1a2b
	.uleb128 0xc
	.long	0x86
	.byte	0x18
	.byte	0
	.uleb128 0x22
	.long	.LASF178
	.byte	0x3
	.value	0x236
	.long	0x1a1b
	.uleb128 0x9
	.byte	0x3
	.quad	predefined_sections
	.uleb128 0x22
	.long	.LASF179
	.byte	0x3
	.value	0x257
	.long	0x2eb
	.uleb128 0x9
	.byte	0x3
	.quad	sections_rbroot_byname
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF136:
	.string	"cblock_human_name_cmp"
.LASF146:
	.string	"init_var_block"
.LASF32:
	.string	"_shortbuf"
.LASF83:
	.string	"name"
.LASF183:
	.string	"_IO_lock_t"
.LASF21:
	.string	"_IO_buf_end"
.LASF129:
	.string	"is_sect_cmd"
.LASF138:
	.string	"cblock_make_human_name"
.LASF111:
	.string	"kpstrncmp"
.LASF144:
	.string	"flags"
.LASF147:
	.string	"has_body"
.LASF19:
	.string	"_IO_write_end"
.LASF3:
	.string	"unsigned int"
.LASF77:
	.string	"_ISblank"
.LASF13:
	.string	"_flags"
.LASF93:
	.string	"handled"
.LASF110:
	.string	"kpstrset"
.LASF25:
	.string	"_markers"
.LASF87:
	.string	"prev"
.LASF133:
	.string	"init_ctypes"
.LASF145:
	.string	"init_func_block"
.LASF130:
	.string	"init_multilines"
.LASF64:
	.string	"section"
.LASF46:
	.string	"_pos"
.LASF121:
	.string	"get_token"
.LASF142:
	.string	"cblock_find_by_human_name"
.LASF119:
	.string	"delim"
.LASF24:
	.string	"_IO_save_end"
.LASF88:
	.string	"cblock"
.LASF94:
	.string	"ignore"
.LASF95:
	.string	"unlink"
.LASF179:
	.string	"sections_rbroot_byname"
.LASF150:
	.string	"init_attr_block"
.LASF48:
	.string	"long long unsigned int"
.LASF61:
	.string	"lines"
.LASF123:
	.string	"attr"
.LASF23:
	.string	"_IO_backup_base"
.LASF34:
	.string	"_offset"
.LASF58:
	.string	"dirname"
.LASF113:
	.string	"kpstrcmp"
.LASF175:
	.string	"pglobl"
.LASF141:
	.string	"cblock_find_by_name"
.LASF66:
	.string	"cblocks_by_human_name"
.LASF70:
	.string	"_ISlower"
.LASF27:
	.string	"_fileno"
.LASF134:
	.string	"cblock_name_cmp"
.LASF7:
	.string	"size_t"
.LASF122:
	.string	"get_type_args"
.LASF73:
	.string	"_ISxdigit"
.LASF81:
	.string	"kpstr_t"
.LASF105:
	.string	"parent"
.LASF16:
	.string	"_IO_read_base"
.LASF128:
	.string	"_Bool"
.LASF44:
	.string	"_next"
.LASF91:
	.string	"auto_name"
.LASF177:
	.string	"asm_directives"
.LASF131:
	.string	"slen"
.LASF65:
	.string	"cblocks_by_name"
.LASF50:
	.string	"rb_node"
.LASF169:
	.string	"parse_section"
.LASF11:
	.string	"char"
.LASF40:
	.string	"_mode"
.LASF86:
	.string	"rbnm"
.LASF53:
	.string	"rb_left"
.LASF43:
	.string	"_IO_marker"
.LASF165:
	.string	"is_code_sect"
.LASF14:
	.string	"_IO_read_ptr"
.LASF101:
	.string	"cmp_res"
.LASF132:
	.string	"first_token"
.LASF54:
	.string	"rb_root"
.LASF181:
	.string	"kpatch_parse.c"
.LASF155:
	.string	"cblock_print2"
.LASF152:
	.string	"blklen"
.LASF139:
	.string	"subnm"
.LASF103:
	.string	"rb_init"
.LASF174:
	.string	"is_variable_start"
.LASF163:
	.string	"csect"
.LASF180:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF160:
	.string	"sect"
.LASF173:
	.string	"is_function_end"
.LASF178:
	.string	"predefined_sections"
.LASF17:
	.string	"_IO_write_base"
.LASF140:
	.string	"cblock_add"
.LASF51:
	.string	"rb_parent"
.LASF47:
	.string	"long long int"
.LASF56:
	.string	"kp_file"
.LASF112:
	.string	"maxlen"
.LASF22:
	.string	"_IO_save_base"
.LASF109:
	.string	"rb_insert_node"
.LASF156:
	.string	"cblock_first"
.LASF78:
	.string	"_IScntrl"
.LASF127:
	.string	"with_checks"
.LASF172:
	.string	"func"
.LASF106:
	.string	"parent_link"
.LASF108:
	.string	"rb_search_node"
.LASF120:
	.string	"__get_token"
.LASF72:
	.string	"_ISdigit"
.LASF100:
	.string	"cmp_fn"
.LASF143:
	.string	"get_kpatch_flags"
.LASF126:
	.string	"origs"
.LASF74:
	.string	"_ISspace"
.LASF176:
	.string	"is_data_def"
.LASF35:
	.string	"__pad1"
.LASF36:
	.string	"__pad2"
.LASF37:
	.string	"__pad3"
.LASF38:
	.string	"__pad4"
.LASF39:
	.string	"__pad5"
.LASF124:
	.string	"find_ctype"
.LASF31:
	.string	"_vtable_offset"
.LASF168:
	.string	"done"
.LASF125:
	.string	"parse_ctype"
.LASF137:
	.string	"cblock_start_cmp"
.LASF49:
	.string	"long double"
.LASF162:
	.string	"dup_section"
.LASF157:
	.string	"cblock_next"
.LASF52:
	.string	"rb_right"
.LASF115:
	.string	"kpstrncmpz"
.LASF99:
	.string	"root"
.LASF97:
	.string	"pair"
.LASF79:
	.string	"_ISpunct"
.LASF15:
	.string	"_IO_read_end"
.LASF159:
	.string	"section_name_cmp"
.LASF75:
	.string	"_ISprint"
.LASF5:
	.string	"short int"
.LASF6:
	.string	"long int"
.LASF96:
	.string	"adapted"
.LASF154:
	.string	"cblocks_init"
.LASF98:
	.string	"rb_hnm"
.LASF116:
	.string	"skip_blanks"
.LASF102:
	.string	"node"
.LASF117:
	.string	"cline"
.LASF62:
	.string	"lines_num"
.LASF60:
	.string	"nr_lines"
.LASF161:
	.string	"find_section"
.LASF76:
	.string	"_ISgraph"
.LASF82:
	.string	"section_desc"
.LASF89:
	.string	"start"
.LASF68:
	.string	"renames"
.LASF59:
	.string	"basename"
.LASF148:
	.string	"init_set_block"
.LASF33:
	.string	"_lock"
.LASF10:
	.string	"sizetype"
.LASF0:
	.string	"long unsigned int"
.LASF29:
	.string	"_old_offset"
.LASF42:
	.string	"_IO_FILE"
.LASF90:
	.string	"human_name"
.LASF135:
	.string	"__ptr"
.LASF71:
	.string	"_ISalpha"
.LASF55:
	.string	"rb_cmp_fn_t"
.LASF63:
	.string	"ctype"
.LASF107:
	.string	"new_node"
.LASF85:
	.string	"type"
.LASF1:
	.string	"unsigned char"
.LASF45:
	.string	"_sbuf"
.LASF18:
	.string	"_IO_write_ptr"
.LASF158:
	.string	"cblock_skip"
.LASF170:
	.string	"init_sections"
.LASF80:
	.string	"_ISalnum"
.LASF114:
	.string	"kpstrcmpz"
.LASF8:
	.string	"__off_t"
.LASF171:
	.string	"is_function_start"
.LASF182:
	.string	"/home/davinchi/cloudlinux/kernelcare/kpatch"
.LASF4:
	.string	"signed char"
.LASF164:
	.string	"is_data_sect"
.LASF57:
	.string	"rpath"
.LASF2:
	.string	"short unsigned int"
.LASF84:
	.string	"outname"
.LASF92:
	.string	"globl"
.LASF67:
	.string	"cblocks_by_start"
.LASF104:
	.string	"rb_tree_insert"
.LASF166:
	.string	"__parse_section"
.LASF153:
	.string	"cblock_split"
.LASF167:
	.string	"sname"
.LASF26:
	.string	"_chain"
.LASF69:
	.string	"_ISupper"
.LASF118:
	.string	"clinenum"
.LASF12:
	.string	"FILE"
.LASF28:
	.string	"_flags2"
.LASF30:
	.string	"_cur_column"
.LASF9:
	.string	"__off64_t"
.LASF41:
	.string	"_unused2"
.LASF20:
	.string	"_IO_buf_base"
.LASF149:
	.string	"init_other_block"
.LASF151:
	.string	"symname"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
