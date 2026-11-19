; Grace Quine
default rel
extern dprintf
extern strlen

%define FNAME 71, 114, 97, 99, 101, 95, 107, 105, 100, 46, 115, 0
%define FLAGS 577
%macro RUN 0
global main
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
	mov rax, 2
	lea rdi, [fname]
	mov rsi, FLAGS
	mov rdx, 0644o
	syscall
	mov r12, rax
	lea rbx, [lines]
	mov r13d, 0
.l1:
	cmp r13d, 92
	jge .l_arr
	mov rdi, r12
	lea rsi, [fmt_line]
	mov rdx, rbx
	xor eax, eax
	call dprintf
	mov rdi, rbx
	call strlen
	lea rbx, [rbx + rax + 1]
	inc r13d
	jmp .l1

.l_arr:
	lea r15, [lines]
	mov r14d, 0
.l2:
	cmp r14d, 95
	jge .l3
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

.l3:
	cmp r13d, 95
	jge .done
	mov rdi, r12
	lea rsi, [fmt_line]
	mov rdx, rbx
	xor eax, eax
	call dprintf
	mov rdi, rbx
	call strlen
	lea rbx, [rbx + rax + 1]
	inc r13d
	jmp .l3

.done:
	mov rax, 3
	mov rdi, r12
	syscall
	add rsp, 8
	pop r15
	pop r14
	pop rbx
	pop r13
	pop r12
	xor eax, eax
	leave
	ret
section .data
fname db FNAME
fmt_line db 37, 115, 10, 0
fmt_entry db 9, 100, 98, 32, 37, 99, 37, 115, 37, 99, 44, 32, 48, 10, 0
lines:
	db "; Grace Quine", 0
	db "default rel", 0
	db "extern dprintf", 0
	db "extern strlen", 0
	db "", 0
	db "%define FNAME 71, 114, 97, 99, 101, 95, 107, 105, 100, 46, 115, 0", 0
	db "%define FLAGS 577", 0
	db "%macro RUN 0", 0
	db "global main", 0
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
	db "	mov rax, 2", 0
	db "	lea rdi, [fname]", 0
	db "	mov rsi, FLAGS", 0
	db "	mov rdx, 0644o", 0
	db "	syscall", 0
	db "	mov r12, rax", 0
	db "	lea rbx, [lines]", 0
	db "	mov r13d, 0", 0
	db ".l1:", 0
	db "	cmp r13d, 92", 0
	db "	jge .l_arr", 0
	db "	mov rdi, r12", 0
	db "	lea rsi, [fmt_line]", 0
	db "	mov rdx, rbx", 0
	db "	xor eax, eax", 0
	db "	call dprintf", 0
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
	db "	cmp r14d, 95", 0
	db "	jge .l3", 0
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
	db ".l3:", 0
	db "	cmp r13d, 95", 0
	db "	jge .done", 0
	db "	mov rdi, r12", 0
	db "	lea rsi, [fmt_line]", 0
	db "	mov rdx, rbx", 0
	db "	xor eax, eax", 0
	db "	call dprintf", 0
	db "	mov rdi, rbx", 0
	db "	call strlen", 0
	db "	lea rbx, [rbx + rax + 1]", 0
	db "	inc r13d", 0
	db "	jmp .l3", 0
	db "", 0
	db ".done:", 0
	db "	mov rax, 3", 0
	db "	mov rdi, r12", 0
	db "	syscall", 0
	db "	add rsp, 8", 0
	db "	pop r15", 0
	db "	pop r14", 0
	db "	pop rbx", 0
	db "	pop r13", 0
	db "	pop r12", 0
	db "	xor eax, eax", 0
	db "	leave", 0
	db "	ret", 0
	db "section .data", 0
	db "fname db FNAME", 0
	db "fmt_line db 37, 115, 10, 0", 0
	db "fmt_entry db 9, 100, 98, 32, 37, 99, 37, 115, 37, 99, 44, 32, 48, 10, 0", 0
	db "lines:", 0
	db "%endmacro", 0
	db "", 0
	db "RUN", 0
%endmacro

RUN
