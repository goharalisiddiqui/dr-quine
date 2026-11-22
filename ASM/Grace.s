; Grace Quine
default rel
extern dprintf

%define FILENAME "Grace_kid.s", 0
%define STR "; Grace Quine%cdefault rel%cextern dprintf%c%c%%define FILENAME %cGrace_kid.s%c, 0%c%%define STR %c%s%c, 0%c%%macro RUN 0%cglobal main%csection .data%c	filename db FILENAME%c	fmt db STR%csection .text%cmain:%c	push rbp%c	mov rbp, rsp%c	mov rax, 2%c	lea rdi, [filename]%c	mov rsi, 577%c	mov rdx, 0644o%c	syscall%c	mov r12, rax%c	%%rep 44%c	push 10%c	%%endrep%c	push 34%c	lea rax, [fmt]%c	push rax%c	push 34%c	push 10%c	push 34%c	push 34%c	mov rdi, r12%c	lea rsi, [fmt]%c	mov edx, 10%c	mov ecx, 10%c	mov r8d, 10%c	mov r9d, 10%c	xor eax, eax%c	call dprintf%c	add rsp, 400%c	mov rax, 3%c	mov rdi, r12%c	syscall%c	xor eax, eax%c	leave%c	ret%c%%endmacro%c%cRUN%c", 0
%macro RUN 0
global main
section .data
	filename db FILENAME
	fmt db STR
section .text
main:
	push rbp
	mov rbp, rsp
	mov rax, 2
	lea rdi, [filename]
	mov rsi, 577
	mov rdx, 0644o
	syscall
	mov r12, rax
	%rep 44
	push 10
	%endrep
	push 34
	lea rax, [fmt]
	push rax
	push 34
	push 10
	push 34
	push 34
	mov rdi, r12
	lea rsi, [fmt]
	mov edx, 10
	mov ecx, 10
	mov r8d, 10
	mov r9d, 10
	xor eax, eax
	call dprintf
	add rsp, 400
	mov rax, 3
	mov rdi, r12
	syscall
	xor eax, eax
	leave
	ret
%endmacro

RUN
