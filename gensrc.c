
#include <stdlib.h>

#include "document.h"
#include "y.tab.h"
#include "flex.h"

static const char *prog_name;

void usage(FILE *fh)
{
	if (fh == NULL)
		fh = stderr;
	fprintf(fh, "%s: generate diff source from inputs\n", prog_name);
	fprintf(fh, "USAGE %s [--debug] input1.s input2.s\n", prog_name);
	exit(fh == stderr ? -1 : 0);
}

int main(int argc, char **argv) {
	int i;
	document_t *left, *right;

	prog_name = argv[0];

	if (argc > 1 && !strcmp(argv[1], "--debug")) {
		yydebug = 1;
		argv ++;
		argc --;
	}

	if (argc != 2)
		usage(stderr);

	left = document_parse_path(argv[1]);
	right = document_parse_path(argv[2]);

	document_free(left);
	document_free(right);

	return 0;
}
