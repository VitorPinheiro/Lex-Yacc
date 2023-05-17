%option yywrap
      #include <stdio.h>
      #include "calculator.tab.h"
%%
[0-9]+   {printf("lido %s\n",yytext);yylval=atoi(yytext); return(NUM); }
\n       return(NEWLINE);
"+"      return(PLUS);
"-"      return(MINUS);
"*"	 return(VEZES);
"/"	 return(DIVIDE);
"="      return(EQUAL);
end     return(0);
.        ;
