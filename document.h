
#ifndef DOCUMENT_H_INCLUDED
#define DOCUMENT_H_INCLUDED

#include "list.h"
#include "parse.h"
#include "rbtree.h"

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

	/* LRU for parsing */
	struct symbol *next;
	/* Tree for search */
	struct rb_node node;
#define rb_symbol_entry(n) rb_entry((n), struct symbol, node)
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

	/* RB-tree with symbols */
	struct rb_root symbols;

	/* LRU with symbols */
	struct symbol *symbols_lru;
} document_t;

/* Token functions */

void print_tokens(token_t *t, const char *prefix);
void link_token(document_t *document, token_t *token);

/* Statement functions */

statement_t *statement_new(document_t *, token_t *, token_t *);
void document_symbol_add_statement(document_t *, statement_t *);
void document_section_add_statement(document_t *, statement_t *);
token_t *statement_first_token(statement_t *);
token_t *statement_last_token(statement_t *);

/* Symbol functions */

struct symbol *document_find_symbol(document_t *, const char *name);
struct symbol *document_get_symbol(document_t *, const char *name);
struct symbol *document_set_symbol(document_t *, const char *name);

void symbol_set_type(document_t *, const char *name,
		     statement_t *stmt, token_t *type);
void symbol_set_label(document_t *document, const char *name, statement_t *stmt);


#define GENERATE_SYMBOL_SET_(statement_name)				\
static inline void							\
symbol_set_ ## statement_name (document_t *document,			\
			       const char *name, statement_t *stmt)	\
{									\
	struct symbol *s = document_get_symbol(document, name);		\
	s->aux.statement_name = stmt;					\
	list_append(&s->statements, &stmt->symbol);			\
}

GENERATE_SYMBOL_SET_(globl_or_local);
GENERATE_SYMBOL_SET_(weak);
GENERATE_SYMBOL_SET_(hidden);
GENERATE_SYMBOL_SET_(protected);
GENERATE_SYMBOL_SET_(internal);
GENERATE_SYMBOL_SET_(size);
GENERATE_SYMBOL_SET_(comm);
GENERATE_SYMBOL_SET_(set);

void symbol_print(struct symbol *s);

/* Section functions */

section_t *document_set_section(document_t *, const char *);
void document_previous_section(document_t *);
void document_pop_section(document_t *);

void section_set_args(section_t *section, struct section_args args);

static inline
section_t *document_set_section_with_args(document_t *document, const char *name,
					  struct section_args args)
{
	section_t *section;

	section = document_set_section(document, name);
	section_set_args(section, args);

	return section;
}

static inline
int is_data_sect(section_t *section)
{
	return section->type & SECTION_EXECUTABLE;
}

/* Document functions */

document_t *document_new(void);
document_t *document_parse_file(FILE *fh);
void document_print(document_t *document);
void document_free(document_t *document);
void document_print_dbgfilter(document_t *document);
void document_print_symbols(document_t *document);
void document_print_statements(document_t *tree);

#endif /* DOCUMENT_H_INCLUDED */
