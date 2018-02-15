%{

#include "Project2.hpp"
%}

%optionyylineno
%optionnoyywrap
DIGIT [0-9]


%%
"int"											return INT_TYPE;
"char" 											return CHAR_TYPE;
"!"												return NOT_OPERATOR;
"+"												return ADD_OPERATOR;
"-"												return SUB_OPERATOR;
"*"												return MULTIPLY_OPERATOR;
"/"												return DIVIDE_OPERATOR;
"="												return EQUAL_OPERATOR;
","												return COMMA_OPERATOR;
">"												return GREATER_COMPARISON;
">="											return GREATEREQ_COMPARISON;
"<"												return LESS_COMPARISON;
"<="											return LESSEQ_COMPARISON;
"=="											return EQ_COMPARISON;
"!="											return NOT_EQ_COMPARISON;
"||"											return OR_COMPARISON;
"&&"											return AND_COMPARISON;
"read"											return READ_STATEMENT;
"return"										return RETURN_STATEMENT;
"if"											return IF_STATEMENT;
"while"											return WHILE_STATEMENT;
"write"											return WRITE_STATEMENT;
"writeln" 										return WRITELN_STATEMENT;
"break"											return BREAK_STATEMENT;
[a-zA-Z][_a-zA-Z0-9]*							return IDENTIFIER;
{DIGIT}+										return INTEGER;
{DIGIT}+"."{DIGIT}*								return FLOAT;
";"												return NEXTLINE;
"{"                 							return LEFTBRACE;
"}"                								return RIGHTBRACE;
"("                								return LEFTPAR;
")"                								return RIGHTPAR;
"["												return SQUARELEFTBRACKET;
"]"												return SQUARERIGHTBRACKET;
[ \t\n] 										; 	
.												printf("Character not within the language\n");
%%

int yywrap(void)
{
return 1;
}




