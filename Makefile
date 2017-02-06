

ifeq ($(NDEBUG),)
CFLAGS := -DYYDEBUG=1
endif
CFLAGS += -DYYERROR_VERBOSE=1

all: parser

test: all
	echo "	abc: def, foo; ghj" | ./parser

parser: y.tab.c y.tab.h lex.yy.c
	gcc -g -o $@ y.tab.c lex.yy.c -lfl -ly $(CFLAGS)

y.tab.c y.tab.h: parse.y
	yacc --verbose -d $^

lex.yy.c: parse.l
	flex $^

clean:
	rm -f y.tab.c y.tab.h lex.yy.c
