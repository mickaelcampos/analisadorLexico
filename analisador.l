
%{

       int nLinha = 1;

%}


DIGITO[0-9]
BINARIO[Z0-1]
OCTAL[X0-7]
HEXADECIMAL[0-9A-F]
ident[a-zA-Z][a-zA-Z0-9]*
COMENTARIO[^*/]*
LETRA[a-zA-Z]
MAIUSCULA[A-Z]
MINUSCULA[a-z]
WHITESPACE[ ]


%%
\n                          {nLinha++;}
begin             	    {printf("Reservada: %s", yytext);}
end 		  	    {printf("Reservada: %s", yytext);}
if             	            {printf("Reservada: %s\n", yytext);}
else             	    {printf("Reservada: %s", yytext);}
while            	    {printf("Reservada: %s", yytext);}
do            	            {printf("Reservada: %s\n", yytext);}
for             	    {printf("Reservada: %s", yytext);}
int             	    {printf("Reservada: %s", yytext);}
float             	    {printf("Reservada: %s", yytext);}
char                 	    {printf("Reservada: %s", yytext);}
string             	    {printf("Reservada: %s", yytext);}
include             	    {printf("Reservada: %s", yytext);}
short                       {printf("Reservada: %s", yytext);}
break             	    {printf("Reservada: %s", yytext);}
case             	    {printf("Reservada: %s", yytext);}
switch             	    {printf("Reservada: %s", yytext);}
const             	    {printf("Reservada: %s", yytext);}
default             	    {printf("Reservada: %s", yytext);}
double             	    {printf("Reservada: %s", yytext);}
return             	    {printf("RETURNSTAT: %s", yytext);}
long             	    {printf("Reservada: %s", yytext);}
static             	    {printf("Reservada: %s", yytext);}
void             	    {printf("Reservada: %s", yytext);}
"+"             	    {printf("Operador de soma: %s", yytext);}
"-"             	    {printf("Operador de subtracao: %s", yytext);}
"*"             	    {printf("Operador de multiplicacao: %s", yytext);}
"/"             	    {printf("Operador de divisao: %s", yytext);}
"=="             	    {printf("Operador de igualdade: %s", yytext);}
"="             	    {printf("Operador de atribuicao: %s", yytext);}
"!"             	    {printf("Negação: %s\n", yytext);}
"("             	    {printf("Inicio dos parametros: %s", yytext);}
")"             	    {printf("Fim dos parametros: %s", yytext);}
"{"                         {printf("Inicio do metodo: %s", yytext);}
"}"             	    {printf("Fim do metodo: %s", yytext);}
";"             	    {printf("Fim da linha: %s", yytext);}
{LETRA}+        	    {printf("Palavra: %s", yytext);}
{DIGITO}+        	    {printf("Inteiro: %s", yytext);} 
{DIGITO}+"."{DIGITO}*       {printf("Real: %s", yytext);} 
{HEXADECIMAL}+        	    {printf("Hexadecimal: %s", yytext);} 
0x{DIGITO}*\.{DIGITO}+      {printf("Decimal: %s", yytext);} 
{OCTAL}*        	    {printf("Octal: %s", yytext);} 
{BINARIO}*         	    {printf("Binario: %s", yytext);} 
{WHITESPACE}+               /*Eliminaespacosembranco*/  
.			    /*Caracterenaoreconhecido*/{printf("Caractere nao reconhecido: %s, linha: %d", yytext, nLinha);} 
"/*"{COMENTARIO}"*/"	    {printf("Comentários: %s", yytext);}
{ident}+		            {printf("ident: %s", yytext);}


%%
/* recomendavel declarar sempre funcao yywrap() */
int yywrap();

int main(int argc, char *argv[])
{

       extern FILE *yyin;

       yyin = fopen(argv[1], "r");
       
       yylex();
       return 0;
}
int yywrap()
{
	return 1;
}

