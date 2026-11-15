int i = 5;
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
	char *s = "int i = %4$d;%1$c#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c%1$cint main(void)%1$c{%1$c	char *s = %2$c%5$s%2$c;%1$c	char *base = strrchr(__FILE__, %3$c/%3$c);%1$c	base = base ? base + 1 : __FILE__;%1$c	if (strncmp(base, %2$cSully_%2$c, 6) == 0)%1$c		i--;%1$c	if (i < 0)%1$c		return (0);%1$c	char fname[64];%1$c	char cmd[256];%1$c	snprintf(fname, sizeof(fname), %2$cSully_%%d.c%2$c, i);%1$c	FILE *f = fopen(fname, %2$cw%2$c);%1$c	if (!f)%1$c		return (1);%1$c	fprintf(f, s, 10, 34, 39, i, s);%1$c	fclose(f);%1$c	char *compiler = system(%2$cwhich clang >/dev/null 2>&1%2$c) == 0 ? %2$cclang%2$c : %2$cgcc%2$c;%1$c	snprintf(cmd, sizeof(cmd), %2$c%%s -Wall -Wextra -Werror -o Sully_%%d Sully_%%d.c%2$c, compiler, i, i);%1$c	system(cmd);%1$c	if (i > 0)%1$c	{%1$c		snprintf(cmd, sizeof(cmd), %2$c./Sully_%%d%2$c, i);%1$c		system(cmd);%1$c	}%1$c	return (0);%1$c}%1$c";
	char *base = strrchr(__FILE__, '/');
	base = base ? base + 1 : __FILE__;
	if (strncmp(base, "Sully_", 6) == 0)
		i--;
	if (i < 0)
		return (0);
	char fname[64];
	char cmd[256];
	snprintf(fname, sizeof(fname), "Sully_%d.c", i);
	FILE *f = fopen(fname, "w");
	if (!f)
		return (1);
	fprintf(f, s, 10, 34, 39, i, s);
	fclose(f);
	char *compiler = system("which clang >/dev/null 2>&1") == 0 ? "clang" : "gcc";
	snprintf(cmd, sizeof(cmd), "%s -Wall -Wextra -Werror -o Sully_%d Sully_%d.c", compiler, i, i);
	system(cmd);
	if (i > 0)
	{
		snprintf(cmd, sizeof(cmd), "./Sully_%d", i);
		system(cmd);
	}
	return (0);
}
