#include "Assist.h"
#include "Project2.tab.h"
#include <stdlib.h>

static generateTree *allocateProcess()
{
    generateTree *d = (generateTree *)malloc(sizeof(generateTree));
    
    if (d == NULL){
        return NULL;
    }
    
    d -> term = t_program;
    d -> value = 0;
    d -> left = NULL;
    d -> right = NULL;
    
    return d;
}

generateTree *createOperation(yytokentype term, generateTree *left, generateTree *right){
    
    generateTree *d = allocateProcess();
    
    
    if(d == NULL){
        return NULL;
    }
    
    d -> term = term;
    d -> left = left;
    d -> right = right;
    
    return d;
}

void deleteExpression(generateTree *d){
    if(d == NULL){
        return;
    }
    deleteExpression(d->left);
    deleteExpression(d->right);
    
    free(b);
}
