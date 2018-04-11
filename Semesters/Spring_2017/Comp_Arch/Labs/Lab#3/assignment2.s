#Leonardo Roman, Assaignment 2
#This program asks user to enter a number and
#check if a sequence of bits 1 1001 0001 is in number entered by user
.data
message1: .asciiz "Enter a number: "
message2: .asciiz "The sequence 1 1001 0001 is in number "
message3: .asciiz "The sequence 1 1001 0001 is not in number "

.text 
.globl main

main:
li $s0,0x00000191				#$s0 = key sequence 1 1001 0001
li $v0,4						#to print a string message
la $a0,message1					#print message 1
syscall

li $v0,5						#to read an int
syscall							#prompt user to enter number
move $s1,$v0					#$s1 = number entered

#-------------------------------Function check--------------------------------------------------
sll $s2,$s1,23					#replace bits from 0-22 with zeros keeping 0-8 the same
srl $s2,$s2,23					#replace bits from 9-31 with zeros leaving 0-8 the same
beq $s2,$s0,Exists				#if modified number $s1 == 0x00000191 (1 1001 0001) go to Exits
li $v0,4						#to print a string message
la $a0,message3					#else print not found in number message
syscall
li $v0,1						#to print an integer
move $a0,$s1					#print number entered by user
syscall		
j end 							#end program 
#-----------------------1 1001 0001 is in number check------------------------------------------
Exists:
li $v0,4						#to print a string message
la $a0,message2					#print message 2
syscall
li $v0,1						#to print an int
move $a0,$s1					#print number entered by user
syscall

end:							#end program
li $v0,10
syscall