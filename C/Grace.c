/*
	Grace Quine
*/
#include <stdio.h>

#define FILENAME "Grace_kid.c"
#define STR "/*%1$c	Grace Quine%1$c*/%1$c#include <stdio.h>%1$c%1$c#define FILENAME %2$cGrace_kid.c%2$c%1$c#define STR %2$c%3$s%2$c%1$c#define EXEC() int main(void) { FILE *f = fopen(FILENAME, %2$cw%2$c); if (f) { fprintf(f, STR, 10, 34, STR); fclose(f); } return (0); }%1$c%1$cEXEC()%1$c"
#define EXEC() int main(void) { FILE *f = fopen(FILENAME, "w"); if (f) { fprintf(f, STR, 10, 34, STR); fclose(f); } return (0); }

EXEC()
