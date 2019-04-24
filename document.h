
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

typedef struct section section_t;

struct section {
	const char *name;

#define SECTION_EXECUTABLE	0x1
#define SECTION_KSYTAB		0x2
	int type;

	list_t statements;

	struct section_args args;

	section_t *next;
};

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
		statement_t *comm;
		statement_t *set;
	} aux;

	list_t statements;

	section_t *section;
	struct symbol *next;
};

typedef struct document {
	/* all statements */
	list_t statements;

	/* all tokens */
	list_t tokens;

	/* tokens for current statement */
	list_t statement_tokens;

	section_t *section, *prev_section, *sections;

	struct symbol *current_symbol;

	/* LRU with symbols */
	struct symbol *symbols;
} document_t;

section_t *setsection(document_t *, const char *);
void previoussection(document_t *);
void popsection(document_t *);

void section_set_args(section_t *section, struct section_args args);

static inline
section_t *setsectionwithargs(document_t *document, const char *name,
			      struct section_args args)
{
	section_t *section;

	section = setsection(document, name);
	section_set_args(section, args);

	return section;
}

static inline
int is_data_sect(section_t *section)
{
	return section->type & SECTION_EXECUTABLE;
}

struct symbol *getsymbol(document_t *, const char *name);
struct symbol *setsymbol(document_t *, const char *name);

void setsymboltype(document_t *, const char *name,
		   statement_t *stmt, token_t *type);
void setsymbollabel(document_t *document, const char *name, statement_t *stmt);


#define GENERATE_SETSYMBOL(statement_name)				\
static inline void							\
setsymbol ## statement_name (document_t *document,			\
			     const char *name, statement_t *stmt)	\
{									\
	struct symbol *s = getsymbol(document, name);			\
	s->aux.statement_name = stmt;					\
	list_append(&s->statements, &stmt->symbol);			\
}

GENERATE_SETSYMBOL(globl_or_local);
GENERATE_SETSYMBOL(weak);
GENERATE_SETSYMBOL(hidden);
GENERATE_SETSYMBOL(protected);
GENERATE_SETSYMBOL(internal);
GENERATE_SETSYMBOL(size);
GENERATE_SETSYMBOL(comm);
GENERATE_SETSYMBOL(set);


void print_dbgfilter(document_t *document);

void print_symbol(struct symbol *s);
void print_symbols(document_t *document);

document_t *document_new(void);

statement_t *statement_new(document_t *, token_t *, token_t *);
void symbol_add_statement(document_t *, statement_t *);
void section_add_statement(document_t *, statement_t *);

void link_token(document_t *document, token_t *token);

token_t *statement_first_token(statement_t *);
token_t *statement_last_token(statement_t *);

void print_statements(document_t *tree);

#endif /* DOCUMENT_H_INCLUDED */
