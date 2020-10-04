global _ft_strcpy

_ft_strcpy:		
	push	rbx
	push	rcx
	xor	rdx, rdx
	mov	rcx, -1
	mov	rax, rdi;the dest
	mov	rbx, rsi;the src

loop:	
	inc	rcx	
	mov	dl, BYTE[rbx+rcx]
	mov	BYTE[rcx+rax], dl 
	cmp	BYTE[rbx+rcx], 0 
	jne	loop	
	pop	rcx
	pop	rbx
	ret
