
#include <stdlib.h>

#include "document.h"
#include "y.tab.h"
#include "flex.h"

int main(int argc, char **argv) {
	int i;
#if YYDEBUG
	yydebug = 1;
#endif
	for (i = 1; i < argc; i++) {
		FILE *in;

		document_t *document;
		yyscan_t scanner;

		in = fopen(argv[1], "r");
		if (in == NULL) {
			perror("fopen");
			abort();
		}

		yylex_init(&scanner);

		yyset_in(in, scanner);
		document = document_new();
		if (!yyparse(scanner, document)) {
			print_statements(document);
			print_symbols(document);
			print_dbgfilter(document);
		}

		yylex_destroy(scanner);

		fclose(in);
	}
}
