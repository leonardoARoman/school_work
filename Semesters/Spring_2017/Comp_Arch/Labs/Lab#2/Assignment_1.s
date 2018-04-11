#Leonardo Roman
#This program reads a non-negative integer and calculates
#The sum of all values less than or equal to the entered integer
.data
message1: .asciiz "Enter a non-negative number: "
message2: .asciiz "The sum of all numbers less than or equal to "
message3: .asciiz " is "
message4: .asciiz "Please enter a positive number.\n"
li $s0, 0				#i = 0

.text
.globl main

main:
li $v0, 4				#to print a message
la $a0, message1		#Printing message 1 
syscall

li $v0, 5				#to read an integer
syscall
move $t0, $v0			#storing the entered integer in $t0

bgt $t0,$0,l1			#if number entered is not negative go to l1
li $v0, 4				#to print a message
la $a0, message4		#get the address of message 4 to print message
syscall
j main					#go back to main if any negative number was enter

l1:						#lable 1 function
blt $s0,$t0,SUM 		#if i <= num go to SUM
j END 					#else terminate	

SUM:					#Sum function
addi $s0,$s0,1			#i++
add $t1,$t1, $s0		#sum += i
j l1					#go back to l1

END: 					#End function
li $v0, 4				#to print a message
la $a0, message2		#get address of message 2 to print message
syscall
move $a0, $t0			#assigned entered number as an argument to be printed
li $v0, 1				#to print an integer($a0) entered number
syscall
li $v0, 4				#to print a message
la $a0, message3		#get address of message 3 to print message
syscall
move $a0, $t1			#store value un $t1 into $a0 as argument to be printed
li $v0, 1				#printing value in $a0(final sum)
syscall
li $v0, 10				#finish program
syscall