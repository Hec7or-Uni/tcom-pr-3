    /* Nombre: Hector Toral
       NIA: 798095
    */
%{
#include <stdio.h>
%}
%token x y z EOL
%start start3
%%
start3 : /* no hace nada */
    | start3 C x S EOL
    ;
S : C x S
    |   /* epsilon */ 
    ;
B : x C y 
    | x C
    ;
C : x B x 
    | z
    ;

%%
int yyerror(char* s) {
	printf("\n%s\n", s);
	return 0;
}
int main() {
	yyparse();
}
