
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

static
int statement_compare(statement_t *stmt_a, statement_t *stmt_b)
{
	token_t *a, *b;
	int rv;

	a = statement_first_token(stmt_a);
	b = statement_first_token(stmt_b);

	do {
		rv = strcmp(a->txt, b->txt);
		if (rv)
			return rv;

		if (token_next(a) != sibling_next(a))
			break;

		if (token_next(b) != sibling_next(b))
			break;

		a = sibling_next(a);
		b = sibling_next(b);
	} while (1);

	rv = (token_next(b) == sibling_next(b)) - (token_next(a) == sibling_next(a));
	if (rv)
		return rv;

	return 0;
}

int main(int argc, char **argv) {
	int i;
	document_t *left, *right;
	statement_t *stmta, *stmtb, *stmtalast, *stmtblast;

	prog_name = argv[0];

	argv ++;
	argc --;

	if (argc > 1 && !strcmp(argv[1], "--debug")) {
		yydebug = 1;
		argv ++;
		argc --;
	}

	if (argc != 2)
		usage(stderr);

	left = document_parse_path(argv[0]);
	right = document_parse_path(argv[1]);

	stmta = list_first_entry(&left->statements, statement_t, list);
	stmtb = list_first_entry(&right->statements, statement_t, list);

	stmtalast = list_entry(&left->statements, statement_t, list);
	stmtblast = list_entry(&right->statements, statement_t, list);

	while (stmta != stmtalast && stmtb != stmtblast) {
		printf("%d\n", statement_compare(stmta, stmtb));

		stmta = document_statement_next(stmta);
		stmtb = document_statement_next(stmtb);
	}

	document_free(left);
	document_free(right);

	return 0;
}
