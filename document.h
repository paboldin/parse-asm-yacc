
#ifndef DOCUMENT_H_INCLUDED
#define DOCUMENT_H_INCLUDED

#include "list.h"

typedef struct token token_t;
typedef token_t *YYSTYPE;

struct symbol {
	const char *name;
	int symbol_type;
	YYSTYPE type;
	YYSTYPE label;
	YYSTYPE globl_or_local;
	YYSTYPE weak, hidden, protected, internal;
	YYSTYPE size;

	struct symbol *section;
	struct symbol *next;
};

struct statement {
	list_t list;
	int type;
	list_t tokens;
};

struct document_tree {
	list_t statements;

	struct symbol *section, *prev_section;

	/* LRU with symbols */
	struct symbol *symbols;
};

typedef struct document_tree document_t;

void setsection(document_t *, const char *name);
void previoussection(document_t *);
void popsection(document_t *);

struct symbol * getsymbol(document_t *, const char *name);

void print_dbgfilter(document_t *document);

void print_symbol(struct symbol *s);
void print_symbols(document_t *document);

struct statement *new_statement(document_t *, token_t *tokens);
struct document_tree *new_document(void);

void print_statements(document_t *tree);

#endif /* DOCUMENT_H_INCLUDED */
