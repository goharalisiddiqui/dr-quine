default rel
global main
extern dprintf
extern sprintf
extern strlen
extern system
extern strstr

section .data
	i dd 5
	fname_fmt db 83, 117, 108, 108, 121, 95, 37, 100, 46, 115, 0
	cmd_compile db 80, 65, 84, 72, 61, 47, 116, 109, 112, 47, 98, 105, 110, 58, 36, 80, 65, 84, 72, 32, 110, 97, 115, 109, 32, 45, 102, 32, 101, 108, 102, 54, 52, 32, 83, 117, 108, 108, 121, 95, 37, 49, 36, 100, 46, 115, 32, 45, 111, 32, 83, 117, 108, 108, 121, 95, 37, 49, 36, 100, 46, 111, 32, 38, 38, 32, 103, 99, 99, 32, 45, 110, 111, 45, 112, 105, 101, 32, 83, 117, 108, 108, 121, 95, 37, 49, 36, 100, 46, 111, 32, 45, 111, 32, 83, 117, 108, 108, 121, 95, 37, 49, 36, 100, 32, 38, 38, 32, 114, 109, 32, 45, 102, 32, 83, 117, 108, 108, 121, 95, 37, 49, 36, 100, 46, 111, 0
	cmd_exec db 46, 47, 83, 117, 108, 108, 121, 95, 37, 100, 0
	file db __FILE__, 0
	prefix db 83, 117, 108, 108, 121, 95, 0
	fmt_line db 37, 115, 10, 0
	fmt_i db 9, 105, 32, 100, 100, 32, 37, 100, 10, 0
	fmt_entry db 9, 100, 98, 32, 37, 99, 37, 115, 37, 99, 44, 32, 48, 10, 0

section .bss
	fname resb 64
	cmd resb 256

section .text
main:
	push rbp
	mov rbp, rsp
	push r12
	push r13
	push rbx
	push r14
	push r15
	sub rsp, 8
	lea rdi, [file]
	lea rsi, [prefix]
	call strstr
	test rax, rax
	jz .check
	dec dword [i]

.check:
	cmp dword [i], 0
	jl .exit
	lea rdi, [fname]
	lea rsi, [fname_fmt]
	mov edx, [i]
	xor eax, eax
	call sprintf
	mov rax, 2
	lea rdi, [fname]
	mov rsi, 577
	mov rdx, 0644o
	syscall
	mov r12, rax
	lea rbx, [lines]
	mov r13d, 0
.l1:
	cmp r13d, 132
	jge .l_arr
	cmp r13d, 9
	jne .not_i
	mov rdi, r12
	lea rsi, [fmt_i]
	mov edx, [i]
	xor eax, eax
	call dprintf
	jmp .next_l1
.not_i:
	mov rdi, r12
	lea rsi, [fmt_line]
	mov rdx, rbx
	xor eax, eax
	call dprintf
.next_l1:
	mov rdi, rbx
	call strlen
	lea rbx, [rbx + rax + 1]
	inc r13d
	jmp .l1

.l_arr:
	lea r15, [lines]
	mov r14d, 0
.l2:
	cmp r14d, 132
	jge .compile
	mov rdi, r12
	lea rsi, [fmt_entry]
	mov rdx, 34
	mov rcx, r15
	mov r8, 34
	xor eax, eax
	call dprintf
	mov rdi, r15
	call strlen
	lea r15, [r15 + rax + 1]
	inc r14d
	jmp .l2

.compile:
	mov rax, 3
	mov rdi, r12
	syscall
	lea rdi, [cmd]
	lea rsi, [cmd_compile]
	mov edx, [i]
	xor eax, eax
	call sprintf
	lea rdi, [cmd]
	call system
	cmp dword [i], 0
	jle .exit
	lea rdi, [cmd]
	lea rsi, [cmd_exec]
	mov edx, [i]
	xor eax, eax
	call sprintf
	lea rdi, [cmd]
	call system

.exit:
	add rsp, 8
	pop r15
	pop r14
	pop rbx
	pop r13
	pop r12
	xor eax, eax
	leave
	ret

lines:
	db "default rel", 0
	db "global main", 0
	db "extern dprintf", 0
	db "extern sprintf", 0
	db "extern strlen", 0
	db "extern system", 0
	db "extern strstr", 0
	db "", 0
	db "section .data", 0
	db "	i dd 5", 0
	db "	fname_fmt db 83, 117, 108, 108, 121, 95, 37, 100, 46, 115, 0", 0
	db "	cmd_compile db 80, 65, 84, 72, 61, 47, 116, 109, 112, 47, 98, 105, 110, 58, 36, 80, 65, 84, 72, 32, 110, 97, 115, 109, 32, 45, 102, 32, 101, 108, 102, 54, 52, 32, 83, 117, 108, 108, 121, 95, 37, 49, 36, 100, 46, 115, 32, 45, 111, 32, 83, 117, 108, 108, 121, 95, 37, 49, 36, 100, 46, 111, 32, 38, 38, 32, 103, 99, 99, 32, 45, 110, 111, 45, 112, 105, 101, 32, 83, 117, 108, 108, 121, 95, 37, 49, 36, 100, 46, 111, 32, 45, 111, 32, 83, 117, 108, 108, 121, 95, 37, 49, 36, 100, 32, 38, 38, 32, 114, 109, 32, 45, 102, 32, 83, 117, 108, 108, 121, 95, 37, 49, 36, 100, 46, 111, 0", 0
	db "	cmd_exec db 46, 47, 83, 117, 108, 108, 121, 95, 37, 100, 0", 0
	db "	file db __FILE__, 0", 0
	db "	prefix db 83, 117, 108, 108, 121, 95, 0", 0
	db "	fmt_line db 37, 115, 10, 0", 0
	db "	fmt_i db 9, 105, 32, 100, 100, 32, 37, 100, 10, 0", 0
	db "	fmt_entry db 9, 100, 98, 32, 37, 99, 37, 115, 37, 99, 44, 32, 48, 10, 0", 0
	db "", 0
	db "section .bss", 0
	db "	fname resb 64", 0
	db "	cmd resb 256", 0
	db "", 0
	db "section .text", 0
	db "main:", 0
	db "	push rbp", 0
	db "	mov rbp, rsp", 0
	db "	push r12", 0
	db "	push r13", 0
	db "	push rbx", 0
	db "	push r14", 0
	db "	push r15", 0
	db "	sub rsp, 8", 0
	db "	lea rdi, [file]", 0
	db "	lea rsi, [prefix]", 0
	db "	call strstr", 0
	db "	test rax, rax", 0
	db "	jz .check", 0
	db "	dec dword [i]", 0
	db "", 0
	db ".check:", 0
	db "	cmp dword [i], 0", 0
	db "	jl .exit", 0
	db "	lea rdi, [fname]", 0
	db "	lea rsi, [fname_fmt]", 0
	db "	mov edx, [i]", 0
	db "	xor eax, eax", 0
	db "	call sprintf", 0
	db "	mov rax, 2", 0
	db "	lea rdi, [fname]", 0
	db "	mov rsi, 577", 0
	db "	mov rdx, 0644o", 0
	db "	syscall", 0
	db "	mov r12, rax", 0
	db "	lea rbx, [lines]", 0
	db "	mov r13d, 0", 0
	db ".l1:", 0
	db "	cmp r13d, 132", 0
	db "	jge .l_arr", 0
	db "	cmp r13d, 9", 0
	db "	jne .not_i", 0
	db "	mov rdi, r12", 0
	db "	lea rsi, [fmt_i]", 0
	db "	mov edx, [i]", 0
	db "	xor eax, eax", 0
	db "	call dprintf", 0
	db "	jmp .next_l1", 0
	db ".not_i:", 0
	db "	mov rdi, r12", 0
	db "	lea rsi, [fmt_line]", 0
	db "	mov rdx, rbx", 0
	db "	xor eax, eax", 0
	db "	call dprintf", 0
	db ".next_l1:", 0
	db "	mov rdi, rbx", 0
	db "	call strlen", 0
	db "	lea rbx, [rbx + rax + 1]", 0
	db "	inc r13d", 0
	db "	jmp .l1", 0
	db "", 0
	db ".l_arr:", 0
	db "	lea r15, [lines]", 0
	db "	mov r14d, 0", 0
	db ".l2:", 0
	db "	cmp r14d, 132", 0
	db "	jge .compile", 0
	db "	mov rdi, r12", 0
	db "	lea rsi, [fmt_entry]", 0
	db "	mov rdx, 34", 0
	db "	mov rcx, r15", 0
	db "	mov r8, 34", 0
	db "	xor eax, eax", 0
	db "	call dprintf", 0
	db "	mov rdi, r15", 0
	db "	call strlen", 0
	db "	lea r15, [r15 + rax + 1]", 0
	db "	inc r14d", 0
	db "	jmp .l2", 0
	db "", 0
	db ".compile:", 0
	db "	mov rax, 3", 0
	db "	mov rdi, r12", 0
	db "	syscall", 0
	db "	lea rdi, [cmd]", 0
	db "	lea rsi, [cmd_compile]", 0
	db "	mov edx, [i]", 0
	db "	xor eax, eax", 0
	db "	call sprintf", 0
	db "	lea rdi, [cmd]", 0
	db "	call system", 0
	db "	cmp dword [i], 0", 0
	db "	jle .exit", 0
	db "	lea rdi, [cmd]", 0
	db "	lea rsi, [cmd_exec]", 0
	db "	mov edx, [i]", 0
	db "	xor eax, eax", 0
	db "	call sprintf", 0
	db "	lea rdi, [cmd]", 0
	db "	call system", 0
	db "", 0
	db ".exit:", 0
	db "	add rsp, 8", 0
	db "	pop r15", 0
	db "	pop r14", 0
	db "	pop rbx", 0
	db "	pop r13", 0
	db "	pop r12", 0
	db "	xor eax, eax", 0
	db "	leave", 0
	db "	ret", 0
	db "", 0
	db "lines:", 0
