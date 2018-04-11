#Leonardo Roman 168000447 lr534
#Type and execute the code in the following program, record the value of each registers

.text
.globl main

main:
li $v0, 5           #li code 5 to read an interger
syscall             #syscall and promt the user to enter an integer
move $t0, $v0       #Transfer the stored value in $v0 into $t0($t0 = first integer)

li $v0, 5           #li code 5 to read an interger
syscall             #syscall and promt the user to enter an integer
move $t1, $v0       #Transfer the stored value in $v0 into $t0($t0 = second integer)

sub $t2, $t0, $t1   #$t2 = $t0 - $t1

move $a0, $t2       #Tranfer result value stored in $t2 into $a0 to be printed.
li $v0,1            #Loads code 1 to print an integer.
syscall             #syscall executes and prints value from $a0
li $v0,10           #Loads code 10 to terminate program.
syscall             #Terminates the program.
