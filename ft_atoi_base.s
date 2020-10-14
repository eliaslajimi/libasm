extern _ft_cmp
extern _multi
extern _ft_strchr
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
	jmp _checkBaseLength
	jmp _checkError

_checkLength:
	cmp rbx, 0
	je _error

	mov rbx, -1

_checkWhiteSpace2:
	add rbx, 1

	mov rdi, [r12 + rbx]	;compare *str to 0
	mov rsi, 0
	call _ft_cmp
	cmp rax, 1
	je _processRes		;end of the loop

	mov rdi, [r12 + rbx]	;compare *str to whitespace
	call _ft_isspace
	cmp rax, 1
	je _checkWhiteSpace2

_processRes:
	mov r11, rbx
	sub r11, 1

	mov r14, 0		;result
	mov r10, 1		;sign

_prIter1:
	inc r11

	mov rdi, [r12 + r11]	;compare *str to 0
	mov rsi, 0
	call _ft_cmp
	cmp rax, 1
	je _ret			;end of the loop

	mov rdi, [r12 + r11]	;compare *str to -
	mov rsi, 45
	call _ft_cmp
	cmp rax, 1
	je _prIter1C

	mov rdi, [r12 + r11]	;compare *str to +
	mov rsi, 43
	call _ft_cmp
	cmp rax, 1
	je _prIter1C

_prIter1B:
	mov rdi, [r12 + r11]	;compare *str to -
	mov rsi, 45
	call _ft_cmp
	cmp rax, 1
	je _isNeg

	mov rdi, [r12 + r11]	;compare *str to +
	mov rsi, 43
	call _ft_cmp
	cmp rax, 1
	je _prIter1

	mov rax, r14
	mul r15
	mov r14, rax

	mov rdi, r13
	mov rsi, [r12 + r11]
	call _ft_strchr
	add r14, rax

	jmp _prIter1

_prIter1C:
	cmp r11, rbx
	je _prIter1B

	jmp _ret

_isNeg:
	mov r10, -1
	jmp _prIter1
	
_ret:
	mov rax, r14		;return

_return:
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	ret

_checkBaseLength:
	mov rbx, -1
	mov r11, 0

_blIter1:
	inc rbx

	mov rdi, [r13 + rbx]	;compare *base to 0
	mov rsi, 0
	call _ft_cmp
	cmp rax, 1
	je _blRet

	mov rdi, [r13 + rbx]	;compare *base to -
	mov rsi, 45
	call _ft_cmp
	cmp rax, 1
	je _error

	mov rdi, [r13 + rbx]	;compare *base to +
	mov rsi, 43
	call _ft_cmp
	cmp rax, 1
	je _error

	mov r11, rbx

_blIter2:
	inc r11
	mov rdi, [r13 + r11]	;compare *base to 0
	mov rsi, 0
	call _ft_cmp
	cmp rax, 1
	je _blIter1		;end of the loop

_blIter2_2:
	mov rdi, [r13 + r11]	;compare *base[r11] to *base[rbx]
	mov rsi, [r13 + rbx]
	call _ft_cmp
	cmp rax, 1
	je _error		;end of the loop
	jmp _blIter2

_blRet:
	cmp rbx, 2
	jl _error
	mov r15, rbx

_checkError:
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
