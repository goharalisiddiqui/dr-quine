all:
	@$(MAKE) -C C
	@$(MAKE) -C ASM

c:
	@$(MAKE) -C C

asm:
	@$(MAKE) -C ASM

clean:
	@$(MAKE) -C C clean
	@$(MAKE) -C ASM clean

fclean:
	@$(MAKE) -C C fclean
	@$(MAKE) -C ASM fclean

re: fclean all

test:
	@echo "=== Testing C Part ==="
	@cd C && $(MAKE) re
	@echo "[Testing C Colleen]"
	@cd C && ./Colleen > tmp_Colleen && diff -u Colleen.c tmp_Colleen && echo "Colleen (C): OK (source output identical)"
	@echo "[Testing C Grace]"
	@cd C && ./Grace && diff -u Grace.c Grace_kid.c && echo "Grace (C): OK (source output identical)"
	@echo "[Testing C Sully]"
	@rm -rf /tmp/test_sully_c && mkdir -p /tmp/test_sully_c && cd /tmp/test_sully_c && (clang -Wall -Wextra -Werror $(CURDIR)/C/Sully.c -o Sully 2>/dev/null || gcc -Wall -Wextra -Werror $(CURDIR)/C/Sully.c -o Sully)
	@cd /tmp/test_sully_c && ./Sully
	@echo "Diff Sully.c vs Sully_0.c (expecting 1c1: i = 5 vs i = 0):"
	@-diff $(CURDIR)/C/Sully.c /tmp/test_sully_c/Sully_0.c
	@echo "Diff Sully_3.c vs Sully_2.c (expecting 1c1: i = 3 vs i = 2):"
	@-diff /tmp/test_sully_c/Sully_3.c /tmp/test_sully_c/Sully_2.c
	@echo "Total Sully files generated: $$(ls -1 /tmp/test_sully_c | grep Sully | wc -l) (expected: 13)"
	@test $$(ls -1 /tmp/test_sully_c | grep Sully | wc -l) -eq 13 && echo "Sully (C): OK"
	@rm -rf /tmp/test_sully_c
	@$(MAKE) -C C fclean
	@echo ""
	@echo "=== Testing ASM Part ==="
	@cd ASM && $(MAKE) re
	@echo "[Testing ASM Colleen]"
	@cd ASM && ./Colleen > tmp_Colleen && diff -u Colleen.s tmp_Colleen && echo "Colleen (ASM): OK (source output identical)"
	@echo "[Testing ASM Grace]"
	@cd ASM && ./Grace && diff -u Grace.s Grace_kid.s && echo "Grace (ASM): OK (source output identical)"
	@echo "[Testing ASM Sully]"
	@rm -rf /tmp/test_sully_asm && mkdir -p /tmp/test_sully_asm && cd /tmp/test_sully_asm && (which nasm >/dev/null 2>&1 && nasm -f elf64 $(CURDIR)/ASM/Sully.s -o Sully.o || /tmp/bin/nasm -f elf64 $(CURDIR)/ASM/Sully.s -o Sully.o) && gcc -no-pie Sully.o -o Sully && rm -f Sully.o
	@cd /tmp/test_sully_asm && ./Sully
	@echo "Diff Sully.s vs Sully_0.s (expecting 9c9: i = 5 vs i = 0):"
	@-diff $(CURDIR)/ASM/Sully.s /tmp/test_sully_asm/Sully_0.s
	@echo "Diff Sully_3.s vs Sully_2.s (expecting 9c9: i = 3 vs i = 2):"
	@-diff /tmp/test_sully_asm/Sully_3.s /tmp/test_sully_asm/Sully_2.s
	@echo "Total Sully files generated: $$(ls -1 /tmp/test_sully_asm | grep Sully | wc -l) (expected: 13)"
	@test $$(ls -1 /tmp/test_sully_asm | grep Sully | wc -l) -eq 13 && echo "Sully (ASM): OK"
	@rm -rf /tmp/test_sully_asm
	@$(MAKE) -C ASM fclean
	@echo ""
	@echo "=== ALL TESTS PASSED SUCCESSFULLY! ==="

.PHONY: all c asm clean fclean re test
