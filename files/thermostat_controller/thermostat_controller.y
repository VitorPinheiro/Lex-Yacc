%{
#include <stdio.h>
#include <string.h>
 
// The yyerror() function is called by YACC if it finds an error. We simply output the message passed, but there are smarter things to do.
void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
}
 
// The function yywrap() can be used to continue reading from another file. It is called at EOF and you can than open another file, and return 0. Or you can return 1, indicating that this is truly the end.
int yywrap()
{
        return 1;
} 
  
// Then there is the main() function, that does nothing but set everything in motion.
main()
{
        yyparse();
} 

%}

// This line simply defines the tokens we will be using. These are output using y.tab.h if YACC is invoked with the '-d' option.
%token NUMBER TOKHEAT STATE TOKTARGET TOKTEMPERATURE TOKHUMIDITY


// What is called 'yylval' in Lex has a different name in YACC. 

%start commands
%%
commands: /* empty */
        | commands command
        ;

command:
        heat_switch
        |
        target_set
        |
        humidity_set
        ;

heat_switch:
        TOKHEAT STATE
        {
            if($2)
                printf("\tHeat turned on\n");
            else
                printf("\tHeat turned off\n");
        }
        ;

target_set:
        TOKTARGET TOKTEMPERATURE NUMBER
        {
            //To access the value of the third part of the rule (ie, NUMBER), we need to use $3. Whenever yylex() returns, the contents of yylval are attached to the terminal, the value of which can be accessed with the $-construct.
            printf("\tTemperature set to %d\n",$3);
        }
        ;

humidity_set:
        TOKTARGET TOKHUMIDITY NUMBER
        {
            printf("\tHumidity set to %d\n",$3);
        }
        ;        
%%