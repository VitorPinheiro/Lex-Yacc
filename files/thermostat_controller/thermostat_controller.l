%{
#include <stdio.h>
#include "thermostat_controller.tab.h"

// Whenever Lex matches a target, it puts the text of the match in the character string 'yytext'.
// we compare it to 'on', and set yylval to 1 if it is equal.
%}



%%
[0-9]+                  yylval=atoi(yytext); return NUMBER;
heat                    return TOKHEAT;
on|off                  yylval=!strcmp(yytext,"on"); return STATE;
target                  return TOKTARGET;
temperature             return TOKTEMPERATURE;
humidity                return TOKHUMIDITY;
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;
%%