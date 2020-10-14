extern _ft_cmp
extern _ft_strlen
extern _ft_isspace
global _ft_atoi_base

_ft_atoi_base:
	push rbx
	push r12
	push r13
	push r14
	push r15
	
	mov rbx, -1
	mov rax, 0
	mov r12, rdi		;str
	mov r13, rsi		;base

_check:
	jmp _check_error

_checkLength:
	mov rax, [r12 + rbx]	

_return:
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	ret

_check_error:

_check_whitespace:
	add rbx, 1		;cmp *str to whitespace
	mov rdi, [r12 + rbx]
	call _ft_isspace
	cmp rax, 1
	je _check_whitespace

_check_str:
	sub rbx, 1

_iter_1:
	inc rbx
	mov rdi, [r12 + rbx]	;compare *str to 0
	mov rsi, 0
	call _ft_cmp
	cmp rax, 1
	je _checkLength 	;here goes the end of the loop
	mov r11, -1		;init second counter

_iter_2:
	add r11, 1
	mov rdi, [r13 + r11]	;compare *base to 0
	mov rsi, 0
	call _ft_cmp
	cmp rax, 1
	je _iter_2B		;if statement after the loop

	mov rdi, [r12 + rbx]	;compare *str to *base
	mov rsi, [r13 + r11]
	call _ft_cmp
	cmp rax, 0
	je _iter_2

	mov rdi, [r12 + rbx]	;compare *str to '-'
	mov rsi, 45
	call _ft_cmp
	cmp rax, 1
	je _iter_2

	mov rdi, [r12 + rbx]	;compare *str to '-'
	mov rsi, 43
	call _ft_cmp
	cmp rax, 1
	je _iter_2

_iter_2B:
	mov rdi, [r12 + rbx]	;compare *str to *base
	mov rsi, [r13 + r11]
	call _ft_cmp
	cmp rax, 0
	je is_false

	jmp _iter_1

is_false:
	mov rdi, [r12 + rbx]	;compare *str to '-'
	mov rsi, 45
	call _ft_cmp
	cmp rax, 1
	je _iter_1

	mov rdi, [r12 + rbx]	;compare *str to '+'
	mov rsi, 43
	call _ft_cmp
	cmp rax, 1
	je _iter_1

	jmp _error

_error:
	mov rax, -1
	jmp _return
