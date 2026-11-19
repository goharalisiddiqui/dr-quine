; Comment outside
default rel
global main
extern puts
extern putchar
extern strlen
extern printf

section .text
print_source:
	push rbp
	mov rbp, rsp
	push r12
	push r13
	push rbx
	push r14
	lea r12, [lines]
	mov r13d, 0
.loop1:
	cmp r13d, 69
	jge .print_array
	mov rdi, r12
	call puts
	mov rdi, r12
	call strlen
	lea r12, [r12 + rax + 1]
	inc r13d
	jmp .loop1

.print_array:
	lea rbx, [lines]
	mov r14d, 0
.loop_arr:
	cmp r14d, 69
	jge .done
	mov rdi, 9
	call putchar
	lea rdi, [fmt_entry]
	mov rsi, 34
	mov rdx, rbx
	mov rcx, 34
	xor eax, eax
	call printf
	mov rdi, rbx
	call strlen
	lea rbx, [rbx + rax + 1]
	inc r14d
	jmp .loop_arr

.done:
	pop r14
	pop rbx
	pop r13
	pop r12
	leave
	ret

main:
	; Comment inside main
	push rbp
	mov rbp, rsp
	call print_source
	xor eax, eax
	leave
	ret

section .data
fmt_entry db 100, 98, 32, 37, 99, 37, 115, 37, 99, 44, 32, 48, 10, 0
lines:
	db "; Comment outside", 0
	db "default rel", 0
	db "global main", 0
	db "extern puts", 0
	db "extern putchar", 0
	db "extern strlen", 0
	db "extern printf", 0
	db "", 0
	db "section .text", 0
	db "print_source:", 0
	db "	push rbp", 0
	db "	mov rbp, rsp", 0
	db "	push r12", 0
	db "	push r13", 0
	db "	push rbx", 0
	db "	push r14", 0
	db "	lea r12, [lines]", 0
	db "	mov r13d, 0", 0
	db ".loop1:", 0
	db "	cmp r13d, 69", 0
	db "	jge .print_array", 0
	db "	mov rdi, r12", 0
	db "	call puts", 0
	db "	mov rdi, r12", 0
	db "	call strlen", 0
	db "	lea r12, [r12 + rax + 1]", 0
	db "	inc r13d", 0
	db "	jmp .loop1", 0
	db "", 0
	db ".print_array:", 0
	db "	lea rbx, [lines]", 0
	db "	mov r14d, 0", 0
	db ".loop_arr:", 0
	db "	cmp r14d, 69", 0
	db "	jge .done", 0
	db "	mov rdi, 9", 0
	db "	call putchar", 0
	db "	lea rdi, [fmt_entry]", 0
	db "	mov rsi, 34", 0
	db "	mov rdx, rbx", 0
	db "	mov rcx, 34", 0
	db "	xor eax, eax", 0
	db "	call printf", 0
	db "	mov rdi, rbx", 0
	db "	call strlen", 0
	db "	lea rbx, [rbx + rax + 1]", 0
	db "	inc r14d", 0
	db "	jmp .loop_arr", 0
	db "", 0
	db ".done:", 0
	db "	pop r14", 0
	db "	pop rbx", 0
	db "	pop r13", 0
	db "	pop r12", 0
	db "	leave", 0
	db "	ret", 0
	db "", 0
	db "main:", 0
	db "	; Comment inside main", 0
	db "	push rbp", 0
	db "	mov rbp, rsp", 0
	db "	call print_source", 0
	db "	xor eax, eax", 0
	db "	leave", 0
	db "	ret", 0
	db "", 0
	db "section .data", 0
	db "fmt_entry db 100, 98, 32, 37, 99, 37, 115, 37, 99, 44, 32, 48, 10, 0", 0
	db "lines:", 0
