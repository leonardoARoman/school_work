/*
 * main.c
 *
 *  Created on: Mar 5, 2018
 *      Author: Brendan Li
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

struct tree
{
	char s[1];
	struct tree *l;
	struct tree *r;
}*root = NULL;

struct tree* newnode(char);
void printout(struct tree*);
void forkProcess(struct tree*);
void CONT_handler(int);

int main()
{

	root = newnode('A');
	root -> l = newnode('B');
	root -> r = newnode('C');
	root -> l -> l = newnode('D');
	// printout(root);
	forkProcess(root);
	return 0;
}

struct tree* newnode(char name)
{
	struct tree* node = (struct tree*)malloc(sizeof(struct tree));
	node -> s[0] = name;
	node -> l = NULL;
	node -> r = NULL;
	return(node);
}

void printout(struct tree *T)
{
	if (T -> l)
		printout(T -> l);
	printf("%s->", T -> s);
	if (T -> r)
		printout(T -> r);
}

void forkProcess(struct tree *T)
{
	pid_t pid, ppid;
	if (T -> l != NULL)
		forkProcess(T -> l);
	pid = fork();
	if(pid == 0){
		// children 
		signal(SIGCONT, CONT_handler);
		ppid = getppid();
		printf("Child. Parent:%d\n", ppid);
		kill(ppid, SIGSTOP)
	}
	else if(pid > 0){
		//parent 
		ppid = getppid();
		printf("Parent\n");
		raise(SIGSTOP);
	}
	else{
		// fork error
		printf("fork error\n");
	}
	// printf("my PID is %d\n", pid);
	if (T -> r != NULL)
		forkProcess(T -> r);
}

void CONT_handler(int sig)
{
	printf("SIGCONT received\n");
}