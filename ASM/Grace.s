; Grace Quine
default rel
extern dprintf

%define FILENAME "Grace_kid.s", 0
%define STR "; Grace Quine%1$cdefault rel%1$cextern dprintf%1$c%1$c%%define FILENAME %2$cGrace_kid.s%2$c, 0%1$c%%define STR %2$c%3$s%2$c, 0%1$c%%macro RUN 0%1$cglobal main%1$csection .data%1$c	filename db FILENAME%1$c	fmt db STR%1$csection .text%1$cmain:%1$c	push rbp%1$c	mov rbp, rsp%1$c	mov rax, 2%1$c	lea rdi, [filename]%1$c	mov rsi, 577%1$c	mov rdx, 0644o%1$c	syscall%1$c	mov r12, rax%1$c	mov rdi, r12%1$c	lea rsi, [fmt]%1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	lea r8, [fmt]%1$c	xor eax, eax%1$c	call dprintf%1$c	mov rax, 3%1$c	mov rdi, r12%1$c	syscall%1$c	xor eax, eax%1$c	leave%1$c	ret%1$c%%endmacro%1$c%1$cRUN%1$c", 0
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
	mov rdi, r12
	lea rsi, [fmt]
	mov rdx, 10
	mov rcx, 34
	lea r8, [fmt]
	xor eax, eax
	call dprintf
	mov rax, 3
	mov rdi, r12
	syscall
	xor eax, eax
	leave
	ret
%endmacro

RUN
