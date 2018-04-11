/*
Brett Lechner
Project 1 - Problem 2
*/


#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <ctype.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

/* This program will accept a file input in the form:
A 2 B C
B 2 D E
C 1 F
And it will then create a n-ary tree structure, print the tree in a text form,
create a process tree from the structure, and print some relevant info about the 
processes it creates.

The input file format is important!
The beginning char notes a parent process, an int is children number, and the 
char's following are the children's name. If a process has no children, the program
will take care of it by itself, no need to include that in the file.
Each process can only be identified by a single char, please note that.
So in theory the max number of process that can be created is down to how many
single characters can be used to identify them.
*/

// Tree structure
struct tree_node {
	int children_no;
	char name;
	struct tree_node *child;
	struct tree_node *next;
};

typedef struct tree_node tree_node;

// Helper Functions
tree_node * new_node(int, char);
tree_node * add_sibling(tree_node *, int, char);
tree_node * add_child(tree_node *, int, char);
int find_place(char*, int, char);
tree_node * return_child(tree_node*, char);

// Important functions
void create_tree(char *buffer, int location, tree_node *root); // recursive
tree_node * read_tree_file(const char *filename);
void print_tree(tree_node * root); // recursive
void make_processes(tree_node*); // recursive

int marker = 0;

int main(int argc, char** argv)
{
	pid_t pid;
	printf("\nCreating tree from file...\n");
	tree_node * root = read_tree_file(argv[1]); // create the tree structure

	// Make process for ease of use for functions
	pid = fork();
	if (pid > 0) {
		sleep(2);
		printf("\nPrinting tree:\n");
		print_tree(root);
		printf("\n");
		while ((wait(0) > 0));
	}
	else if (pid == 0) {
		printf("\nCreating process tree:\n");
		make_processes(root); // create the process tree
	}
	else {
		perror("fork");
		exit(0);
	}
	return 0;
}

// Makes a new node
tree_node * new_node(int children, char name){
	// TODO: make process creation in here
	tree_node *new = malloc(sizeof(tree_node));
	if(new){
		new->next = NULL;
		new->child = NULL;
		new->name = name;
		new->children_no = children;
	}
	return new;
}

// Puts a new node into the next pointer of the first child
tree_node * add_sibling(tree_node * node, int children, char name){
	if(node==NULL){
		return NULL;
	}
	while(node->next){
		node = node->next;	
	}
	return (node->next = new_node(children, name));
}

// Adds a child to a root node, or goes to siblings
tree_node * add_child(tree_node *node, int children, char name){
	if(node==NULL){
		return NULL;
	}
	if(node->child){
		return add_sibling(node->child, children, name);
	}
	else
		return (node->child = new_node(children, name));
}

// Find the pointer that has the name needed
tree_node * return_child(tree_node *node, char name) {
	if (node == NULL) {
		return NULL;
	}
	// If node has a child
	if (node->child) {
		// Point to the child
		node = node->child;

		// If the child's name is equal to our name, return that node
		if (node->name == name) {
			return node;
		}
		// Else if, that child has siblings, find the one that has the name
		if (node->next) {
			while (node->next) {
				node = node->next;
				if (node->name == name) {
					return node;
				}
			}
		}
	}
}

// Recursive function used to create the tree
void create_tree(char *buffer, int location, tree_node *root){
	int num = root->children_no;
	int holder = 0;
	int place = 0;

	if(num==1){
		// Only one child
		holder = location + 4;
		place = find_place(buffer, holder + 1, buffer[holder]);
		if (place >= 0) {
			//Child does have children
			add_child(root, buffer[place + 2] - '0', buffer[place]);

			// recursively call the function
			create_tree(buffer, place, return_child(root, buffer[place]));
		}
		else {
			// Child does NOT have children
			add_child(root, 0, buffer[holder]);
		}
	}
	else if(num>1){
		// More than one child (siblings)

		// holder = place of char for child, ex_place = find location of child in file	
		for(int i = 0; i < num; i++){

			holder = location + 4 + (2*i);
			place = find_place(buffer, holder+1, buffer[holder]);

			if (place >= 0) {
				//Child does have children

				add_child(root, buffer[place + 2]-'0', buffer[place]);

				// recursively call the function
				create_tree(buffer, place, return_child(root, buffer[place]));
			}
			else {
				// Child does NOT have children
				add_child(root, 0, buffer[holder]);
			}
			
		}	
	} 
}

int find_place(char *buffer, int number, char name){
	int place = 0;
	// Search through file to find location of the node (if it has children)
	for(int i = number; buffer[i]; i++){
		if(buffer[i] == name){
			place = i;
			return place;
		}
	}
	// Return -1 if the node isn't in the file (has no children)
	return -1;
}

// Our function to read file contents, create the tree, and return a pointer to the root
tree_node * read_tree_file(const char *filename) {
	FILE *fp;
	long size;
	char * buffer;
	char c;

	// Open file and error check
	fp = fopen(filename, "r");
	if (fp == NULL) {
		perror("./p05");
		exit(1);
	}

	// Find size for buffer and error check
	fseek(fp, 0, SEEK_END);
	size = ftell(fp);
	rewind(fp);
	buffer = (char*)malloc(sizeof(char)*size);
	if (buffer == NULL) { perror("./p05"); exit(1); }

	// Read file contents
	fread(buffer, 1, size, fp);

	// Create the root node
	tree_node * root = new_node(buffer[2]-'0', buffer[0]);

	// Create the tree
	create_tree(buffer, 0, root);

	fclose(fp);
	free(buffer);

	// Return the root after making the tree
	return root;
}

// Function to print tree
void print_tree(tree_node * root) {
	printf("Node: %c\n", root->name);
	printf("Children: %i", root->children_no);
	tree_node *traverse = root;
	if (root->child) {
		traverse = traverse->child;
		printf(", %c", traverse->name);
		while (traverse->next) {
			traverse = traverse->next;
			printf(" %c", traverse->name);
		}
	}
	printf("\n");
	if (root->next) {
		print_tree(root->next);
	}
	if (root->child) {
		print_tree(root->child);
	}
}

// Function that makes a process tree out of a tree_node tree
void make_processes(tree_node* root) {
	tree_node * traverse = root;
	pid_t pid;
	// if child, create new process
	if (root->child) {
		pid = fork();
		if (pid > 0) { // parent, needs to find other children
			traverse = traverse->child;
			printf("Parent: %c, pid=%i\n", root->name, getpid());

			while (traverse->next) { // find other children, and create processes
				pid = fork();
				traverse = traverse->next;
				if (pid == 0) { // other children
					printf("Child: %c, ppid=%i, pid=%i\n", traverse->name, getppid(), getpid());
					make_processes(traverse);
					sleep(5);
					printf("Child: %c, terminating\n", traverse->name);
					exit(1);
				}
			}
		}
		else if (pid == 0) { // child
			printf("Child: %c, ppid=%i, pid=%i\n", root->child->name, getppid(), getpid());
			make_processes(root->child);
			sleep(5);
			printf("Child: %c, terminating\n", root->child->name);
			exit(1);
		}
		else {
			printf("Fork Error\n");
			exit(1);
		}
		while ((wait(0) > 0)); // wait for all children to return
		printf("Parent: %c, terminating\n", root->name);
		exit(0);
	}
}