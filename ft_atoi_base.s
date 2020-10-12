extern _ft_strlen
extern _ft_isspace
global _ft_atoi_base

_ft_atoi_base:
	push rbx
	push r12
	push r13
	push r14
	push r15
	
	mov rbx, 0
	mov r12, rdi		;str
	mov r13, rsi		;base

_check:
	jmp _check_error

_return:
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	ret
;================
_check_error:
_check_whitespace:
	add rbx, 1	
	mov rdi, [r12 + rbx]
	call _ft_isspace
	cmp rax, 1
	je _check_whitespace
	mov rax, [r12 + rbx]
	jmp _return

