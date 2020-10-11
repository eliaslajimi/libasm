global _ft_list_remove_if

_ft_list_remove_if:
	push r12
	push r13
	push r14
	push r15
	
	mov rdi, [rdi]	;deref ptr to strct
	mov r14, rdi	;list 
	mov r15, rsi	;ref data 
	mov r12, rdx	;cmp func
	mov r13, rcx	;free func

		
_iter:
	cmp r14, 0 ;NULL
	je _return
	
	mov rdi, [r14]
	mov rsi, r15

	call r12
	cmp rax, 0
	je _remove

	mov r14, QWORD [r14 + sizOfPtr]
	jmp _iter

_return:
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	
_remove:

	mov rdi, [r14]
	call r13

	mov r14, QWORD [r14 + sizOfPtr]
	jmp _iter

section .data
NULL	equ 0
sizOfPtr equ 8

