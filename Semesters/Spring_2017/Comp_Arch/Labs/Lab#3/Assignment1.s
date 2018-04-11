#Leonardo Roman, Assaignment 1
#This program asks the user to enter 3 numbers A,B and C
#and performs boolean operation F = (A' and B') or (A or C)'
.data 
message1: .asciiz "Enter three numbers(A,B and C)\n"
num1: .asciiz "Enter A value: "
num2: .asciiz "Enter B value: "
num3: .asciiz "Enter C value: "
result: .asciiz "(A' and B') or (A or C)' = "

.text 
.globl main

main:
li $v0,4				#to print a satring
la $a0,message1			#message 1
syscall					#print message 1

li $v0,4				#to print a satring
la $a0,num1				
syscall					
li $v0,5				#to read an int A
syscall
move $s0,$v0			#A = $s0 = num1

li $v0,4				#to print a satring
la $a0,num2				
syscall					
li $v0,5				#to read an int B
syscall
move $s1,$v0			#B = $s1 = num2

li $v0,4				#to print a satring
la $a0,num3			
syscall			 
li $v0,5				#to read an int C
syscall
move $s2,$v0			#C = $s2 = num3

nor $t0,$s0,$s1			#(A' && B') == (A || B)'
nor $t1,$s0,$s2			#(A || C)'
or $t2,$t0,$t1			#(A' && B') || (A || C)'

li $v0,4				#to print a satring
la $a0,result			
syscall					
li $v0,1				#to print an integer
move $a0,$t2			#make $t2 an agument to be printed
syscall 				#print result #t2 (A' && B') || (A || C)')
li $v0,10				#terminate program
syscall