;typedef struct s_list
;{
;struct s_list *next;
;void *data;
;}  

extern _malloc
global _ft_list_push_front

_ft_list_push_front:
	cmp rdi, 0
	je _error

	mov rax, 0
	cmp [rdi], rax
	je _error

_create_list:			
	push	r13
	mov	r13, rdi
	push	rsi
	push	rdi

	mov	rdi, sizeof_strct
	call	_malloc

	pop 	rdi
	mov	rcx, [rdi]
	mov	rcx, [rcx]
	mov	[rax], rcx

	pop	rsi
 	mov	[rax], rsi

	mov	rdx, [rdi]
	mov	[rax + sizeof_ptr], rdx

	;mov	rax, [rax]
	mov	[r13], rax
	pop 	r13
	ret

_error:
	ret

section .data
sizeof_ptr	equ 8  ;covers the size of *void 
sizeof_strct	equ 16 ;covers the size of t_list
