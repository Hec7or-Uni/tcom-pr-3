%{
#include <math.h>
#include "y.tab.h"
%}
%%
"+"     {return(ADD);}
"-"     {return(SUB);}
"*"     {return(MUL);}
"/"     {return(DIV);}
"("     {return(OP);}
")"     {return(CP);}
[0-9]+  {yylval = atoi(yytext); return(NUMBER);}
[01]+"b"   {
            yylval = atoi(yytext);
            int valor = 0;
            for (int n = 0; yylval != 0; n++){      /* paso el dato de binario a decimal */
                valor += yylval % 10 * (pow(2,n));
                yylval = yylval / 10;
            }
            yylval = valor;
            return (NUMBER);
            }
\n      {return(EOL);}
[ \t]   {/* ignorar espacios */}
.       {return(yytext[0]); /* caracter inesperado */}
%%