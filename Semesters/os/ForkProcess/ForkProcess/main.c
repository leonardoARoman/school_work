//
//  main.c
//  ForkProcess
//
//  Created by Leonardo Roman on 1/31/18.
//  Copyright © 2018 Leonardo Roman. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/wait.h>


// This program uses pipes for IPC between parent and child process.

int some_func(int);

int main(){
    
    //int (*func_pointer)(int);
    //func_pointer = some_func;
    
    //printf("num^2 = %d\n", func_pointer(10));
    
    // Two pipes for bicommunication: parent <-> child
    int pipe_1[2];              // pipe 1.
    int pipe_2[2];              // pipe 2.
    
    char str[] = "rutgers.edu";
    char in_str[100];
    pid_t pid;
    
    // Error filtering conditions:
    if (pipe(pipe_1) == -1) {
        fprintf(stderr, "Error");
        return 1;
    }
    
    if (pipe(pipe_2) == -1) {
        fprintf(stderr, "Error");
        return 1;
    }
    
    /*
    FILE *fptr;
    char filename[] = "File.strings";
    char ch;
    
    fptr = fopen(filename, "r");
    if (fptr == NULL)
    {
        printf("Cannot open file \n");
        exit(0);
    }
    ch = fgetc(fptr);
    while (ch != EOF)
    {
        printf ("%c", ch);
        ch = fgetc(fptr);
    }
    fclose(fptr);
    */
    int p_id = fork();
    int p;
    if(p_id > 0){
        wait(NULL);
        p = 1;
        printf("Parent:\nChild is finished processing...\n");
        //wait(&p_id); // wait for child to finish.
    }else{
        p = 2;
        printf("Child:\nParent is wating...\n");
        exit(0); // if child does not exit then parent keeps waiting.
    }
    printf("Init process...p = %d\n",p);
    
    // Prompt user to enter a string (instruction belongs to main)
   // printf("Enter a string: ");
    scanf("%s",in_str);
    
    // Branch out of main:
    pid = fork();
    
    if (pid < 0) {
        fprintf(stderr, "Error");
        return 1;
    }
    
    // Paretn process:
    else if (pid > 0){
        
        // parent -> child communication.
        // Parent will close the read end of pipe 1 and write in the write end of the same pipe then wait for child.
        char contact_str[100];                      // Buffer array
        close(pipe_1[0]);                           // Closes pipe 1 read end.
        write(pipe_1[1], in_str, strlen(in_str)+1); // Writes str entered by user in pipe 1 write end. Also passes the size of str
        
        wait(NULL);                                 // Halts for child to finish.
        
        
        // Resume right after child process finish:
        // child -> parent communication.
        // Parent will close writing end of pipe 2 and read any string in reading end of the same.
        close(pipe_2[1]);                           // Close write end of pipe 2.
        read(pipe_2[0], contact_str, 100);          // Read final string in read end of pipe 2 sent by child process.
        
        // Print final job.
        printf("\nParent process...\n");
        printf("concatenated string: %s\n", contact_str);
        close(pipe_2[0]);                           // Close read end of pipe 2
    }
    
    // Child process:
    else{
        printf("Child is processing concatenation...\n");
        // parent -> child communication
        // Child will read string passed by parent by closing the writing end of pipe 1
        // Concatenates the string and writes it in the writtting end of pipe 2.
        
        close(pipe_1[1]);                           // Closes write end of pipe 1.
        char contact_str[100];                      // Buffer array for final output.
        
        read(pipe_1[0], contact_str, 100);          // Reads any string sent by parent thru pipe 1.
        
        unsigned long k = strlen(contact_str);      // strlen() counts the number of char a string has.
        
        printf("number of characters in input string is %lu\n",k);
        
        contact_str[k++] = '@';
        
        int i;
        for (i = 0; i < strlen(str); i++) {
            contact_str[k++] = str[i];
            //printf("iteration %d, %s\n",i,contact_str);
        }
        
        contact_str[k] = '\0';
        
        // Close both pipe read end.
        close(pipe_1[0]);
        close(pipe_2[0]);
        
        
        // Write into pipe 2 to be sent to parent process then close the pipe.
        write(pipe_2[1], contact_str, strlen(contact_str)+1);
        close(pipe_2[1]);
        
        exit(0);
    }
}

int some_func(int number){
    return number*number;
}

// process x! and y! and let z = x! + y!

/*
 int main(int argc, const char * argv[]) {
 
 pid_t pid, pid1;
 key_t key = ftok("shmfile", 65);
 int shmid = shmget(key,1024,0666|IPC_CREAT);
 char *str = (char*) shmat(shmid,(void*)0,0);
 
 pid = fork();
 
 // In parent process pid != 0 hence executes else statement.
 // In child process pid == 0 if statement gets executed.
 // Gets executed last after it got branched out.
 if(pid == 0){
 
 // Child process here
 
 pid1 = getpid();// gets generated pid
 printf("pid returned from child to child: child_pid = %d\n", pid);
 printf("child pid1 gotten from getpid(): child_pid = %d\n", pid1);
 
 printf("WRITTING DATA...");
 gets(str);
 printf("child process wrote data in memory: %s\n", str);
 shmdt(str);
 return 0;
 
 }
 
 else{
 
 // Parent process
 
 wait(&pid);
 
 pid1 = getpid();
 printf("pid returned from child to parent: parent_pid = %d\n", pid);
 printf("parent pid1 gotten from getpid(): parent_pid = %d\n", pid1);
 
 printf("Parent process reading data from memory: %s\n", str);
 shmdt(str);
 shmctl(shmid, IPC_RMID, NULL);
 }
 
 return 0;
 }
 
 
 int factorial(int n){
 for(int i = n-1; i > 0; i--){
 n = n*i;
 }
 return n;
 }
 */





/*
 // Adress assignation
 num1 = &x;
 num2 = &y;
 
 // get the values of pointers pinting to.
 int i = *num1;
 int j = *num2;
 int z = i + j;
 
 num3 = &z;
 
 printf("num -> %d\n", *num1);
 printf("num2 -> %d\n", *num2);
 printf("num3 -> %d\n", *num3);
 */


//file:///var/folders/2h/zlvf9d9j4wvfm3r7zxcnl4580000gn/T/com.apple.iChat/Messages/Transfers/8ab1df8ba5fc7bb9351cf24a67fae884-sticker.gif


