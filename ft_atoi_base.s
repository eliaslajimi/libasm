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
	mov r12, rdi              ;str
	mov r13, rsi              ;base

_check:
	jmp _checkBaseLength
		
_checkLength:
	sub rbx, r14
	cmp rbx, 0
	jle _error

	mov rbx, -1

_checkWhiteSpace2:
	add rbx, 1

	mov rdi, [r12 + rbx]    ;compare *str to 0
	mov rsi, 0
	call _ft_cmp
	cmp rax, 1
	je _processRes          ;end of the loop

	mov rdi, [r12 + rbx]    ;compare *str to whitespace
	call _ft_isspace
	cmp rax, 1
	je _checkWhiteSpace2

	sub rbx, 1
	mov r15, rbx
_check_minplus2:
	add r15, 1
	mov rdi, [r12 + r15]
	mov rsi, 45
	call _ft_cmp
	cmp rax, 1
	je _isNeg

	mov rdi, [r12 + r15]
	mov rsi, 43
	call _ft_cmp
	cmp rax, 1
	je _check_minplus2

_processRes:
	sub r15, 1

	mov r14, 0              ;result
	mov r10, 1              ;sign
	mov r11, -1

_prIter1:
    add r15, 1
	add r11, 1

    cmp r9, r11
	je _ret
	
	mov rdi, [r12 + r15]    ;compare *str to 0
	mov rsi, 0
	call _ft_cmp
	cmp rax, 1
	je _ret                 ;end of the loop

	mov rdi, [r12 + r15]	;compare *str to -
	mov rsi, 45
	call _ft_cmp
	cmp rax, 1
	je _prIter1C

	mov rdi, [r12 + r15]	;compare *str to +
	mov rsi, 43
	call _ft_cmp
	cmp rax, 1
	je _prIter1C

_prIter1B:
	mov rdi, [r12 + r15]	;compare *str to +
	mov rsi, 43
	call _ft_cmp
	cmp rax, 1
	je _prIter1

    xor rcx, rcx
    xor rdx, rdx

    mov rdi, r13            ;call strlen
    call _ft_strlen

    imul r14d, eax

    mov rcx, r13
    xor rax, rax
    mov rdi, rcx
    mov rsi, [r12 + r15]
    call _ft_strchr
    add r14d, eax

	jmp _prIter1

_prIter1C:
	cmp r15, rbx
	je _prIter1B

	jmp _ret

_isNeg:
	cmp rbx, 0
	jne _neg
	mov rbx, -1
_neg:
	neg rbx
	jmp _check_minplus2

_ret:
    mov rax, r14		;return
    cmp rbx, 1
    jne _return
    neg rax

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
   add rbx, 1

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
   ;; inc r11
   add r11, 1
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
    mov rbx, -1
_check_whitespace:
	add rbx, 1		;cmp *str to whitespace
	mov rdi, [r12 + rbx]
	call _ft_isspace
	cmp rax, 1
	je _check_whitespace

sub rbx, 1
_check_minplus:
	add rbx, 1
	mov rdi, [r12 + rbx]
	mov rsi, 45
	call _ft_cmp
	cmp rax, 1
	je _check_minplus

	mov rdi, [r12 + rbx]
	mov rsi, 43
	call _ft_cmp
	cmp rax, 1
	je _check_minplus

_check_str:
	sub rbx, 1
	mov r9, -1
	mov r14, rbx

_iter_1:
	add r9, 1
    add rbx, 1
	mov rdi, [r12 + rbx]	;compare *str to 0
	mov rsi, 0
	call _ft_cmp
	cmp rax, 1
	je _checkLength 	;here goes the end of the loop

    xor r11, r11
	sub r11, 1		;init second counter

_iter_2:
	add r11, 1
	mov rdi, [r13 + r11]	;compare *base to 0
	mov rsi, 0
	call _ft_cmp
	cmp rax, 1
   je _checkLength

	jmp _esc_seq

_iter_3:
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

	mov rdi, [r12 + rbx]	;compare *str to *base
	mov rsi, [r13 + r11]
	call _ft_cmp
	cmp rax, 0
	je _iter_2

    jmp _iter_1

_esc_seq:
	mov rdi, [r13 + r11]
	mov rsi, 9
	call _ft_cmp
	cmp rax, 1
	je _error

	mov rdi, [r13 + r11]
	mov rsi, 10
	call _ft_cmp
	cmp rax, 1
	je _error

	mov rdi, [r13 + r11]
	mov rsi, 11
	call _ft_cmp
	cmp rax, 1
	je _error

	mov rdi, [r13 + r11]
	mov rsi, 12
	call _ft_cmp
	cmp rax, 1
	je _error

	mov rdi, [r13 + r11]
	mov rsi, 0x0b
	call _ft_cmp
	cmp rax, 1
	je _error

	mov rdi, [r13 + r11]
	mov rsi, 0x0d
	call _ft_cmp
	cmp rax, 1
	je _error

	jmp _iter_3

_error:
	mov rax, 0
	jmp _return
