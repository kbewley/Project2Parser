# include <stdio.h>
# include <stdlib.h>
# include <stdarg.h>
# include <string>
# include <iostream>


/* nodes in the abstract syntax tree */
struct node {
	int nodetype;
	struct node *left;
	struct node *right;
	struct node *parent;
	std::string * data;
};

struct node * newTree(int nodeNum, std::string * yydata){
	node * root = new node;
	root->nodetype = nodeNum;
	root->data = yydata;
	root->right = NULL;
	root->left = NULL;
	root->parent = NULL;
}

void insertRight(node * top, node * leaf){
	top->right = leaf;
	top->right->parent = top;
}

void insertLeft(node * top, node * leaf){
	top->left = leaf;
	top->right->parent = top;
}

void printTree(node * root){
	if(root->parent == NULL){
		std::cout<< "Type = Parent\n";
	}
	else{
		std::cout<< "Type = Leaf\n";
	}
	
	std::cout<< "Data = ", root->data, "\n";
	if(root->left == NULL){
		std::cout<< "Left Leaf = NULL\n";
	}
	else{
		std::cout<< "Left Leaf =", root->left->data, "\n";
	}
	
	if(root->right == NULL){
		std::cout<< "Right Leaf = NULL\n";
	}
	else{
		std::cout<< "Right Leaf =", root->right->data, "\n";
	}
	printTree(root->left);
	printTree(root->right);
}

int main(){
	return 0;
}

	