#Lab 2 - Assignment 1
#Submitted by FAHD HUMAYUN - 168000889 - fh186

.text
.align 2
.globl main

main:

prompt:
#prompt user for number
	li $v0, 4				#load syscall print_string to $v0
	la $a0, ask_user		#load address of ask_user to $a0
	syscall					#make the syscall
	
#read number from user
	li $v0, 5				#load syscall read_int to $v0
	syscall					#make the syscall
	move $t0, $v0			#move $v0 to $t0
	
#check if the number is non-negative, if not jump to error
	blt $t0, $zero, error	#if $t0 less than 0 jump to error
	
#initialize $t1 to 0 for incrementing from 0 to n
#initialize $t2 to 0 for storing the result
	li $t1, 1				#load immediate 1 into $t1
	li $t2, 0				#load immediate 0 into $t2
	
#beginning of loop to add numbers from 0 to n
loop:
	beq $t0, $0, endloop	#if $t0 equal to 0 jump to endloop
	add $t2, $t2, $t1		#add $t2 with $t1 and store result in $t2
	addi $t1, $t1, 1		#increment $t1
	addi $t0, $t0, -1		#decrement $t0
	j loop
	
#display error that number is not non-negative and prompt user for number
error:
	li $v0, 4				#load syscall print_string to $v0
	la $a0, e				#load address of ask to $a0
	syscall					#make the syscall
	j prompt				#jump to prompt
	
endloop:
#print message for result
	li $v0, 4				#load syscall print_string to $v0
	la $a0, ans				#load address of ans to $a0
	syscall					#make the syscall

#print result	
	li $v0, 1				#load syscall print_int to $v0
	move $a0, $t2			#move $t2 to $a0
	syscall					#make the syscall

	li $v0, 10				#load syscall exit to $v0
	syscall					#make the syscall
	
.data
ask_user: .asciiz "\nPlease enter a non-negative integer: "
e: .asciiz "\nError: The number entered is a not a non-negative.\n"
ans: .asciiz "\nThe result is: "