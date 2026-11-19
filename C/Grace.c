/*
	Grace Quine
*/
#include <stdio.h>

const char *s[] = {
	"/*",
	"	Grace Quine",
	"*/",
	"#include <stdio.h>",
	"",
	"const char *s[] = {",
	"};",
	"",
	"#define FILENAME (char[]){71,114,97,99,101,95,107,105,100,46,99,0}",
	"#define OUT(c) fputc(c, f)",
	"#define EXEC() int main(void) { FILE *f = fopen(FILENAME, (char[]){119,0}); int i; for (i = 0; i < 6; i++) { fputs(s[i], f); OUT(10); } for (i = 0; i < 13; i++) { OUT(9); OUT(34); fputs(s[i], f); OUT(34); OUT(44); OUT(10); } for (i = 6; i < 13; i++) { fputs(s[i], f); OUT(10); } fclose(f); return (0); }",
	"",
	"EXEC()",
};

#define FILENAME (char[]){71,114,97,99,101,95,107,105,100,46,99,0}
#define OUT(c) fputc(c, f)
#define EXEC() int main(void) { FILE *f = fopen(FILENAME, (char[]){119,0}); int i; for (i = 0; i < 6; i++) { fputs(s[i], f); OUT(10); } for (i = 0; i < 13; i++) { OUT(9); OUT(34); fputs(s[i], f); OUT(34); OUT(44); OUT(10); } for (i = 6; i < 13; i++) { fputs(s[i], f); OUT(10); } fclose(f); return (0); }

EXEC()
