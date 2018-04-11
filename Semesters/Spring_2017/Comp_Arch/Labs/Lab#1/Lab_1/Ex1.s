#Leonardo Roman 168000447 lr534
#Exercise 1
#Program loops 17 times as $10 decrements 1 and terminates
#when $10 = 1 since this will make condition $10 = $11 true.
#Every iteration $9 increments givin final result $9 = ($10 + $9) = 171.
.data                       #All variables will be declared under .data
.align 2
Number1: .word 18           #Assigning value 18 to variable Number1

.text
.globl main                 #Declaration of main procedure

main:                       #main procedure
lw $10, Number1($0)         #Load word loads Number1 content into register 10
ori $11, $0, 1              #or immidiate
ori $9, $0, 1

loop:                       #loop block
bge $11, $10, exit          #branch (if ($11 >= $10) exit)
add $9, $10, $9             #$9 = ($10 + $9)
addi $10, $10, -1           #Decrement value in register 10 by 1
j loop                      #go back to loop if not finished

exit:                       #Exit procedure
li $2, 10                   #Register 2 is load intruction 10 to terminate the program
syscall                     #system call, execute code 10 and terminates the program
