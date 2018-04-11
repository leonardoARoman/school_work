/*
  Leonardo Roman
  Problem 4 project 1.
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
FILE *fp;

struct node {
  char* value;
	struct node *left;
	struct node *right;
}typedef node_t;

/*
void print_preorder(node_t * tree) {
 if (tree) {
   if (tree->left == NULL || tree->right == NULL)
     return;
   printf("%s<-[ %s]-> %s\n",tree->left->value,tree->value, tree->right->value );
   print_preorder(tree->left);
   print_preorder(tree->right);
  }
}
*/
void print_inorder(node_t * tree) {
 if (tree) {
   pid_t pid = fork();
   if (pid > 0) {
     // Parent.
     print_inorder(tree->left);
     wait(&pid);// wait for child.
     if (tree->left == NULL || tree->right == NULL)
       return;
     printf("%s<-[ %s]-> %s\n",tree->left->value,tree->value, tree->right->value );
   }else{
     // child.
     print_inorder(tree->right);
     exit(0);
   }
 }
}
/*
void print_postorder(node_t * tree) {
 if (tree) {
   print_postorder(tree->left);
   print_postorder(tree->right);
   if (tree->left == NULL || tree->right == NULL)
     return;
   printf("%s<-[ %s]-> %s\n",tree->left->value,tree->value, tree->right->value );
 }
}
*/
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

int main()
{
  /*create root*/
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
    // To populate binary tree.
    str[strlen(str)-1] = ' ';
    aux = strdup(str);
		insert( &root, aux );
  }

  //printf("print_preorder:\n");
  //print_preorder(root);
  printf("print_inorder:\n");
  print_inorder(root);
  //printf("print_postorder:\n");
  //print_postorder(root);

	return 0;
}
/*
#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include <string.h>
#include <assert.h>

#define MAXCHAR 1000
FILE *fp;

struct avl_node_s {
  char* value;
	struct avl_node_s *left;
	struct avl_node_s *right;
};

typedef struct avl_node_s avl_node_t;

struct avl_tree_s {
	struct avl_node_s *root;
};

typedef struct avl_tree_s avl_tree_t;

void print_preorder(avl_node_t * tree) {
 if (tree) {
   printf("%s\n",tree->value);
   print_preorder(tree->left);
   print_preorder(tree->right);
  }
}

void print_inorder(avl_node_t * tree) {
 if (tree) {
   print_inorder(tree->left);
   printf("%s\n",tree->value);
   print_inorder(tree->right);
 }
}

void print_postorder(avl_node_t * tree) {
 if (tree) {
   print_postorder(tree->left);
   print_postorder(tree->right);
   printf("%s\n",tree->value);
 }
}
*/

/* Create a new AVL tree.
avl_tree_t *avl_create() {
	avl_tree_t *tree = NULL;

	if( ( tree = malloc( sizeof( avl_tree_t ) ) ) == NULL ) {
		return NULL;
	}

	tree->root = NULL;

	return tree;
}

// Initialize a new node.
avl_node_t *avl_create_node() {
	avl_node_t *node = NULL;

	if( ( node = malloc( sizeof( avl_node_t ) ) ) == NULL ) {
		return NULL;
	}

	node->left = NULL;
	node->right = NULL;
	node->value = malloc( sizeof(char*)*64 );

	return node;
}


// Insert a new node.
void avl_insert( avl_tree_t *tree, char* value ) {
	avl_node_t *node = NULL;
	avl_node_t *next = NULL;
	avl_node_t *last = NULL;

	// Well, there must be a first case
	if( tree->root == NULL ) {
		node = avl_create_node();
		node->value = value;

		tree->root = node;

	// Okay.  We have a root already.  Where do we put this?
	} else {
		next = tree->root;

		while( next != NULL ) {
			last = next;

			if( strcmp(value,next->value) < 0 ) {
				next = next->left;

			} else if( strcmp(value,next->value) > 0 ) {
				next = next->right;

			// Have we already inserted this node?
			} else if( strcmp(value,next->value) == 0 ) {
				return;
			}
		}

		node = avl_create_node();
		node->value = value;

		if( strcmp(value,last->value) < 0 ) last->left = node;
		if( strcmp(value,last->value) > 0 ) last->right = node;

	}

}

// Find the node containing a given value
avl_node_t *avl_find( avl_tree_t *tree, char* value ) {
	avl_node_t *current = tree->root;

	while( current && (strcmp(current->value,value)!=0) ) {
		if( strcmp(value,current->value) > 0 )
			current = current->right;
		else
			current = current->left;
	}
	return current;
}

// Do a depth first traverse of a node.
void avl_traverse_node_dfs( avl_node_t *node, int depth ) {
	int i = 0;

	if( node->left ) avl_traverse_node_dfs( node->left, depth + 2 );

	for( i = 0; i < depth; i++ ) putchar( ' ' );
	//printf( "%s: %d\n", node->value, avl_balance_factor( node ) );

	if( node->right ) avl_traverse_node_dfs( node->right, depth + 2 );
}

// Do a depth first traverse of a tree.
void avl_traverse_dfs( avl_tree_t *tree ) {
	avl_traverse_node_dfs( tree->root, 0 );
}

void avl_print_node( avl_node_t *node, char* fmt) {
	int i = 0;

	if( node->left ) avl_print_node( node->left, fmt);

	printf( fmt, node->value);

	if( node->right ) avl_print_node( node->right, fmt);
}

void avl_print( avl_tree_t *tree, char* fmt) {
	//avl_print_node( tree->root, fmt);
  printf("print_preorder:\n");
  print_preorder(tree->root);
  printf("print_inorder:\n");
  print_inorder(tree->root);
  printf("print_postorder:\n");
  print_postorder(tree->root);
}

void avl_count_node( avl_node_t *node, int* res ) {
	if( node->left ) avl_count_node( node->left, res);
	*res = *res+1;
	if( node->right ) avl_count_node( node->right, res);
}

void avl_count(avl_tree_t *tree, int* res) {
	avl_count_node(tree->root, res);
}

int main( int argc, char **argv ) {
	avl_tree_t *tree = NULL;
	char* aux;

	tree = avl_create();

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
    // To populate binary tree.
    aux = strdup(str);
		avl_insert( tree, aux );
  }

	avl_print( tree , "%s\n");
	return 0;
}
*/
