
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

struct symbol *
setsymboltype(document_t *document, const char *name,
	      token_t *first_token, token_t *type)
{
	struct symbol *s;

	s = getsymbol(document, name);
	s->statements.type = first_token;
	s->symbol_type = strcmp(type->txt + 1, "function") == 0 ? STT_FUNC : STT_OBJECT;
}


void link_statement(token_t *left, token_t *right)
{
	list_append(&left->statements, &right->statements);
}

void setsection(document_t *document, const char *name)
{
	struct symbol *s;

	s = getsymbol(document, name);
	s->section = NULL;
	s->symbol_type = STT_SECTION;
	document->prev_section = document->section;
	document->section = s;
}

void popsection(document_t *document)
{
	struct symbol *s = document->section->next;

	while (s && s->symbol_type != STT_SECTION)
		s = s->next;
	document->section = s;
}

void previoussection(document_t *document)
{
	struct symbol *s = document->section;

	document->section = getsymbol(document, document->prev_section->name);
	document->prev_section = s;
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

	document->section = getsymbol(document, ".text");

	return document;
}

void print_statements(document_t *tree)
{
	token_t *token;

	list_for_each_entry(token, &tree->statements, statements) {
		print_tokens(token, NULL);
	}
}

void print_symbol(struct symbol *s)
{
	printf("symbol: name = %s, type = %d\n", s->name, s->symbol_type);
	if (s->section)
		printf("symbol: section = %s\n", s->section->name);
	print_tokens(s->statements.label, "symbol: label = ");
	print_tokens(s->statements.type, "symbol: type = ");
	print_tokens(s->statements.globl_or_local, "symbol: globl_or_local = ");
	print_tokens(s->statements.weak, "symbol: weak = ");
	print_tokens(s->statements.hidden, "symbol: hidden = ");
	print_tokens(s->statements.protected, "symbol: protected = ");
	print_tokens(s->statements.internal, "symbol: internal = ");
	print_tokens(s->statements.size, "symbol: size = ");
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

