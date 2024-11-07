main:
	lex parser.l
	gcc lex.yy.c -lfl

clean :
	rm lex.yy.c 