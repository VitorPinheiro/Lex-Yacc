%{
      #include <stdlib.h>
      #include <stdio.h>
      #include <string.h>

  
int yylex();
void yyerror(const char *s){
	fprintf(stderr, "%s\n", s);
};

 
%}
%union
 {
   char *str;
   int  number;
};

%type <str> statements statement assignment exp term program;
%token<str> NAME;
%token<number> NEWLINE;
%token<number> NUM;
%token<number> ASSIGN;
%token<number> PLUS;
%token<number> AP;
%token<number> FP;
%token<number> MULT;
%token<number> END;
%token<number> PROGRAM;


%start program
%%
program : PROGRAM statements END NEWLINE 	{// $$ é o não terminal à esquerda dos ":"
											// $1, $2 etc. são os não terminais ou tokens à direita dos ":"
											printf("Codigo Objeto :\n %s\n", $2);
											exit(1);}
	;

statements : statement 				{$$=$1;};
    | statements statement 			{char *result=malloc(strlen($1) + strlen($2) + 1);
									strcpy(result, $1);
									strcat(result,";");
									strcat(result,$2);
									$$=result;}
    ;

statement  : assignment NEWLINE 	{$$=$1;}
	;

assignment : NAME ASSIGN exp  		{char *result=malloc(strlen($1) + strlen($3) + 1);
									strcpy(result, $1);
									strcat(result,"=====");
									strcat(result, $3);
									$$=result;}
	;

exp : exp PLUS term 				{char *result = malloc(strlen($1) + strlen($3) + 1);
									strcpy(result, $1);
									strcat(result,"+");
									strcat(result, $3);
									$$=result;}
	| term 							{$$=$1;}
	;
   
term : AP exp FP 					{char *result = malloc(strlen($2)+2);
									strcpy(result,"{");
									strcat(result,$2);
									strcat(result,"}");
									$$=result;}
	| NAME 							{$$=$1;}
	;


%%

int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}
