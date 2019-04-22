
#ifndef DOCUMENT_H_INCLUDED
#define DOCUMENT_H_INCLUDED

#include "list.h"
#include "parse.h"

typedef struct statement {
	/* list of the statements, links to document_t->statements */
	list_t list;

	/* list of statements in symbols */
	list_t symbol;

	/* tokens of statement */
	list_t tokens;
} statement_t;

struct symbol {
	const char *name;
	int type;

	struct {
		statement_t *type;
		statement_t *label;
		statement_t *globl_or_local;
		statement_t *weak;
		statement_t *hidden;
		statement_t *protected;
		statement_t *internal;
		statement_t *size;
	} aux;

	list_t statements;

	struct symbol *section;
	struct symbol *next;
};

typedef struct document {
	/* all statements */
	list_t statements;

	/* all tokens */
	list_t tokens;

	struct symbol *section, *prev_section;

	token_t *current_label;

	/* LRU with symbols */
	struct symbol *symbols;
} document_t;

void setsection(document_t *, const char *, token_t *);
void previoussection(document_t *, token_t *);
void popsection(document_t *, token_t *);

#define SETSECTION(name, token)	setsection(document, (name), (token))
#define PREVIOUSSECTION(token)	previoussection(document, (token))
#define POPSECTION(token)	popsection(document, (token))

struct symbol *getsymbol(document_t *, const char *name);

void setsymboltype(document_t *, const char *name,
		   statement_t *stmt, token_t *type);


#define GENERATE_SET_STATEMENT(statement_name)				\
static inline void							\
setsymbol ## statement_name (document_t *document,			\
			     const char *name, statement_t *stmt)	\
{									\
	struct symbol *s = getsymbol(document, name);			\
	s->aux.statement_name = stmt;					\
}

GENERATE_SET_STATEMENT(globl_or_local);
GENERATE_SET_STATEMENT(weak);
GENERATE_SET_STATEMENT(hidden);
GENERATE_SET_STATEMENT(protected);
GENERATE_SET_STATEMENT(internal);
GENERATE_SET_STATEMENT(size);



void print_dbgfilter(document_t *document);

void print_symbol(struct symbol *s);
void print_symbols(document_t *document);

document_t *document_new(void);

statement_t *statement_new(document_t *, token_t *);

void print_statements(document_t *tree);

#endif /* DOCUMENT_H_INCLUDED */
