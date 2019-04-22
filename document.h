
#ifndef DOCUMENT_H_INCLUDED
#define DOCUMENT_H_INCLUDED

#include "list.h"

typedef struct token token_t;
typedef token_t *YYSTYPE;

struct symbol {
	const char *name;
	int type;

	struct {
		YYSTYPE type;
		YYSTYPE label;
		YYSTYPE globl_or_local;
		YYSTYPE weak, hidden, protected, internal;
		YYSTYPE size;

		YYSTYPE first, last;
	} aux;

	struct symbol *section;
	struct symbol *next;
};

struct document_tree {
	/* all statements */
	list_t statements;

	/* all tokens */
	list_t tokens;

	struct symbol *section, *prev_section;

	token_t *current_label;

	/* LRU with symbols */
	struct symbol *symbols;
};

typedef struct document_tree document_t;

void setsection(document_t *, const char *, token_t *);
void previoussection(document_t *, token_t *);
void popsection(document_t *, token_t *);

#define SETSECTION(name, token)	setsection(document, (name), (token))
#define PREVIOUSSECTION(token)	previoussection(document, (token))
#define POPSECTION(token)	popsection(document, (token))

struct symbol * getsymbol(document_t *, const char *name);

void setsymboltype(document_t *, const char *name,
			      token_t *first_token, token_t *type);

static inline
void setsymboltoken(struct symbol *s, token_t *token)
{
	if (token == NULL)
		return;
	if (s->aux.first == NULL)
		s->aux.first = token;
	s->aux.last = token;
}

#define GENERATE_SET_STATEMENT(statement_name)			\
static void inline						\
setsymbol ## statement_name (document_t *document,		\
			     const char *name, token_t *token)	\
{								\
	struct symbol *s = getsymbol(document, name);		\
	setsymboltoken(s, token);				\
	s->aux.statement_name = token;			\
}

GENERATE_SET_STATEMENT(label);
GENERATE_SET_STATEMENT(globl_or_local);
GENERATE_SET_STATEMENT(weak);
GENERATE_SET_STATEMENT(hidden);
GENERATE_SET_STATEMENT(protected);
GENERATE_SET_STATEMENT(internal);
GENERATE_SET_STATEMENT(size);


void print_dbgfilter(document_t *document);

void print_symbol(struct symbol *s);
void print_symbols(document_t *document);

void link_statement(token_t *left, token_t *right);
struct document_tree *document_new(void);

void document_set_current_label(document_t *document, token_t *label);
#define SET_CURRENT_LABEL(label) document_set_current_label(document, (label))

#define SET_CURRENT_LOCAL_LABEL(label) do { } while (0)

void print_statements(document_t *tree);

#endif /* DOCUMENT_H_INCLUDED */
