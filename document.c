
#include <stdlib.h>
#include <string.h>
#include <memory.h>

#include <elf.h>


#include "parse.h"
#include "document.h"
#include "flex.h"

#include "y.tab.h"


static inline
int STREQ(const char *a, const char *b)
{
	return !strcmp(a, b);
}

static inline
int STRNEQ(const char *a, const char *b)
{
	return !STREQ(a, b);
}

/* Token code */

void print_tokens(token_t *t, const char *prefix)
{
	token_t *nsbl = t, *ntkn = t;
	if (t == NULL)
		return;

	if (prefix != NULL)
		printf("%s(l%d)", prefix, t->lineno);

	do {
		printf("(%s)%s", get_token_name(ntkn->type), ntkn->buf);

		nsbl = sibling_next(nsbl);
		ntkn = token_next(ntkn);
	} while (nsbl == ntkn);
	printf("\n");
}

void link_token(document_t *document, token_t *token)
{
	switch (token->type) {
	case NEWLINE:
	case COMMENT:
		break;
	default:
		list_append(&document->statement_tokens, &token->siblings);
		break;
	}
}

/* Statement code */

statement_t *statement_new(document_t *document, token_t *token, token_t *lookahead)
{
	statement_t *stmt;
	token_t *t;

	stmt = malloc(sizeof(*stmt));
	if (stmt == NULL)
		abort();

	/* link tokens */
	list_init(&stmt->tokens);
	list_del(&document->statement_tokens);
	if (lookahead) {
		/* FIXME(pboldin): sad hack to remove lookahead from the
		 * siblings list.  Either this or manually linking all the
		 * tokens (which how it was actually and maybe this was better,
		 * but deemed to be too complex)
		 */
		list_del(&lookahead->siblings);
		link_token(document, lookahead);
	}
	list_append(&stmt->tokens, &token->siblings);

	/* link statement */
	list_init(&stmt->list);
	list_append(&document->statements, &stmt->list);

	/* prepare symbol list */
	list_init(&stmt->symbol);

	return stmt;
}

void statement_print(statement_t *stmt, const char *prefix)
{
	if (stmt == NULL)
		return;
	print_tokens(list_first_entry(&stmt->tokens, token_t, siblings), prefix);
}


void document_symbol_add_statement(document_t *document, statement_t *stmt)
{
	struct symbol *s = document->current_symbol;

	if (s == NULL)
		return;
	list_append(&s->statements, &stmt->symbol);
}

void document_section_add_statement(document_t *document, statement_t *stmt)
{
	section_t *section = document->section;

	if (section == NULL)
		return;
	list_append(&section->statements, &stmt->symbol);
}

token_t *statement_last_token(statement_t *stmt)
{
	if (list_empty(&stmt->tokens))
		return NULL;

	return list_last_entry(&stmt->tokens, token_t, siblings);
}

token_t *statement_first_token(statement_t *stmt)
{
	if (list_empty(&stmt->tokens))
		return NULL;

	return list_first_entry(&stmt->tokens, token_t, siblings);
}

/* Symbol code */

static
struct symbol *symbol_new(const char *name, section_t *section)
{
	struct symbol *h;

	h = (struct symbol *)malloc(sizeof(*h));
	if (h == NULL)
		abort();

	memset((void *)h, 0, sizeof(*h));

	list_init(&h->statements);
	h->name = strdup(name);
	if (h->name == NULL)
		abort();

	h->section = section;
	h->next = NULL;

	return h;
}

struct symbol *document_get_symbol(document_t *document, const char *name)
{
	struct symbol *h = document->symbols, *p = NULL;

	while (h != NULL) {
		if (!strcmp(h->name, name)) {
			if (p)
				p->next = h->next;
			goto link;
		}

		p = h;
		h = h->next;
	}

	h = symbol_new(name, document->section);
link:
	if (h != document->symbols)
		h->next = document->symbols;
	document->symbols = h;

	return document->symbols;
}

struct symbol *document_set_symbol(document_t *document, const char *name)
{
	if (name)
		document->current_symbol = document_get_symbol(document, name);
	else
		document->current_symbol = NULL;

	return document->current_symbol;
}

void
symbol_set_type(document_t *document, const char *name,
		statement_t *stmt, token_t *type)
{
	struct symbol *s;

	s = document_get_symbol(document, name);
	s->aux.type = stmt;
	s->type = strcmp(type->txt + 1, "function") == 0 ? STT_FUNC : STT_OBJECT;
	list_append(&s->statements, &stmt->symbol);
}

void
symbol_set_label(document_t *document, const char *name, statement_t *stmt)
{
	struct symbol *s;

	if (name[0] == '.' && !is_data_sect(document->section)) {
		/* .Lnum label inside a function */
		document_symbol_add_statement(document, stmt);
		return;
	}

	s = document_set_symbol(document, name);
	s->aux.label = stmt;
	list_append(&s->statements, &stmt->symbol);
}

static
const char *symtype2str(int type)
{
	switch (type) {
	case STT_SECTION:
		return "section";
	case STT_FUNC:
		return "function";
	case STT_OBJECT:
		return "object";
	default:
		return "unknown";
	}
}

void symbol_print(struct symbol *s)
{
	statement_t *stmt;

	printf("symbol: name = %s, type = %s\n", s->name, symtype2str(s->type));
	if (s->section)
		printf("symbol: section = %s\n", s->section->name);
	statement_print(s->aux.label, "symbol: label = ");
	statement_print(s->aux.type, "symbol: type = ");
	statement_print(s->aux.globl_or_local, "symbol: globl_or_local = ");
	statement_print(s->aux.comm, "symbol: comm = ");
	statement_print(s->aux.weak, "symbol: weak = ");
	statement_print(s->aux.hidden, "symbol: hidden = ");
	statement_print(s->aux.protected, "symbol: protected = ");
	statement_print(s->aux.internal, "symbol: internal = ");
	statement_print(s->aux.size, "symbol: size = ");

	list_for_each_entry(stmt, &s->statements, symbol) {
		statement_print(stmt, "");
	}
}

/* Section code */

static inline
void reset_symbols(document_t *document)
{
	document->current_symbol = NULL;
}

static
section_t *document_get_section(document_t *document, const char *name)
{
	section_t *h = document->sections, *p = NULL;

	while (h != NULL) {
		if (!strcmp(h->name, name)) {
			if (p)
				p->next = h->next;
			goto link;
		}

		p = h;
		h = h->next;
	}

	h = malloc(sizeof(*h));
	if (h == NULL)
		abort();

	h->name = strdup(name);

	h->type = 0;
	if (STREQ(name, ".text"))
		h->type |= SECTION_EXECUTABLE;

	memset(&h->args, 0, sizeof(h->args));
	h->next = NULL;
	list_init(&h->statements);


link:
	if (h != document->sections)
		h->next = document->sections;
	document->sections = h;

	return h;
}

void section_set_args(section_t *section, struct section_args args)
{
	if (args.flags && strchr(args.flags->txt, 'x'))
		section->type |= SECTION_EXECUTABLE;
}

section_t *document_set_section(document_t *document, const char *name)
{
	section_t *section;

	reset_symbols(document);

	if (!name)
		return NULL;

	section = document_get_section(document, name);
	document->prev_section = document->section;
	document->section = section;

	return section;
}

void document_pop_section(document_t *document)
{
	section_t *s = document->section->next;

	document->section = s;

	reset_symbols(document);
}

void document_previous_section(document_t *document)
{
	section_t *s = document->section;

	document->section = document->prev_section;
	document->prev_section = s;

	reset_symbols(document);
}

static
const char *secflags2str(int type)
{
	switch (type) {
	case SECTION_EXECUTABLE:
		return "x";
	}
	return "";
}

void section_print(section_t *section)
{
	statement_t *stmt;

	printf("section: name = %s, flags = %s\n", section->name, secflags2str(section->type));
	list_for_each_entry(stmt, &section->statements, symbol) {
		statement_print(stmt, "");
	}
}

/* Document code */

document_t *
document_new(void)
{
	document_t *document;

	document = malloc(sizeof(*document));
	if (document == NULL)
		abort();

	list_init(&document->statements);
	list_init(&document->tokens);
	list_init(&document->statement_tokens);

	document->section = document->prev_section = NULL;
	document->symbols = NULL;
	document->sections = NULL;

	reset_symbols(document);

	document->section = document_get_section(document, ".text");

	return document;
}

void document_print(document_t *document)
{
	document_print_statements(document);
	document_print_symbols(document);
	document_print_dbgfilter(document);
}

void document_print_dbgfilter(document_t *document)
{
	token_t *token;
	int newline = 1, dbgsection = 0;

	list_for_each_entry(token, &document->tokens, list) {
		if (token->type == DIRECTIVE_SECTION ||
		    token->type == DIRECTIVE_PUSHSECTION) {
			/* FIXME(pboldin) account for POPSECTION */
			dbgsection = !strncmp(
				token_next(token)->txt,
				".debug", 6);
		}
		if (newline &&
		    token->type != DIRECTIVE_IDENT &&
		    (token->type == DIRECTIVE_CFI_IGNORED ||
		     token->type == DIRECTIVE_LOC_IGNORED ||
		     dbgsection)) {
			printf("# ");
		}
		if (token->type == LABEL || token->type == LLABEL)
			printf("%s:", token->buf);
		else
			printf("%s", token->buf);
		newline = token->type == NEWLINE;
	}
}

void document_print_statements(document_t *document)
{
	statement_t *stmt;

	list_for_each_entry(stmt, &document->statements, list) {
		print_tokens(statement_first_token(stmt), NULL);
	}
}

void document_print_symbols(document_t *document)
{
	struct symbol *h = document->symbols;
	section_t *section = document->sections;
	while (h) {
		symbol_print(h);
		h = h->next;
	}

	while (section) {
		section_print(section);
		section = section->next;
	}
}

document_t *document_parse_file(FILE *fh)
{
	document_t *document;
	yyscan_t scanner;

	yylex_init(&scanner);

	yyset_in(fh, scanner);
	document = document_new();
	if (yyparse(scanner, document))
		return NULL;

	yylex_destroy(scanner);

	return document;
}

void document_free(document_t *document)
{
	struct symbol *symbol = document->symbols, *nsymbol;
	struct section *section = document->sections, *nsection;
	statement_t *stmt, *tstmt;
	token_t *tkn, *ttkn;

	while (symbol) {
		nsymbol = symbol->next;
		free((void *)symbol->name);
		free(symbol);
		symbol = nsymbol;
	}

	while (section) {
		nsection = section->next;
		free((void *)section->name);
		free(section);
		section = nsection;
	}

	list_for_each_entry_safe(tkn, ttkn, &document->tokens, list) {
		free(tkn);
	}

	list_for_each_entry_safe(stmt, tstmt, &document->statements, list) {
		free(stmt);
	}

	free(document);
}
