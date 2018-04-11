#include <pthread.h>
#include <stdio.h>

long long  *fib;
int i;

void *runn(void *arg) {
     // Let the first byte of fib equals zero and exit.
    if (i == 0) {
        fib[i] = 0;
        pthread_exit(0);
    }
    // Let the second byte of fib equals zero and exit.
    if (i == 1) {
        fib[i] = 1;
        pthread_exit(0);
    }
    // Compute sequence store in respective byte and exit.
    else {
        fib[i] = fib[i - 1] + fib[i - 2];
        pthread_exit(0);
    }
}
int main() {
    int n = 100;
    // Allocate and reserve n bytes for fib and thread pointers.
    fib = (long long *)malloc(n *sizeof(long long));
    pthread_t *threads = (pthread_t *) malloc(n * sizeof(pthread_t));
    // Create and join threads one by one as the fibonacci sequence in computed at each thread
    for (i = 0; i < n; i++) {
      	pthread_create(&threads[i], NULL, runn, NULL);
      	pthread_join(threads[i], NULL);
    }
    printf("The Fibonacci sequence of %d is: ",n);
   for (int k = 0; k < n; k++) {
     	printf("%lld,", fib[k]);
   }
   printf("\n");
   return 0;
}
