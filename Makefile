
CFLAGS ?= -DYYDEBUG=1

all: parser
	echo " abc: def, foo; ghj" | ./parser

parser: y.tab.c y.tab.h lex.yy.c
	gcc -o $@ y.tab.c lex.yy.c -lfl -ly $(CFLAGS)

y.tab.c y.tab.h: parse.y
	yacc -d $^

lex.yy.c: parse.l
	flex $^
