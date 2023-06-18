%option yywrap
    #include <stdio.h>
    #include <string.h>
	// Note que fazemos um include do .h gerado pelo bison!
    #include "sequenciacomandosII.tab.h"
	  
	// Outra maneira comum de usar os tokens é deixar os de apenas um caracter
	// como '+', '(' etc. como eles mesmos. No caso, poderíamos fazer
	// "+"   return '+';
	// E ajustaríamos o %token no .y de acordo.

%%
end     	return END;
Program  	return PROGRAM;
[0-9]+   	{printf("lido %s\n",yytext); yylval.number=atoi(yytext); return NUM; }
[a-zA-Z]+   {printf("lido %s\n",yytext); yylval.str=strdup(yytext); return NAME; }
\n       	return NEWLINE;
"="      	return ASSIGN;
"+"      	return PLUS;
"*"      	return MULT;
"("      	return AP;
")"      	return FP;

