
#include <stdlib.h>

#include "document.h"
#include "y.tab.h"

extern int yylineno;
extern FILE *yyin;

int main(int argc, char **argv) {
	int i;
#if YYDEBUG
	yydebug = 1;
#endif
	for (i = 1; i < argc; i++) {
		document_t *document;

		yylineno = 1;

		yyin = fopen(argv[1], "r");
		if (yyin == NULL) {
			perror("fopen");
			abort();
		}

		document = document_new();
		if (!yyparse(document)) {
			print_statements(document);
			print_symbols(document);
			print_dbgfilter(document);
		}

		fclose(yyin);
	}
}
