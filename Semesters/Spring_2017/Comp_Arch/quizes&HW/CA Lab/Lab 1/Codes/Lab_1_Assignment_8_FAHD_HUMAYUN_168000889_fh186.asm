#Lab 1 - Assignment 8
#Submitted by FAHD HUMAYUN - 168000889 - fh186

.data 0x10000000
		ask: .asciiz "\nEnter a number between 0 and 50000: "
		ans1: .asciiz "\nThe sum of number entered: "
		ans2: .asciiz "\nThe sum of all the odd numbers in the number entered: "
		
.text 0x00400000
.globl main
main:

#prompt user for number
		li $v0, 4			#load syscall print_string into $v0
		la $a0, ask			#load address of data ask into $a0
		syscall				#make the syscall

#read number from user		
		li $v0, 5			#load syscall print_int into $v0
		syscall				#make the syscall

#store the number entered by user in $t0 and $t6		
		move $t0, $v0
		move $t6, $v0
		
#initializing registers to 0 for increment and storing results		
		addi $t1, $0, 0		#initialize $t1 to 0
		addi $t2, $0, 0		#initialize $t2 to 0
		addi $t4, $0, 0		#initialize $t4 to 0
		addi $t5, $0, 0		#initialize $t5 to 0
		
		li $t3, 2			#initialize $t3 to 2
		
#beginning of loop		
loop:
	beq $t0, 0, SUM			#if $t0 equal 0 jump to SUM
		div $t0, $t3		#divide $t0 by $t3
		mfhi $t1			#move remainder from HI to $t1
		bne $t1, $0, ADD	#if remainder not equal to zero jump to ADD
		sub $t0, $t0, 1		#decrement $t0
		j loop				#jump to loop

#calculate the sum of odd number from 0 to the number entered		
ADD:
		add $t2, $t2, $t0	#add $t2 with $t0 and store result in $t2
		sub $t0, $t0, 1		#decrement $t0
		j loop				#jump to loop
	
#calculate the sum of numbers from 0 to the number entered	
SUM:
	blt $t6, 0, END			#if $t6 = 0, jump to END
		add $t5, $t5, $t4	#add $t5 with $t4 and store result in $t5
		add $t4, $t4, 1		#increment $t4
		sub $t6, $t6, 1		#decrement $t6
		j SUM				#jump to SUM
	
#print the results and terminate the program		
END:
		li $v0, 4			#load syscall print_string into $v0
		la $a0, ans1		#load address of data ans1 into $a0
		syscall				#make the syscall
		
		move $a0, $t5		#move $t5 to $a0
		
		li $v0, 1			#load syscall print_int into $v0
		syscall				#make the syscall
		
		li $v0, 4			#load syscall print_string into $v0
		la $a0, ans2		#load address of data ans2 into $a0
		syscall				#make the syscall
		
		move $a0, $t2		#move $t2 to $a0
		
		li $v0, 1			#load syscall print_int into $v0
		syscall				#make the syscall
		
		li $v0, 10			#load syscall exit into $v0
		syscall				#make the syscall