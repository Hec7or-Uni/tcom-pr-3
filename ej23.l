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
"acum"  {return(ACUM);}
":="     {return(ASIGNACION);}
[0-9]+  {yylval = atoi(yytext); return(NUMBER);}

\n      {return(EOL);}
[ \t]   {/* ignorar espacios */}
.       {return(yytext[0]); /* caracter inesperado */}
%%