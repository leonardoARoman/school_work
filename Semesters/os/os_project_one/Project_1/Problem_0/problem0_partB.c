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
int nProcess;

void processIPC(int StartOfProcess, minmaxsumcount *first_info, int ProcessRemainderP){
  if (StartOfProcess >= size) return;
  fprintf(writeFile, "hi, i\'m process %d and my parent is %d\n", getpid(), getppid());
  
  int EndOfProcess = StartOfProcess + nProcess;
  if (ProcessRemainderP > 0) EndOfProcess++;

  int fd[2];
  pipe(fd);
  pid_t childpid;

  fflush(writeFile);
  childpid = fork();

  if (childpid == 0){
    close(fd[0]);
    processIPC(EndOfProcess, first_info, ProcessRemainderP-1);
    write(fd[1], first_info, sizeof(minmaxsumcount));
    exit(0);
  }
  else{
    close(fd[1]);

    while(StartOfProcess < EndOfProcess){
      int num = nums[StartOfProcess];
      if (num < first_info->minimum_num) first_info->minimum_num = num;
      if (num > first_info->maximum_num) first_info->maximum_num = num;
      first_info->sum += num;
      first_info->count++;
      StartOfProcess++;
    }

    minmaxsumcount next_info;
    read(fd[0], &next_info, sizeof(minmaxsumcount));
    if (next_info.minimum_num < first_info->minimum_num) first_info->minimum_num = next_info.minimum_num;
    if (next_info.maximum_num > first_info->maximum_num) first_info->maximum_num = next_info.maximum_num;
    first_info->sum += next_info.sum;
    first_info->count += next_info.count;

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
  int Num_Of_Processes = atoi(argv[3]);

  size = 0;
  while(fscanf(readFile, "%d\n", &nums[size++]) != EOF);
  nProcess = size/Num_Of_Processes;
  int ProcessRemainder_main = size%Num_Of_Processes;

  minmaxsumcount first_info = {.minimum_num = INT_MAX, .maximum_num = INT_MIN, .sum = 0, .count = 0};
  processIPC(0, &first_info, ProcessRemainder_main);

  fprintf(writeFile, "Minimum = %d\n", first_info.minimum_num);
  fprintf(writeFile, "Maximum = %d\n", first_info.maximum_num);
  fprintf(writeFile, "Minimum = %d\n", first_info.sum);

  fclose(readFile);
  fclose(writeFile);

  shmdt(nums);
  shmctl(shmid, IPC_RMID, NULL);

  gettimeofday(&end_time,NULL);
  printf("%ld microseconds\n", (end_time.tv_sec*100000 + end_time.tv_usec) - (start_time.tv_sec*100000 + start_time.tv_usec));

  return 0;
}
