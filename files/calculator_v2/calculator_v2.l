%{
 #include <stdio.h>
 #include <stdlib.h>
 #include "calculator_v2.tab.h"

 void yyerror(char *); 
%}

%%
 /* Stop calculator */
end  {return(END);}

 /* variables */
[a-z]+ {
        yylval = *yytext - 'a';
        //printf("O token \"%s\" eh uma variavel. \n", yytext);
        return VARIABLE;
      }

 /* integers */
[0-9]+ {
        yylval = atoi(yytext);
        return INTEGER;
       }

 /* operators */
[-+()=/*\n] { return *yytext; }

 /* skip whitespace */
[ \t] ;



 /* anything else is an error */
. yyerror("invalid character");
%%

int yywrap(void) {
 return 1;
} 