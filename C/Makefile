NAME = Colleen Grace Sully

CC ?= clang
ifeq ($(shell which clang 2>/dev/null),)
CC = gcc
endif

CFLAGS = -Wall -Wextra -Werror

SRCS_COLLEEN = Colleen.c
SRCS_GRACE = Grace.c
SRCS_SULLY = Sully.c

OBJS_COLLEEN = $(SRCS_COLLEEN:.c=.o)
OBJS_GRACE = $(SRCS_GRACE:.c=.o)
OBJS_SULLY = $(SRCS_SULLY:.c=.o)

all: $(NAME)

Colleen: $(OBJS_COLLEEN)
	$(CC) $(CFLAGS) -o $@ $^

Grace: $(OBJS_GRACE)
	$(CC) $(CFLAGS) -o $@ $^

Sully: $(OBJS_SULLY)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS_COLLEEN) $(OBJS_GRACE) $(OBJS_SULLY)

fclean: clean
	rm -f $(NAME) Grace_kid.c tmp_* Sully_*

re: fclean all

.PHONY: all clean fclean re
