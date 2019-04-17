

ifeq ($(NDEBUG),)
CFLAGS := -DYYDEBUG=1
endif
CFLAGS += -DYYERROR_VERBOSE=1

all: parser

test: all
	echo "	abc: def, foo; ghj" | ./parser

parser: y.tab.o y.tab.h lex.yy.o document.o
	gcc -g -o $@ $^ -lfl -ly $(CFLAGS)

document.o: document.h

y.tab.c y.tab.h: parse.y parse.h
	yacc --verbose -d $<

lex.yy.c: parse.l
	flex $^

clean:
	rm -f y.tab.c y.tab.h lex.yy.c parser document.o
