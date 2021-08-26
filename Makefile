all: a.out

a.out: analisadorLexico.c
	gcc analisadorLexico.c -o analisadorLexico

analisadorLexico.c: analisador.l
	flex analisador.l
clean:
	rm -rf *analisadorLexico*