
#ifndef DOCUMENT_H_INCLUDED
#define DOCUMENT_H_INCLUDED

#include "list.h"

typedef struct token token_t;
typedef token_t *YYSTYPE;

struct symbol {
	const char *name;
	int symbol_type;

	struct {
		YYSTYPE type;
		YYSTYPE label;
		YYSTYPE globl_or_local;
		YYSTYPE weak, hidden, protected, internal;
		YYSTYPE size;
	} statements;

	struct symbol *section;
	struct symbol *next;
};

struct document_tree {
	/* all statements */
	list_t statements;

	/* all tokens */
	list_t tokens;

	struct symbol *section, *prev_section;

	token_t *current_label, *current_local_label;

	/* LRU with symbols */
	struct symbol *symbols;
};

typedef struct document_tree document_t;

void setsection(document_t *, const char *name);
void previoussection(document_t *);
void popsection(document_t *);

struct symbol * getsymbol(document_t *, const char *name);

struct symbol * setsymboltype(document_t *, const char *name,
			      token_t *first_token, token_t *type);

void print_dbgfilter(document_t *document);

void print_symbol(struct symbol *s);
void print_symbols(document_t *document);

void link_statement(token_t *left, token_t *right);
struct document_tree *document_new(void);

static inline
void document_set_current_label(document_t *document, token_t *label)
{
	document->current_label = label;
}

static inline
void document_set_current_local_label(document_t *document,
				      token_t *local_label)
{
	document->current_local_label = local_label;
}

#define SET_CURRENT_LABEL(label) document_set_current_label(document, (label))
#define SET_CURRENT_LOCAL_LABEL(label) document_set_current_local_label(document, (label))

void print_statements(document_t *tree);

#endif /* DOCUMENT_H_INCLUDED */
