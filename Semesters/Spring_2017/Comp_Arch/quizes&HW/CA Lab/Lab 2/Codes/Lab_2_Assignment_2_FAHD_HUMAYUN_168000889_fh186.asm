#Lab 2 - Assignment 2
#Submitted by FAHD HUMAYUN - 168000889 - fh186

.text
.align 2
.globl main

main:

prompt:
#prompt user for number
	li 		$v0, 4					#load syscall print_string to $v0
	la 		$a0, ask_user			#load address of ask_user to $a0
	syscall							#make the syscall
	
#read number from user
	li 		$v0, 5					#load syscall read_int to $v0
	syscall							#make the syscall
	move 	$t0, $v0				#move $v0 to $t0
	move 	$t5, $v0
	
	li		$t1, 100				#initialize $t1 to 100
	
#check if the number is in the range, if not jump to error
	blt 	$t0, $zero, error		#if $t0 less than 0 jump to error
	beq		$t0, $zero, error		#if $t0 equal to 0 jump to error
	bgt		$t0, $t1, error			#if $t0 greater than $t1 jump to error

	li		$t2, 2					#initialize t2 to 2
	move	$t4, $t0				#t4 = t2
	li		$t1, 1
	beq		$t0, $t1, endloop	
	
loop:
	beq 	$t2, $t0, endloop		#if $t2 equals $t0 jump to endloop
	div 	$t0, $t2				#divide $t0 by $t2
	mfhi 	$t3						#move remainder from HI to $t3
	beq 	$t3, $zero, decrement	#if $t3 is equal to 0 jump to decrement
	addi 	$t4, $t0, 0				#t4 = t0
	addi 	$t2, $t2, 1				#increment $t2
	j loop							#jump to loop
	
decrement:
	addi 	$t0, $t0, -1 			#decrement $t0
	li		$t2, 2					#initialize t2 to 2
	j loop
	
#display error that number is not non-negative and prompt user for number
error:
	li 		$v0, 4					#load syscall print_string to $v0
	la 		$a0, e					#load address of ask to $a0
	syscall							#make the syscall
	j 		prompt					#jump to prompt	

	
endloop:
#print message for result
	li 		$v0, 4					#load syscall print_string to $v0
	la 		$a0, ans1				#load address of ans to $a0
	syscall							#make the syscall

#print number
	li 		$v0, 1					#load syscall print_int to $v0
	move 	$a0, $t5				#move $t2 to $a0
	syscall							#make the syscall

#continue printing message
	li 		$v0, 4					#load syscall print_string to $v0
	la 		$a0, ans2				#load address of ans to $a0
	syscall							#make the syscall

#print number
	li 		$v0, 1					#load syscall print_int to $v0
	move 	$a0, $t4				#move $t2 to $a0
	syscall							#make the syscall
	
	li 		$v0, 10					#load syscall exit to $v0
	syscall							#make the syscall	
	
	
	
.data
ask_user: .asciiz "\nPlease enter an integer in the range of (0,100]: "
e: .asciiz "\nError: The number entered is out of range.\n"
ans1: .asciiz "\nThe closest prime number to "
ans2: .asciiz " is: "