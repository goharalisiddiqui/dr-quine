; Comment outside
default rel
global main
extern putchar

section .data
	s db `; Comment outside\ndefault rel\nglobal main\nextern putchar\n\nsection .data\n	s db @, 0\n\nsection .text\nprint_source:\n	push rbp\n	mov rbp, rsp\n	push r12\n	push r13\n	lea r12, [s]\n.outer:\n	movzx eax, byte [r12]\n	test al, al\n	jz .done\n	cmp al, 64\n	je .at_sign\n	mov edi, eax\n	call putchar\n	inc r12\n	jmp .outer\n\n.at_sign:\n	mov edi, 96\n	call putchar\n	lea r13, [s]\n.inner:\n	movzx eax, byte [r13]\n	test al, al\n	jz .inner_done\n	cmp al, 10\n	je .esc_nl\n	cmp al, 96\n	je .esc_ch\n	cmp al, 92\n	je .esc_ch\n	mov edi, eax\n	call putchar\n	jmp .inner_next\n\n.esc_nl:\n	mov edi, 92\n	call putchar\n	mov edi, 110\n	call putchar\n	jmp .inner_next\n\n.esc_ch:\n	mov edi, 92\n	call putchar\n	movzx edi, byte [r13]\n	call putchar\n\n.inner_next:\n	inc r13\n	jmp .inner\n\n.inner_done:\n	mov edi, 96\n	call putchar\n	inc r12\n	jmp .outer\n\n.done:\n	pop r13\n	pop r12\n	leave\n	ret\n\nmain:\n	; Comment inside main\n	push rbp\n	mov rbp, rsp\n	call print_source\n	xor eax, eax\n	leave\n	ret\n`, 0

section .text
print_source:
	push rbp
	mov rbp, rsp
	push r12
	push r13
	lea r12, [s]
.outer:
	movzx eax, byte [r12]
	test al, al
	jz .done
	cmp al, 64
	je .at_sign
	mov edi, eax
	call putchar
	inc r12
	jmp .outer

.at_sign:
	mov edi, 96
	call putchar
	lea r13, [s]
.inner:
	movzx eax, byte [r13]
	test al, al
	jz .inner_done
	cmp al, 10
	je .esc_nl
	cmp al, 96
	je .esc_ch
	cmp al, 92
	je .esc_ch
	mov edi, eax
	call putchar
	jmp .inner_next

.esc_nl:
	mov edi, 92
	call putchar
	mov edi, 110
	call putchar
	jmp .inner_next

.esc_ch:
	mov edi, 92
	call putchar
	movzx edi, byte [r13]
	call putchar

.inner_next:
	inc r13
	jmp .inner

.inner_done:
	mov edi, 96
	call putchar
	inc r12
	jmp .outer

.done:
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
