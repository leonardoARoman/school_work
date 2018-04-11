#include <pthread.h>
#include <stdio.h>
#include <semaphore.h>

// Shared variables
sem_t cleaner_mutex, worker_mutex;
int worker,office_cleaner;

void working_window();
void break_time();
void clean_office();

void *employee(void *arg){
  // code here
  while(1){
    // No cleaning at this period of time.
    working_window();// Start working...
    // If all workers in break, cleaning may start.
    break_time(1);// Go to break...
  }
}

void *cleaner(){
  // code here
  while (1) {
    clean_office();
    break_time(0);
  }
}

int main(){

  pthread_t office_worker, office_cleaner;
  sem_init(&cleaner_mutex,0,1);
  sem_init(&worker_mutex,0,1);

  for (int i = 0; i < 4; i++) {
    pthread_create(&office_worker, NULL, employee, NULL);
  }
  for (int i = 0; i < 4; i++) {
    pthread_create(&office_cleaner, NULL, cleaner, NULL);
  }
  return 0;
}

void working_window() {
  sem_wait(&worker_mutex);
  worker++;
  printf("Worker %d is working.\n", worker);
  if (worker == 1)
    sem_wait(&cleaner_mutex);// Block all cleanners.

  sem_post(&worker_mutex);
}

void clean_office() {
  sem_wait(&cleaner_mutex);
  office_cleaner++;
  printf("Cleaner %d is cleaning.\n", office_cleaner);
  if (office_cleaner == 1)
    sem_wait(&worker_mutex);

  sem_post(&cleaner_mutex);
}

void break_time(int i) {
  if (i == 1) {
    // worker on break.
    sem_wait(&worker_mutex); // Start break...
    worker--;
    printf("Worker %d is on break.\n", worker);
    if (worker == 0)
      sem_post(&cleaner_mutex);
    sem_post(&worker_mutex);
  }
  else{
    // Cleaner on break.
    sem_wait(&cleaner_mutex); // Start break...
    office_cleaner--;
    printf("Cleaner %d is on break.\n", office_cleaner);
    if (office_cleaner == 0)
      sem_post(&worker_mutex);
    sem_post(&cleaner_mutex);
  }
}
