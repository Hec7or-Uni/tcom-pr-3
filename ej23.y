    /* Nombre: Hector Toral
       NIA: 798095
    */
%{
#include <stdio.h>
    int acumulado = 0;
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%token ACUM ASIGNACION
%%
calclist : /* nada */
	| calclist ACUM ASIGNACION exp EOL { acumulado = $4;}
	| calclist ACUM EOL { printf("=%d\n", acumulado);}
	| calclist exp EOL { printf("=%d\n", $2);}
	;
exp :	factor 
	| ACUM ADD exp { $$ = acumulado + $3;}
	| ACUM SUB exp { $$ = acumulado - $3;}
    | ACUM MUL exp { $$ = acumulado * $3; }
    | ACUM DIV exp { $$ = acumulado / $3; }
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }    
    | NUMBER { $$ = $1; }
    ;
factor :	factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple
		;
factorsimple :	OP exp CP { $$ = $2; }
		| NUMBER 
		;
%%
int yyerror(char* s) {
	printf("\n%s\n", s);
	return 0;
}
int main() {
	yyparse();
}