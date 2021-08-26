# analisadorLexico

## Instalação:


Ferramenta FLEX (Analisador Lexico)
`$ sudo apt-get install flex`
Ferramenta GCC (Compilador C)
`$ sudo apt-get install build-essentials`

## Compilação/execução do programa:

gerar os arquivos com o uso do Makefile usando o seguinte comando:

`$ make all`

ou manualmente com os seguintes comandos:

`$ flex analisador.l`

`$ gcc analisadorLexico.c`

`$ ./a.out <caminho_arquivo>`