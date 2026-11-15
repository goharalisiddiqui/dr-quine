; This comment is outside of the program
global main
extern printf

section .data
	s db "; This comment is outside of the program%1$cglobal main%1$cextern printf%1$c%1$csection .data%1$c	s db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cprint_source:%1$c	push rbp%1$c	mov rbp, rsp%1$c	mov rdi, s%1$c	mov rsi, 10%1$c	mov rdx, 34%1$c	mov rcx, s%1$c	xor eax, eax%1$c	call printf%1$c	leave%1$c	ret%1$c%1$cmain:%1$c	; This comment is inside the main function%1$c	push rbp%1$c	mov rbp, rsp%1$c	call print_source%1$c	xor eax, eax%1$c	leave%1$c	ret%1$c", 0

section .text
print_source:
	push rbp
	mov rbp, rsp
	mov rdi, s
	mov rsi, 10
	mov rdx, 34
	mov rcx, s
	xor eax, eax
	call printf
	leave
	ret

main:
	; This comment is inside the main function
	push rbp
	mov rbp, rsp
	call print_source
	xor eax, eax
	leave
	ret
