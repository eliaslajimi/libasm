extern _ft_list_swap
global _ft_list_sort

_ft_list_sort:
	push r12
	push r13
	push r14
	push rbx
	
	mov rdi, [rdi]
	mov r12, rdi
	mov r13, rdi
	mov r14, rsi
	mov rbx, rdi

_bubbleSort:
	cmp r12, 0
	je _return

_loop:
 	cmp r13, 0
	je _inc

_cmp:
	mov rdi, [r12]
	mov rsi, [r13]
	call r14
	test eax, eax ;more efficient than cmp
	jl _swap
	mov r13, QWORD [r13 +  8]
	jmp _loop

_inc:
	mov r12, QWORD[r12 + 8]	
	mov r13, rbx
	jmp _bubbleSort

_return:
	pop rbx
	pop r14
	pop r13
	pop r12
	ret

_swap:
	mov rsi, r12
	mov rdi, r13
	call _ft_list_swap
	mov r13, QWORD [r13 +  8]
	jmp _loop
