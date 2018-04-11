#Lab 1 - Assignment 4
#Submitted by FAHD HUMAYUN - 168000889 - fh186

.text
main:

#prompt user for first number, load message from memory to $a0 for printing
	li $v0, 4			#load syscall print_string into $v0
	la $a0, Message1	#load address of data Message1 into $a0
	syscall				#make the syscall

#get first number from user, put into $t0
	li $v0, 5			#load syscall read_int into $v0
	syscall				#make the syscall
	move $t0, $v0		#move the number read into $t0
	
#prompt user for second number
	li $v0, 4			#load syscall print_string into $v0
	la $a0, Message2	#load address of data Message2 into $a0
	syscall				#make the syscall
	
#get second number from user, put into $t1
	li $v0, 5			#load syscall read_int into $v0
	syscall				#make the syscall
	move $t1, $v0		#move the number read into $t1

#prompt user to input a message	
	li $v0, 4			#load syscall print_string into $v0
	la $a0, Message3	#load address of data Message3 into $a0
	syscall				#make the syscall

#get message from user, put into memory location
	li $v0, 8			#load syscall read_string into $v0
	la $a0, UserMessage	#load address of data UserMessage into $a0
	li $a1, 100			#load immediate $a1 with 100
	move $t3, $a0		#move $a0 to $t3
	syscall				#make the syscall

	sub $t2, $t0, $t1	#subtract $t1 from $t0, store result in $t2

#print message
	li $v0, 4			#load syscall print_string into $v0
	la $a0, Message4	#load address of data Message4 into $a0
	syscall				#make the syscall

#print the message that user input
	la $a0, UserMessage	#load address of data UserMessage into $a0
	move $a0, $t3		#move $t3 to $a0
	li $v0, 4			#load syscall print_string into $v0
	syscall				#make the syscall

#print the message for result	
	li $v0, 4			#load syscall print_string into $v0
	la $a0, Message5	#load address of data Message5 into $a0
	syscall				#make the syscall

#print the result of difference stored in $t2
	li $v0, 1			#load syscall print_int into $v0
	move $a0, $t2		#move $t2 to $a0
	syscall				#make the syscall

#terminate the program	
	li $v0, 10			#load syscall exit into $v0
	syscall				#make the syscall
	
#declare and initialize strings for printing the messages on the screen and 
#also an empty string with 100 bytes of space which can store 100 characters
.data
Message1: .asciiz "\nEnter first number: "
Message2: .asciiz "\nEnter second number: "	
Message3: .asciiz "\nType a message: "
Message4: .asciiz "\nThe message typed is "
Message5: .asciiz "\nThe first number minus the second number is "
UserMessage: .space 100