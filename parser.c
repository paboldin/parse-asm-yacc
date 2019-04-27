
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
		document_t *document;

		document = document_parse_path(argv[i]);
		if (document) {
			document_print(document);
			document_free(document);
		}
	}
}
