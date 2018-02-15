#ifndef __ASSIST_H__
#define __ASSIT_H__

#include "Project2.tab.h"

/*
typedef enum t_TerminalType{
	
	t_Null,
	t_program,
	t_VarDeclList,
	t_VarDecl,
	t_FuncDeclList,
	t_FuncDecl,
	t_ParamDecl,
	t_ParamDeclList,
	t_ParamDeclListTail,
	t_Block,
	t_StmtList,
	t_Stmt,
	t_expression,
	t_Primary,
	t_ExprList,
	t_ExprListTail,
	t_UnaryOp,
	t_BinaryOp,
	t_Type
    
} TerminalType;
 
 */

typedef struct t_generateTree{
	TerminalType type;
    
    
    int value;
    struct t_generateTree *left;
    struct t_generateTree *right;
    
} generateTree;

//generateTree *createWords(char *words);

//generateTree *createNumbers(int value);

generateTree *createOperation(yytokentype term, generateTree *left, generateTree *right);

generateTree *createIfOperation(yytokentype term, generateTree *left, generateTree *right);

void deleteExpression(generateTree *d);

#endif


