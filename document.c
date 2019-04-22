
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
	      token_t *first_token, token_t *type)
{
	struct symbol *s;

	s = getsymbol(document, name);
	s->aux.type = first_token;
	s->type = strcmp(type->txt + 1, "function") == 0 ? STT_FUNC : STT_OBJECT;
	setsymboltoken(s, first_token);
}

void link_statement(token_t *left, token_t *right)
{
	list_append(&left->statements, &right->statements);
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
		setsymboltoken(s, token);
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

	setsymbollabel(document, label->txt, label);

	document->current_label = label;
}

void print_statements(document_t *tree)
{
	token_t *token;

	list_for_each_entry(token, &tree->statements, statements) {
		print_tokens(token, NULL);
	}
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

void print_symbol(struct symbol *s)
{
	printf("symbol: name = %s, type = %s\n", s->name, symtype2str(s->type));
#if 0
	printf("symbol: first = %d, last = %d\n",
	       s->statements.first ? s->statements.first->lineno : -1,
	       s->statements.last ? s->statements.last->lineno : -1);
#endif
	if (s->section)
		printf("symbol: section = %s\n", s->section->name);
	print_tokens(s->aux.label, "symbol: label = ");
	print_tokens(s->aux.type, "symbol: type = ");
	print_tokens(s->aux.globl_or_local, "symbol: globl_or_local = ");
	print_tokens(s->aux.weak, "symbol: weak = ");
	print_tokens(s->aux.hidden, "symbol: hidden = ");
	print_tokens(s->aux.protected, "symbol: protected = ");
	print_tokens(s->aux.internal, "symbol: internal = ");
	print_tokens(s->aux.size, "symbol: size = ");
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

