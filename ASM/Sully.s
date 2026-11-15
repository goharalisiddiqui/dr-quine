default rel
global main
extern dprintf
extern sprintf
extern system
extern strstr

section .data
	i dd 5
	file db __FILE__, 0
	prefix db "Sully_", 0
	fname_fmt db "Sully_%d.s", 0
	cmd_compile db "PATH=/tmp/bin:$PATH nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && gcc -no-pie Sully_%1$d.o -o Sully_%1$d && rm -f Sully_%1$d.o", 0
	cmd_exec db "./Sully_%d", 0
	fmt db "default rel%1$cglobal main%1$cextern dprintf%1$cextern sprintf%1$cextern system%1$cextern strstr%1$c%1$csection .data%1$c	i dd %3$d%1$c	file db __FILE__, 0%1$c	prefix db %2$cSully_%2$c, 0%1$c	fname_fmt db %2$cSully_%%d.s%2$c, 0%1$c	cmd_compile db %2$cPATH=/tmp/bin:$PATH nasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && gcc -no-pie Sully_%%1$d.o -o Sully_%%1$d && rm -f Sully_%%1$d.o%2$c, 0%1$c	cmd_exec db %2$c./Sully_%%d%2$c, 0%1$c	fmt db %2$c%4$s%2$c, 0%1$c%1$csection .bss%1$c	fname resb 64%1$c	cmd resb 256%1$c%1$csection .text%1$cmain:%1$c	push rbp%1$c	mov rbp, rsp%1$c	lea rdi, [file]%1$c	lea rsi, [prefix]%1$c	call strstr%1$c	test rax, rax%1$c	jz .check_stop%1$c	dec dword [i]%1$c%1$c.check_stop:%1$c	cmp dword [i], 0%1$c	jl .exit%1$c	lea rdi, [fname]%1$c	lea rsi, [fname_fmt]%1$c	mov edx, [i]%1$c	xor eax, eax%1$c	call sprintf%1$c	mov rax, 2%1$c	lea rdi, [fname]%1$c	mov rsi, 577%1$c	mov rdx, 0644o%1$c	syscall%1$c	mov r12, rax%1$c	mov rdi, r12%1$c	lea rsi, [fmt]%1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	mov r8d, [i]%1$c	lea r9, [fmt]%1$c	xor eax, eax%1$c	call dprintf%1$c	mov rax, 3%1$c	mov rdi, r12%1$c	syscall%1$c	lea rdi, [cmd]%1$c	lea rsi, [cmd_compile]%1$c	mov edx, [i]%1$c	xor eax, eax%1$c	call sprintf%1$c	lea rdi, [cmd]%1$c	call system%1$c	cmp dword [i], 0%1$c	jle .exit%1$c	lea rdi, [cmd]%1$c	lea rsi, [cmd_exec]%1$c	mov edx, [i]%1$c	xor eax, eax%1$c	call sprintf%1$c	lea rdi, [cmd]%1$c	call system%1$c%1$c.exit:%1$c	xor eax, eax%1$c	leave%1$c	ret%1$c", 0

section .bss
	fname resb 64
	cmd resb 256

section .text
main:
	push rbp
	mov rbp, rsp
	lea rdi, [file]
	lea rsi, [prefix]
	call strstr
	test rax, rax
	jz .check_stop
	dec dword [i]

.check_stop:
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
	mov rdi, r12
	lea rsi, [fmt]
	mov rdx, 10
	mov rcx, 34
	mov r8d, [i]
	lea r9, [fmt]
	xor eax, eax
	call dprintf
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
	xor eax, eax
	leave
	ret
