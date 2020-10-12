global _ft_isspace
_ft_isspace:
	mov rax, 0
_cmp:
	cmp dil, 9
	je _isspace
	cmp dil, 10
	je _isspace
	cmp dil, 11
	je _isspace
	cmp dil, 12
	je _isspace
	cmp dil, 13
	je _isspace
	cmp dil, 32
	je _isspace

_return:
	ret

_isspace:
	mov rax, 1
	jmp _return
