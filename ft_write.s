global _ft_write

_ft_write:
	mov	rax, 0x02000004
	syscall
	jnc	error
	ret
error:
	xor	rax, rax
	mov	rax, -1
	ret
