
%{
      #include <stdio.h>

float result=0;
int yylex();
void yyerror(const char *s){
      fprintf(stderr, "%s\n", s);
   };
 void showResult(float res)
{
    printf("result=%f\n", res);
}
%}
%token NUM
%token PLUS
%token MINUS
%token EQUAL
%token NEWLINE
%token VEZES
%token DIVIDE
%token END

%start expressions
%%
expressions : expression
       | expressions expression
       ;
expression  : NEWLINE
       | operation NEWLINE {showResult(result);}
       ;
operation : PLUS NUM {result+=$2;}
	 | MINUS NUM {result-=$2;}
	 | VEZES NUM {result*=$2;}
	 | DIVIDE NUM {result/=$2;}
	 | EQUAL NUM {result=$2;}
     | END {return(0);}
	 ;

%%



int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}
