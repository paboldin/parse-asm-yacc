

ifeq ($(NDEBUG),)
CFLAGS := -DYYDEBUG=1
endif
CFLAGS += -DYYERROR_VERBOSE=1 -g

all: parser

tests: all
	@for f in $$(find tests -iname \*.s); do \
		echo running $$f; \
		./parser $$f || break; \
	done

parser: y.tab.o y.tab.h lex.yy.o document.o main.o
	gcc -g -o $@ $^ -lfl -ly $(CFLAGS)

document.o: document.h

y.tab.c y.tab.h: parse.y parse.h
	yacc --verbose -d $<

y.tab.o: document.h

lex.yy.c: parse.l
	flex $^

clean:
	rm -f y.tab.c y.tab.h lex.yy.c parser document.o y.tab.o main.o
