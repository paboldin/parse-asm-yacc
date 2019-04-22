
#include <stdlib.h>
#include <string.h>
#include <memory.h>

#include <elf.h>

#include "document.h"
#include "parse.h"

#include "y.tab.h"

static
struct symbol *newsymbol(const char *name)
{
	struct symbol *h;

	h = (struct symbol *)malloc(sizeof(*h));
	if (h == NULL)
		abort();

	memset((void *)h, 0, sizeof(*h));

	h->name = strdup(name);
	if (h->name == NULL)
		abort();

	return h;
}

struct symbol *getsymbol(document_t *document, const char *name)
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

	h = newsymbol(name);
	h->section = document->section;
link:
	if (h != document->symbols)
		h->next = document->symbols;
	document->symbols = h;

	return document->symbols;
}

void
setsymboltype(document_t *document, const char *name,
	      statement_t *stmt, token_t *type)
{
	struct symbol *s;

	s = getsymbol(document, name);
	s->aux.type = stmt;
	s->type = strcmp(type->txt + 1, "function") == 0 ? STT_FUNC : STT_OBJECT;
}

static inline
void _reset_labels(document_t *document)
{
	document->current_label = NULL;
}

static inline
int is_data_section(struct symbol *section)
{
	return strstr(section->name, "data") != NULL;
}

static inline
void reset_labels(document_t *document, token_t *token)
{
	struct symbol *s = document->symbols;

	if (s && s->type != STT_SECTION && is_data_section(document->section)) {
		s->type = STT_OBJECT;
	}

	_reset_labels(document);
}

struct symbol *newsection(document_t *document, const char *name)
{
	struct symbol *s;

	s = getsymbol(document, name);
	s->section = NULL;
	s->type = STT_SECTION;

	return s;
}

void setsection(document_t *document, const char *name, token_t *token)
{
	struct symbol *s;

	reset_labels(document, token);

	if (!name)
		return;

	s = newsection(document, name);
	document->prev_section = document->section;
	document->section = s;
}

void popsection(document_t *document, token_t *token)
{
	struct symbol *s = document->section->next;

	while (s && s->type != STT_SECTION)
		s = s->next;
	document->section = s;

	reset_labels(document, token);
}

void previoussection(document_t *document, token_t *token)
{
	struct symbol *s = document->section;

	document->section = getsymbol(document, document->prev_section->name);
	document->prev_section = s;

	reset_labels(document, token);
}

document_t *
document_new(void)
{
	document_t *document;

	document = malloc(sizeof(*document));
	if (document == NULL)
		abort();

	list_init(&document->statements);
	list_init(&document->tokens);
	document->section = document->prev_section = document->symbols = NULL;

	_reset_labels(document);

	document->section = newsection(document, ".text");

	return document;
}

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

void document_set_current_label(document_t *document, token_t *label)
{
	struct symbol *s;

	reset_labels(document, label);

	//setsymbollabel(document, label->txt, label);
	document->current_label = label;
}

void print_statements(document_t *tree)
{
#if 0
	token_t *token;

	list_for_each_entry(token, &tree->statements, statements) {
		print_tokens(token, NULL);
	}
#endif
}

statement_t *statement_new(document_t *document, token_t *token)
{
	statement_t *stmt;

	stmt = malloc(sizeof(*stmt));
	if (stmt == NULL)
		abort();

	list_init(&stmt->tokens);
	list_append(&stmt->tokens, &token->siblings);

	return stmt;
}

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

void print_statement(statement_t *stmt, const char *prefix)
{
	if (stmt == NULL)
		return;
	print_tokens(list_first_entry(&stmt->tokens, token_t, siblings), prefix);
}

void print_symbol(struct symbol *s)
{
	printf("symbol: name = %s, type = %s\n", s->name, symtype2str(s->type));
	if (s->section)
		printf("symbol: section = %s\n", s->section->name);
	print_statement(s->aux.label, "symbol: label = ");
	print_statement(s->aux.type, "symbol: type = ");
	print_statement(s->aux.globl_or_local, "symbol: globl_or_local = ");
	print_statement(s->aux.weak, "symbol: weak = ");
	print_statement(s->aux.hidden, "symbol: hidden = ");
	print_statement(s->aux.protected, "symbol: protected = ");
	print_statement(s->aux.internal, "symbol: internal = ");
	print_statement(s->aux.size, "symbol: size = ");
}

void print_symbols(document_t *document)
{
	struct symbol *h = document->symbols;
	while (h) {
		print_symbol(h);
		h = h->next;
	}
}

void print_dbgfilter(document_t *document)
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
