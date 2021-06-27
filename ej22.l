%{
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
";"     {/*Ignorar*/}
";b"    {return(BIN);}
\n      {return(EOL);}
[ \t]   {/* ignorar espacios */}
.       {return(yytext[0]); /* caracter inesperado */}
%%