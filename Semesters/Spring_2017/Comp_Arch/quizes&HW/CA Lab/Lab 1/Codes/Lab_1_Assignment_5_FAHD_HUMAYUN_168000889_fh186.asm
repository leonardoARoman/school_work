#Lab 1 - Assignment 5
#Submitted by FAHD HUMAYUN - 168000889 - fh186

.text

#beginning of main function
main:

#display msg to enter first pair
	li $v0, 4			#load syscall print_string into $v0
	la $a0, msg1		#load address of data msg1 into $a0
	syscall				#make the syscall

#prompt user for x1
	li $v0, 4			#load syscall print_string into $v0
	la $a0, x1			#load address of data x1 into $a0
	syscall				#make the syscall

#get x1 from user, put into $t0
	li $v0, 5			#load syscall read_int into $v0
	syscall				#make the syscall

	move $t0, $v0		#move $v0 to $t0

#prompt user for y1	
	li $v0, 4			#load syscall print_string into $v0
	la $a0, y1			#load address of data y1 into $a0
	syscall				#make the syscall

#get y1 from user, put into $t1
	li $v0, 5			#load syscall read_int into $v0
	syscall				#make the syscall

	move $t1, $v0		#move $v0 to $t1

#display msg to enter second pair
	li $v0, 4			#load syscall print_string into $v0
	la $a0, msg2		#load address of data msg1 into $a0
	syscall				#make the syscall

#prompt user for x2	
	li $v0, 4			#load syscall print_string into $v0
	la $a0, x2			#load address of data x2 into $a0
	syscall				#make the syscall

#get x2 from user, put into $t2
	li $v0, 5			#load syscall read_int into $v0
	syscall				#make the syscall

	move $t2, $v0		#move $v0 to $t2

#prompt user for y2		
	li $v0, 4			#load syscall print_string into $v0
	la $a0, y2			#load address of data y2 into $a0
	syscall				#make the syscall

#get y2 from user, put into $t3
	li $v0, 5			#load syscall read_int into $v0
	syscall				#make the syscall

	move $t3, $v0		#move $v0 to $t3

#calculation for manhattan distance
	sub $t4, $t0, $t2	#substract $t2 from $t0, store result in $t4
	sub $t5, $t1, $t3	#substract $t3 from $t1, store result in $t5
	add $t6, $t4, $t5	#add $t4 and $t5, store result in $t6

#print message for the result	
	li $v0, 4			#load syscall print_string into $v0
	la $a0, msg3		#load address of data msg3 into $a0
	syscall				#make the syscall

#print the result 
	li $v0, 1			#load syscall print_int into $v0
	move $a0, $t6		#move $t6 to $a0
	syscall				#make the syscall

#terminate the program	
	li $v0, 10			#load syscall exit into $v0
	syscall				#make the syscall

#declare and initialize strings for printing the messages
.data
msg1: .asciiz "\nEnter first pair:"
x1: .asciiz "\nx1 = "
y1: .asciiz "\ny1 = "
msg2: .asciiz "\nEnter second pair:"
x2: .asciiz "\nx2 = "
y2: .asciiz "\ny2 = "
msg3: .asciiz "\nThe Manhattan Distance is "