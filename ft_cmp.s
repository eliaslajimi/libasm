global _ft_cmp
_ft_cmp:
	push r12
	push r13

	xor r12, r12
	xor r13, r13
	xor rax, rax
	mov r12, rdi
	mov r13, rsi
	mov rax, 0
	
	cmp r12b, r13b
	je _is_equal
_return:
	pop r13
	pop r12
	ret
_is_equal:
	mov rax, 1
	jmp _return 
