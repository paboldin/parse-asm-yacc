
#include <stdlib.h>

#include "document.h"
#include "y.tab.h"
#include "flex.h"

int main(int argc, char **argv) {
	int i;

	if (argc > 1 && !strcmp(argv[1], "--debug")) {
		yydebug = 1;
		argv ++;
		argc --;
	}

	for (i = 1; i < argc; i++) {
		FILE *fh;
		document_t *document;

		fh = fopen(argv[i], "r");
		if (fh == NULL) {
			fprintf(stderr, "fopen: %s %s\n", strerror(errno), argv[i]);
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
