extern ___error
global _ft_write

_ft_write:
	mov		rax, 0x02000004
	syscall
	jc		error ;catch error with jc flag
	ret
error:
	push	r12 ;push register to the stack
	mov		r12, rax ;retain returned syscall
	call	___error ;call errno C extern func
	mov		qword[rax], r12 ;mov returned value to pointer
	mov		rax, -1	;mov -1 to return value
	pop		r12 ;dont forget to pop back
	ret
