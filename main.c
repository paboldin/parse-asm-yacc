
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
		FILE *fh;
		document_t *document;

		fh = fopen(argv[i], "r");
		if (fh == NULL) {
			perror("fopen");
			abort();
		}

		document = document_parse_file(fh);
		if (document) {
			document_print(document);
			document_free(document);
		}

		fclose(fh);
	}
}
