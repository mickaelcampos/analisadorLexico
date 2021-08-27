%option nounput
%option noyywrap
%option outfile="analisadorLexico.c"


%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "TabelaDeSimbolos.c"

extern FILE *yyin;
extern FILE *yyout;
    
int lineno = 1;
void ret_print(char *token_type);
void yyerror();

%}

digit [0-9]
letter [A-Za-z]
whitespace [ ]
ident {letter}({letter}|{digit})*
string_constant \"([^\\\"]|\\.)*\"
int_constant ([0-9]([0-9])*)|([0-7]([0-7])*[o,0])|([0-9]([0-7,A-F,a-f])*[h,H])|([0-1]([0-1])*[b,B])
float_constant [+-]?([0-9]*[.])?[0-9]+

%%



"\n"                        {lineno += 1; }
def            	     {ret_print("def");}
break            	     {ret_print("break");}
class 		  	     {ret_print("class");}
constructor           	     {ret_print("constructor");}
else             	     {ret_print("else");}
extends           	     {ret_print("extends");}
for            	     {ret_print("for");}
if 			     {ret_print("if");}       	    
int             	     {ret_print("int");}
new             	     {ret_print("new");}
print                 	     {ret_print("print");}
read            	     {ret_print("read");}
return            	     {ret_print("return");}
string                      {ret_print("string");}
super             	     {ret_print("super");}
method             	     {ret_print("method");}
null             	     {ret_print("null");}


{ident} {

		    //Insere o ident na tabela de símbolos
                    insert(yytext, strlen(yytext), lineno);
                    ret_print("ident");
}


{int_constant}             {ret_print("int_constant");}
{float_constant}             {ret_print("float_constant");}
{string_constant}          {ret_print("string_constant");}


"="             	    {ret_print("=");}
">"             	    {ret_print(">");}
"<"             	    {ret_print("<");}
"=="             	    {ret_print("==");}
"<="             	    {ret_print("<=");}
">="             	    {ret_print(">=");}
"!="             	    {ret_print("!=");}
"+"             	    {ret_print("+");}
"-"             	    {ret_print("-");}
"*"             	    {ret_print("*");}
"/"             	    {ret_print("/");}
"%"             	    {ret_print("%");}
"("             	    {ret_print("(");}
")"             	    {ret_print(")");}
"{"             	    {ret_print("{");}
"}"             	    {ret_print("}");}
"["             	    {ret_print("[");}
"]"                        {ret_print("]");}
";"             	    {ret_print(";");}
","             	    {ret_print(",");}
"."             	    {ret_print(".");}
{whitespace}*
.           	            {yyerror("Caractere não reconhecido"); }

%%

// Função que printa o token na listagem de tokens
void ret_print(char *token_type){
    printf("%s, ", token_type);
}

// Função que retorna mensagem de erro se algum token não é identificado
void yyerror(char *message){
    printf("\nErro: \"%s\" na linha %d. Token = %s\n", message, lineno, yytext);
    exit(1);
}
 


int main(int argc, char *argv[])
{
    // Inicializa tabela de símbolos
    init_hash_table();
    
    // Abre arquivo de entrada
    yyin = fopen(argv[1], "r");
    
    printf("Lista de tokens -> [");
    // Analise léxica realizada pela ferramenta FLEX
    yylex();
    printf("]");
    fclose(yyin);
      
    // Gera arquivo de saída com a Tabela de Símbolos
    yyout = fopen("TabelaDeSimbolos.out", "w");
    symtab_dump(yyout);
    fclose(yyout);  
  
    return 0;
}
