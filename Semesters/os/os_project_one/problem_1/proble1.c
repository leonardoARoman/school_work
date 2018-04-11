/*
  Parallel calculation of numerical expression
  Leonardo Roman
  Project 1, Problem 1.
  Tree process.
*/
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/wait.h>

#define MAXCHAR 1000
char contact_new[100];
FILE *fp;

struct node {
  char name;
  char value;
	struct node *left;
	struct node *right;
}typedef node_t;

void sig_handler(int sig);
void print_inorder(node_t * tree);
void insert(node_t ** node, char val1, char val2);

// Main function.
int main()
{
  node_t *root = NULL;
	char aux1;
  char aux2;

  char str[MAXCHAR];
  char stack_tree[100][100];
  char* filename = "testFile.txt";
  int count = 0;

  fp = fopen(filename, "r");
  if (fp == NULL){
      printf("Could not open file %s",filename);
      return 0;
  }

  while (fgets(str, MAXCHAR, fp) != NULL){
    str[strlen(str)-1] = ' ';
		insert( &root, str[0], str[2] );
  }

  printf("tree in order traversal:\n");
  print_inorder(root);
  printf("\n");
	return 0;
}

// Helper function( print in order )
void print_inorder(node_t* node){

  if (node == NULL)
    return;

  pid_t pid = fork();
  if (pid>0) {
    printf("\nWaiting on child...\n");
    wait(&pid);
    printf("%c->",node->name);
  }
  else{
    print_inorder(node->left);
    print_inorder(node->right);
    exit(0);
  }
}

// Helper function: insert new node
void insert(node_t ** node, char val1, char val2) {
  node_t *temp = NULL;
  if(!(*node)) {
    temp = (node_t*)malloc(sizeof(node_t));
    temp->left = temp->right = NULL;
    temp->name = val1;
    temp->value = val2;
    *node = temp;
    return;
  }

  if((*node)->left == NULL) {
    insert(&(*node)->left, val1, val2);
  } else {
    insert(&(*node)->right, val1, val2);
  }
}


void sig_handler(int sig){
  printf("\nSignal handler was called...\nCought signal: %d\n", sig);

}
