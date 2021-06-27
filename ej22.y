%{
#include <stdio.h>
%}
%token NUMBER EOL CP OP BIN
%start calclist
%token ADD SUB
%token MUL DIV
%%

calclist : /* nada */
    | calclist exp EOL { printf("=%d\n", $2); }
    | calclist exp BIN EOL {int sol = 0;
                            for (int resto = $2, cont = 1; resto != 0; resto /= 2, cont *= 10) {
                                sol += resto % 2 * cont;
                            }
                            printf("=%d\n", sol);
                            }
    ;
exp :     factor 
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }    
    ;
factor :     factor MUL factorsimple { $$ = $1 * $3; }
        | factor DIV factorsimple { $$ = $1 / $3; }
        | factorsimple
        ;
factorsimple :     OP exp CP { $$ = $2; }
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