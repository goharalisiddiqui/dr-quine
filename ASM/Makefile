NAME = Colleen Grace Sully

NASM ?= nasm
ifeq ($(shell which nasm 2>/dev/null),)
NASM = /tmp/bin/nasm
endif

NASMFLAGS = -f elf64

CC ?= gcc
LDFLAGS = -no-pie

SRCS_COLLEEN = Colleen.s
SRCS_GRACE = Grace.s
SRCS_SULLY = Sully.s

OBJS_COLLEEN = $(SRCS_COLLEEN:.s=.o)
OBJS_GRACE = $(SRCS_GRACE:.s=.o)
OBJS_SULLY = $(SRCS_SULLY:.s=.o)

all: $(NAME)

Colleen: $(OBJS_COLLEEN)
	$(CC) $(LDFLAGS) -o $@ $^

Grace: $(OBJS_GRACE)
	$(CC) $(LDFLAGS) -o $@ $^

Sully: $(OBJS_SULLY)
	$(CC) $(LDFLAGS) -o $@ $^

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	rm -f $(OBJS_COLLEEN) $(OBJS_GRACE) $(OBJS_SULLY)

fclean: clean
	rm -f $(NAME) Grace_kid.s tmp_* Sully_*

re: fclean all

.PHONY: all clean fclean re
