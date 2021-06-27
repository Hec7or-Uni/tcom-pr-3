%{
#include "y.tab.h"
%}
%%
"x" {return(x);}
"y" {return(y);}
"z" {return(z);}
\n  {return(EOL);}
[ \t]   {/* ignorar espacios */}
.   {return(yytext[0]); /* caracter inesperado */}
%%