#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

int main(void){

  pid_t pid;
  int counter = 0;
  pid = fork();

  if (pid == 0) {
    fork();
    counter+=1;
    printf("Hello from child: %d\n",counter );
  }

  fork();
  wait(&pid);
  counter+=2;
  printf("Hello from parent: %d\n",counter );
}
