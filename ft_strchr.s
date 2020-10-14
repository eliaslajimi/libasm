extern _ft_cmp
global _ft_strchr

_ft_strchr:
	push r13
	push r14
	push r15

	mov rax, 0
	mov r15, -1
	mov r13, rdi
	mov r14, rsi

_Search:
	inc r15
	mov rdi, [r13 + r15]
	mov rsi, 0
	call _ft_cmp
	cmp rax, 1
	je _Return

	mov rdi, [r13 + r15]
	mov rsi, r14
	call _ft_cmp
	cmp rax, 1
	je _Return

	jmp _Search

_Return:
	mov rax, r15
	pop r15
	pop r14	
	pop r13
	ret
