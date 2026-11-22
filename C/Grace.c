/*
	Grace Quine
*/
#include <stdio.h>

#define FILENAME "Grace_kid.c"
#define STR "/*%c	Grace Quine%c*/%c#include <stdio.h>%c%c#define FILENAME %cGrace_kid.c%c%c#define STR %c%s%c%c#define EXEC() int main(void) { FILE *f = fopen(FILENAME, %cw%c); if (f) { fprintf(f, STR, 10, 10, 10, 10, 10, 34, 34, 10, 34, STR, 34, 10, 34, 34, 10, 10, 10); fclose(f); } return (0); }%c%cEXEC()%c"
#define EXEC() int main(void) { FILE *f = fopen(FILENAME, "w"); if (f) { fprintf(f, STR, 10, 10, 10, 10, 10, 34, 34, 10, 34, STR, 34, 10, 34, 34, 10, 10, 10); fclose(f); } return (0); }

EXEC()
