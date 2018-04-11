#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <limits.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>

int shmid;
int *num;
int size = 0;

int main(int argc, char *argv[]){

  struct timeval start,end;
  gettimeofday(&start,NULL);

  shmid = shmget(IPC_PRIVATE, 1000000*sizeof(int), 0666 | IPC_CREAT);
  num = shmat(shmid, 0, 0);

  FILE *in = fopen(argv[1], "r");
  
  int count = 0;
  int sumofallint = 0;
  int maximum_num = INT_MIN;
  int minimum_num = INT_MAX;
  
  while(fscanf(in, "%d\n", &num[size++]) != EOF);

  
  while(count < size){
    int readn = num[count];
    if(readn < minimum_num) minimum_num = readn;
    if(readn > maximum_num) maximum_num = readn;
    sumofallint += readn;
    count++;
  }

  FILE *out = fopen(argv[2], "w+");
  fprintf(out, "hi, i\'m process %d and my parent is %d\n", getpid(), getppid());
  fprintf(out, "Minimum = %d\n", minimum_num);
  fprintf(out, "Maximum = %d\n", maximum_num);
  fprintf(out, "Sum = %d\n", sumofallint);

  shmdt(num);
  shmctl(shmid, IPC_RMID, NULL);

  gettimeofday(&end,NULL);
  printf("%ld microseconds\n", (end.tv_sec*100000 + end.tv_usec) - (start.tv_sec*100000 + start.tv_usec));

  return 0;
}