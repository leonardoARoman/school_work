/*
  Parallel calculation of numerical expression
  Leonardo Roman
  Project 1, Problem 4.
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
  char* value;
	struct node *left;
	struct node *right;
}typedef node_t;

void print_inorder(node_t * tree);
void insert(node_t ** node, char* val);
node_t* processTree2(node_t * tree);


// Main function.
int main()
{
  node_t *root = NULL;
	char* aux;

  char str[MAXCHAR];
  char stack_tree[100][100];
  char* filename = "testVector.txt";
  int count = 0;

  fp = fopen(filename, "r");
  if (fp == NULL){
      printf("Could not open file %s",filename);
      return 0;
  }

  while (fgets(str, MAXCHAR, fp) != NULL){
    str[strlen(str)-1] = ' ';
    aux = strdup(str);
		insert( &root, aux );
  }

  printf("tree in order traversal:\n[leftChild] <-[rootNode]-> [rightChild]\n");
  print_inorder(root);
  printf("\nfunction call: processTree2(root)\n");
  processTree2(root);

	return 0;
}

// Helper function( print in order )
void print_inorder(node_t * tree) {
 if (tree) {
     print_inorder(tree->left);
     if (tree->left == NULL || tree->right == NULL)
       return;
     printf("%s<-[ %s]-> %s\n",tree->left->value,tree->value, tree->right->value );
     print_inorder(tree->right);
   }
}

// Helper function: insert new node
void insert(node_t ** node, char* val) {
  node_t *temp = NULL;
  if(!(*node)) {
    temp = (node_t*)malloc(sizeof(node_t));
    temp->left = temp->right = NULL;
    temp->value = val;
    *node = temp;
    return;
  }

  if((*node)->left == NULL) {
    insert(&(*node)->left, val);
  } else {
    insert(&(*node)->right, val);
  }
}

// Recursive function: process tree function.
node_t* processTree2(node_t * tree) {

  printf("root = %s\n", tree->value);
  char stack_tree[100][100];
  char contact[100];
  char contact2[100];
  node_t * root = NULL;
  node_t * root2 = NULL;
  unsigned int k = strlen(contact_new);
  int pipe1[2];
  int pipe2[2];
  if (pipe(pipe1)<0 || pipe(pipe2)<0) {
    printf("Error\n");
    exit(0);
  }
  if (tree) {
    if (tree->left==NULL || tree->right==NULL) {
      return tree;
    }
    pid_t pid = fork();
    if (pid > 0) {
      printf("\nIn parent process:\n");
      // Parent process.
    if (tree->left!=NULL) {
      write(pipe1[1], &tree->left,sizeof(tree->left));
      printf("Writing (root->left) to child...\n");
    }
    if (tree->right!=NULL) {
      write(pipe2[1], &tree->right,sizeof(tree->right));
      printf("Writing (root->right) to child...\n");
    }

    printf("waiting on child...\n");
    wait(&pid); // wait for child.

    read(pipe1[0],contact,100);
    read(pipe2[0],contact2,100);

    printf("Pipe1: reading back from child...\noperation1 = %s\n", contact);
    printf("Pipe2: reading back from child...\noperation2 = %s\n", contact2);

    for (int i = 0; i < strlen(contact); i++) {
      contact_new[k++] = contact[i];
    }

    for (int i = 0; i < strlen(tree->value); i++) {
      contact_new[k++] = tree->value[i];
    }

    for (int i = 0; i < strlen(contact2); i++) {
      contact_new[k++] = contact2[i];
    }

    contact_new[k] = '\0';
    printf("Final output:\n");
    printf("%s\n", contact_new);

  }else{
    // Child process.
    printf("\nIn child process:\n");
    node_t *ptr1, *ptr2;
    // Child process.
    read(pipe1[0], &root, sizeof(root));
    read(pipe2[0], &root2, sizeof(root));
    printf("Pipe1: reading from parent root = %s\n", root->value);
    printf("Pipe2: reading from parent root2 = %s\n", root2->value);

    if (root->left!=NULL) {
      printf("processTree2(root1->left)\n");
      ptr1 = processTree2(root->left);
    }

    if (root->right!=NULL) {
      printf("processTree2(root1->right)\n");
      ptr2 = processTree2(root->right);
    }

    if (root2->left!=NULL) {
      printf("func call: processTree2(root2->left)\n");
      ptr1 = processTree2(root2->left);
    }

    if (root2->right!=NULL) {
      printf("func call: processTree2(root2->right)\n");
      ptr2 = processTree2(root2->right);
    }

    unsigned long k = strlen(contact);
    unsigned long j = strlen(contact2);

    for (int i = 0; i < strlen(ptr1->value); i++) {
      contact[k++] = ptr1->value[i];
    }
    for (int i = 0; i < strlen(root2->value); i++) {
      contact[k++] = root2->value[i];
    }
    for (int i = 0; i < strlen(ptr2->value); i++) {
      contact[k++] = ptr2->value[i];
    }
    for (int i = 0; i < strlen(ptr2->value); i++) {
      contact2[j++] = root->value[i];
    }

    printf("\nLeaf node return:\noperation1 = %s\n",contact );
    printf("Leaf node return:\noperation2 = %s\n\n",contact2 );

    contact[k] = '\0';
    contact2[j] = '\0';

    write(pipe1[1],contact,strlen(contact)+1);
    write(pipe2[1],contact2,strlen(contact2)+1);
    printf("Writing back to parent in pipe1...\n");
    printf("Writing back to parent in pipe2...\n");

    exit(0);
  }
 }
 return tree;
}
