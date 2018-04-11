#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include "minmaxsumcount.h"

FILE *writeFile;
int shmid;
int *nums;
int size;

void processIPC(int StartOfProcess, int EndOfProcess, minmaxsumcount *new_info, int AmtOfP){
  
  int cutoff = (StartOfProcess + EndOfProcess)/2;
  
  fprintf(writeFile, "hi, i\'m process %d and my parent is %d\n", getpid(), getppid());
  
  if (AmtOfP <= 0){
    while(StartOfProcess <= EndOfProcess){
      int num = nums[StartOfProcess];
      if (num < new_info->minimum_num) new_info->minimum_num = num;
      if (num > new_info->maximum_num) new_info->maximum_num = num;
      new_info->sum += num;
      new_info->count++;
      StartOfProcess++;
    }
    return;
  }

  int fd[2];
  pipe(fd);
  pid_t childpid;

  fflush(writeFile);
  childpid = fork();

  if (childpid == 0){
    close(fd[0]);
    processIPC(cutoff+1, EndOfProcess, new_info, AmtOfP-1);
    write(fd[1], new_info, sizeof(minmaxsumcount));
    exit(0);
  }
  else{
    close(fd[1]);
    processIPC(StartOfProcess, cutoff, new_info, AmtOfP-1);

    minmaxsumcount next_info;
    read(fd[0], &next_info, sizeof(minmaxsumcount));
    if (next_info.minimum_num < new_info->minimum_num) new_info->minimum_num = next_info.minimum_num;
    if (next_info.maximum_num > new_info->maximum_num) new_info->maximum_num = next_info.maximum_num;
    new_info->sum += next_info.sum;
    new_info->count += next_info.count;

    waitpid(childpid,nums,WNOHANG);
  }
}

int main(int argc, char *argv[]){
  struct timeval start_time,end_time;
  gettimeofday(&start_time,NULL);

  shmid = shmget(IPC_PRIVATE, 1000000*sizeof(int), 0666 | IPC_CREAT);
  nums = shmat(shmid, 0, 0);

  FILE *readFile = fopen(argv[1], "r");
  writeFile = fopen(argv[2], "w+");
  int AmtOfP = atoi(argv[3]);
  int NumOfProcesses = 1;
  int iteration = AmtOfP-1;
  size = 0;
  while(iteration > 0){
    NumOfProcesses *= 2;
    iteration--;
  }

  while(fscanf(readFile, "%d\n", &nums[size++]) != EOF);

  minmaxsumcount new_info = {.minimum_num = INT_MAX, .maximum_num = INT_MIN, .sum = 0, .count = 0};
  processIPC(0, size-1, &new_info, AmtOfP-1);

  fprintf(writeFile, "Minimum = %d\n", new_info.minimum_num);
  fprintf(writeFile, "Maximum = %d\n", new_info.maximum_num);
  fprintf(writeFile, "Sum = %d\n", new_info.sum);

  fclose(readFile);
  fclose(writeFile);

  shmdt(nums);
  shmctl(shmid, IPC_RMID, NULL);

  gettimeofday(&end_time,NULL);
  printf("%ld microseconds\n", (end_time.tv_sec*100000 + end_time.tv_usec) - (start_time.tv_sec*100000 + start_time.tv_usec));

  return 0;
}
