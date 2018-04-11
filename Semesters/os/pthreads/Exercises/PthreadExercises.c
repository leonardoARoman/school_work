#include <pthread.h>
#include <stdio.h>
/**
  Write a program that creates 10 threads. Have each thread to execute
  the same function and pass a unique number. Method should print Hello
  world (thread n) where n is the tread number entered.
**/
/*
void *runner(void *arg){
  //char *buffer = (char *)malloc(64);
  for (int i = 0; i < 5; i++) {
    int n = (int)arg;
    printf("Hello world (thread %d)\n", n);
  }

  return NULL;
}

int main(int argc, char const *argv[]) {
  pthread_t pid[10];
  for (int i = 0; i < 10; i++) {
    pthread_create(&pid[i],NULL,runner,(void*)i);
  }
  for (int i = 0; i < 10; i++) {
    pthread_join(pid[i],NULL);
  }
  return 0;
}
*/

int *primes;
unsigned long i;
unsigned long next_byte = 2;

void *runn(void *arg) {
    int number = (int)arg;
    if (i == 0) {
        primes[i] = 1;
        pthread_exit(0);
    }

    if (i == 1) {
        primes[i] = 2;
        pthread_exit(0);
    }

    else {
      for (int j = 2; j <= i; j++) {
        if (number % j != 0) {
          primes[next_byte] = number;
          next_byte += 1;
          pthread_exit(0);
        }
        else if (i % j == 0) {
          break;
        }
      }
    }
}

int main() {
    int n = 20;
    primes = (int *)malloc(n *sizeof(int));
    pthread_t *threads = (pthread_t *) malloc(n *sizeof(pthread_t));

    for (i = 0; i < n; i++) {
          pthread_create(&threads[i], NULL, runn, (void*)i);
          pthread_join(threads[i], NULL);
    }

    printf("The primes in number %d are: ",n);
    for (int j = 0; j < next_byte; j++) {
        printf("%d,", primes[j]);
    }
    printf("\n");
    return 0;
}
