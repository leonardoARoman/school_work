#Leonardo Roman LR534
#This program asks the user to enter a number(n) and 
#finds the closest prime number to number (n)
.data 
message:  .asciiz "\nEnter a number from 0-100 or 00 to end program: "
message1: .asciiz "Number must be from 0-100.\n"
message2: .asciiz "The closes prime number to number "
message3: .asciiz " is: "

.text
.globl main

main:
li $s5,00
li $s6,1
addi $s0,$0,100
li $v0,4					#to display a message
la $a0,message				#to display message 1
syscall						#execute message 1
li $v0,5					#to read an integer
syscall						#execute and ask for number
move $s1,$v0				#move entered number by user into $t0
blt $s1,$0,OuttaRange		#if num<0 end
bgt $s1,$s0,OuttaRange 		#if num>100 go back to main
beq $s1,$s5,end 			#if number = 00 end program
beq $s1,$s6,PrimeOne 	 	#if number = 00 end program
add $t0,$0,$s1				#$t0 = num
addi $t1,$0,2				#j = 2

Loop:						 
beq $t0,$t1,PrimeNumber		#if j == num then j is the prime number go to PrimeNUmber
div $t0,$t1					#num/j			
mfhi $s2 					#get the rimainder from hi and store it into $s2				
beq $s2,$0,NumMinusMinus	#if $s2!=0, num is not a prime number go to NumMinusMinus
addi $t1,$t1,1				#j++;
j Loop						#go back to Loop

NumMinusMinus:				#NumMinusMinus gets called when num/j!=0
addi $t0,$t0,-1				#num = num - 1;
addi $t1,$0,2				#reset j = 2 
j Loop						#go back to primeFunction


OuttaRange:					#OuttaRange gets called if num<0 or num>100
li $v0,4
la $a0,message1				#Prints message "Number must be from 0-100."
syscall
j main						#go back to main to re-enter number

PrimeNumber:				#PrimeNumber gets called when prime num gets found
li $v0,4
la $a0,message2				#Print message "The closes prime number to number "
syscall
li $v0,1					
move $a0,$s1
syscall						#Pint number entered by user
li $v0,4
la $a0,message3				#Print message " is: "
syscall
li $v0,1
move $a0,$t0				#Print prime number
syscall
j main

PrimeOne:
li $v0,4
la $a0,message2				#Print message "The closes prime number to number "
syscall
li $v0,1					
move $a0,$s1
syscall						#Pint number entered by user
li $v0,4
la $a0,message3				#Print message " is: "
syscall
li $v0,1
move $a0,$s1				#Print prime number
syscall
j main

end:
li $v0,4
la $a0,message2				#Print message "The closes prime number to number "
syscall
li $v0,1					
move $a0,$s1
syscall						#Pint number entered by user
li $v0,4
la $a0,message3				#Print message " is: "
syscall
li $v0,1
move $a0,$0					#Print prime number
syscall
li $v0,10
syscall						#End program



