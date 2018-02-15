%{
    
/* C declarations used in actions */
#include <stdlib.h>
#include <string>
#include <iostream>

void yyerror (std::string error);
extern int yylex();
extern int yyparse();
extern char* yytext;
extern FILE *yyin;
%}

%define parse.error verbose


%union {
	int value;
	struct generateTree *operation;
}


   
%start program;
%token <value> IF_STATEMENT
%token <value> ELSE_STATEMENT
%token <value> THEN_STATEMENT
%token <value> RETURN_STATEMENT
%token <value> WHILE_STATEMENT
%token <value> WRITE_STATEMENT
%token <value> WRITELN_STATEMENT
%token <value> READ_STATEMENT
%token <value> BREAK_STATEMENT
%token <value> GREATER_COMPARISON
%token <value> GREATEREQ_COMPARISON
%token <value> LESS_COMPARISON
%token <value> LESSEQ_COMPARISON
%token <value> EQ_COMPARISON
%token <value> NOT_EQ_COMPARISON
%token <value> OR_COMPARISON
%token <value> AND_COMPARISON
%token <value> NOT_OPERATOR
%token <value> ADD_OPERATOR
%token <value> SUB_OPERATOR
%token <value> MULTIPLY_OPERATOR
%token <value> DIVIDE_OPERATOR
%token <value> EQUAL_OPERATOR
%token <value> COMMA_OPERATOR
%token <value> INT_TYPE
%token <value> CHAR_TYPE
%token <value> IDENTIFIER
%token <value> INTEGER
%token <value> FLOAT
%token <value> LEFTBRACE
%token <value> RIGHTBRACE
%token <value> LEFTPAR
%token <value> RIGHTPAR
%token <value> SQUARELEFTBRACKET
%token <value> SQUARERIGHTBRACKET
%token <value> NEXTLINE;


%type <operation> ParamDeclListTail
%type <operation> ParamDeclList
%type <operation> ParamDecl
%type <operation> VarDeclList
%type <operation> VarDecl
%type <operation> FuncDecl
%type <operation> Block
%type <operation> StmtList 
%type <operation> Stmt 
%type <operation> expression 
%type <operation> UnaryOp 
%type <operation> ExprList
%type <operation> ExprListTail
%type <operation> TYPE
%type <operation> FuncDeclList
%type <operation> BinaryOp
%type <operation> Primary

%%

/* descriptions of expected inputs     corresponding actions (in C) */
               	
program 	   		:FuncDeclList																		{std::cout<< "Bison Recognized FuncDeclList \n";}
                    |VarDeclList                                                                        {std::cout<< "Bison Recognized VarDeclList \n";}
			   		;
		       	
VarDeclList    		: /*empty*/                                                                         {std::cout<< "Bison Recognized Empty VarDeclList \n";}
                    | VarDecl VarDeclList	                                                            {std::cout<< "Bison Recognized a VarDecl Recursion \n";}
		       		;
		       	
VarDecl 	   		: TYPE IDENTIFIER NEXTLINE															{std::cout<< "Bison Recognized VarDecl \n";}
			   		| TYPE IDENTIFIER SQUARELEFTBRACKET INTEGER SQUARERIGHTBRACKET NEXTLINE				{std::cout<< "Bison Recognized Square Bracket Decl \n";}
			   		;
               	
               	
FuncDeclList    	: FuncDecl																			{std::cout<< "Bison Recognized FuncDeclList \n";}
			   		| FuncDecl FuncDeclList																{std::cout<< "Bison Recognized FuncDeclList Recursion \n";}
			   		;
               	
FuncDecl 	   		: TYPE IDENTIFIER LEFTPAR ParamDeclList RIGHTPAR Block								{std::cout<< "Bison Recognized VarDecl \n";}
		 	   		;
               	
			   	
ParamDeclList  		: /*empty*/ 																		{std::cout<< "Bison Recognized Empty Parameters \n";}
			   		| ParamDeclListTail																	{std::cout<< "Bison Recognized ParamDeclListTail \n";}
			   		;
			   	
ParamDeclListTail 	: ParamDecl	  																		{std::cout<< "Bison Recognized a Token \n";}
				 	| ParamDecl COMMA_OPERATOR ParamDeclListTail										{std::cout<< "Bison Recognized ParamList \n";}
				 	;
				 
ParamDecl 			: TYPE IDENTIFIER																	{std::cout<< "Bison Recognized ParamDecl \n";}
		  			| TYPE IDENTIFIER SQUARELEFTBRACKET SQUARERIGHTBRACKET								{std::cout<< "Bison Recognized Brackets ParamDecl \n";}
		 		   	;
		  
Block 				: LEFTBRACE VarDeclList StmtList RIGHTBRACE											{std::cout<< "Bison Recognized Blocks \n";}
	  				;
	  
StmtList 			: Stmt																				{std::cout<< "Bison Recognized a Statement \n";}
			 		| Stmt StmtList																		{std::cout<< "Bison Recognized Statement recursion \n";}
		 		   	;
		 
Stmt 				: NEXTLINE																			{std::cout<< "Bison Recognized Semi-Colon End Statement \n";}
                    | READ_STATEMENT IDENTIFIER NEXTLINE                                                {std::cout<< "Bison Recognized Read Statment \n";}
					| IF_STATEMENT LEFTPAR expression RIGHTPAR Stmt ELSE_STATEMENT Stmt					{std::cout<< "Bison Recognized If Else Statement \n";}
					| WHILE_STATEMENT LEFTPAR expression RIGHTPAR										{std::cout<< "Bison Recognized While Loop \n";}
					| WRITE_STATEMENT expression NEXTLINE												{std::cout<< "Bison Recognized WriteStatement \n";}
					| WRITELN_STATEMENT NEXTLINE														{std::cout<< "Bison Recognized WriteLN Statement \n";}
					| BREAK_STATEMENT NEXTLINE															{std::cout<< "Bison Recognized Break Statement \n";}
					| RETURN_STATEMENT IDENTIFIER NEXTLINE												{std::cout<< "Bison Recognized Return Statement \n";}
					| Block																				{std::cout<< "Bison Recognized Block Statement \n";}
					;
					
expression 			: Primary																			{std::cout<< "Bison Recognized a Primary Expression \n";}
		   			| UnaryOp expression																{std::cout<< "Bison Recognized UnaryOp Expression \n";}
		   			| expression BinaryOp expression													{std::cout<< "Bison Recognized Binary Expression \n";}
					| IDENTIFIER LEFTPAR ExprList RIGHTPAR												{std::cout<< "Bison Recognized an Expression List \n";}
		   			| IDENTIFIER EQUAL_OPERATOR expression												{std::cout<< "Bison Recognized Declaration Expression \n";}
		   			| IDENTIFIER SQUARELEFTBRACKET expression SQUARERIGHTBRACKET EQUAL_OPERATOR expression {std::cout<< "Bison Recognized Bracketed Expression \n";}
		   			;
		   			
Primary 			: IDENTIFIER																		{std::cout<< "Bison Recognized an Identifier \n";}
					| INTEGER																			{std::cout<< "Bison Recognized an Integer \n";}
					| LEFTPAR expression RIGHTPAR														{std::cout<< "Bison Recognized Parenthesis Expression \n";}
					| IDENTIFIER LEFTPAR expression RIGHTPAR											{std::cout<< "Bison Recognized Identifier Parenthesis Expression \n";}
					| IDENTIFIER SQUARELEFTBRACKET expression SQUARERIGHTBRACKET						{std::cout<< "Bison Recognized Identifier SquareBracket Expression \n";}
                    ;
		
ExprList			: /*empty*/																			{std::cout<< "Bison Recognized Empty ExprList \n";}
                    | ExprListTail																		{std::cout<< "Bison Recognized ExprListTail \n";}
		 			;
		 			
ExprListTail		: expression																		{std::cout<< "Bison Recognized Expression \n";}
			 		| expression COMMA_OPERATOR ExprListTail											{std::cout<< "Bison Recognized Expression Recursion \n";}
			 		;
			 		
UnaryOp 			: SUB_OPERATOR 																		{std::cout<< "Bison Recognized Sub_Operator \n";}
					| NOT_OPERATOR																		{std::cout<< "Bison Recognized NOT_Operator \n";}
					;
		
BinaryOp 			: ADD_OPERATOR																		{std::cout<< "Bison Recognized Binary Add Operator \n";}
		 			| SUB_OPERATOR																		{std::cout<< "Bison Recognized Binary Sub_Operator \n";}
		 			| MULTIPLY_OPERATOR																	{std::cout<< "Bison Recognized Binary Multipy Operator \n";}
		 			| DIVIDE_OPERATOR                                                                   {std::cout<< "Bison Recognized Binary Divide Opeartor \n";}
		 			| EQ_COMPARISON                                                                     {std::cout<< "Bison Recognized Binary Equal Operator \n";}
		 			| NOT_EQ_COMPARISON                                                                 {std::cout<< "Bison Recognized Binary Not Equal Operator \n";}
		 			| GREATER_COMPARISON                                                                {std::cout<< "Bison Recognized Binary Greater Comparison \n";}
		 			| GREATEREQ_COMPARISON                                                              {std::cout<< "Bison Recognized Binary Greater Eq Comparison \n";}
		 			| LESS_COMPARISON                                                                   {std::cout<< "Bison Recognized Binary Less Comparison \n";}
		 			| LESSEQ_COMPARISON                                                                 {std::cout<< "Bison Recognized Binary Less Eq Comparison \n";}
		 			| AND_COMPARISON                                                                    {std::cout<< "Bison Recognized Binary And Comparison \n";}
		 			| OR_COMPARISON                                                                     {std::cout<< "Bison Recognized Binary Or Comparison \n";}
                    ;
	  
TYPE 				: INT_TYPE																			{std::cout<< "Bison Recognized Type Int \n";}
					| CHAR_TYPE                                                                         {std::cout<< "Bison Recognized Type Char \n";}
					| FLOAT	                                                                            {std::cout<< "Bison Recognized Type Float \n";}
					;
						  

%%



int main (int argc, char** argv) {
	
	if (argc == 1 ){
		std::cout<< "no source\n";
		return 0;
	}
	yyin = fopen(argv[1], "r");
	if(!yyin)
	{
        std::cout<< "could not open file\n";
		perror(argv[1]);
		return (1);
	}
					
	yyparse();
	return 0;
}

void yyerror (std::string error) {
    
    std::cout << "The error you have recieved is " << error << "\n";
}


