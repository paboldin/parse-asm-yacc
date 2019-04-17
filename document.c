
#include <stdlib.h>
#include <string.h>
#include <memory.h>

#include <elf.h>

#include "document.h"
#include "parse.h"

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

	h = (struct symbol *)malloc(sizeof(*h));
	if (h == NULL)
		abort();

	memset((void *)h, 0, sizeof(*h));

	h->name = strdup(name);
	if (h->name == NULL)
		abort();

	h->section = document->section;
link:
	if (h != document->symbols)
		h->next = document->symbols;
	document->symbols = h;

	return document->symbols;
}

struct statement *new_statement(document_t *document, token_t *tokens)
{
	struct statement *stmt;

	stmt = malloc(sizeof(*stmt));
	if (stmt == NULL)
		abort();

	stmt->type = tokens->type;

	list_init(&stmt->tokens);
	list_append(&stmt->tokens, &tokens->siblings);

	list_init(&stmt->list);
	list_append(&document->statements, &stmt->list);

	return stmt;
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
new_document(void)
{
	document_t *document;

	document = malloc(sizeof(*document));
	if (document == NULL)
		abort();

	list_init(&document->statements);
	document->section = document->prev_section = document->symbols = NULL;

	document->section = getsymbol(document, ".text");

	return document;
}
