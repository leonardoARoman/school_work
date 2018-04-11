#Loenardo Roman lr534
#This program calculates the sume of two numbers n1 and n2.
#The first sum consist of all even numbers in n1 and n2
#The second sum consist of all odd numbers greater then n1 but less than n2.

.data
message1: .asciiz "Please enter two numbers from 0-1,000\n"
message2: .asciiz "Number 1: "
message3: .asciiz "Number 2: "
message4: .asciiz "Number must be from 0-1,000.\n"
message5: .asciiz "The sum of all even numbers in number1 and number2 is: "
message6: .asciiz "\nThe sum of all odd numbers greater than number 1 but less than number 2 is: "

.text
.globl main

main:
addi $s1,$0,1000			#max limit
li $v0,4					#To print message1
la $a0,message1				#Store message address in $a0
syscall						#Print message

Num1:						#get first number form user
li $v0,4					#To print string
la $a0,message2				
syscall						#print message 2
li $v0,5					#Prompt user to enter number 1
syscall						#Read integer
move $s0,$v0				#put number into $s0 
blt $s0,$0,OuttaRange1		#if number is less than 0 go to OuttaRange1
bgt $s0,$s1,OuttaRange1		#if number is greater than 1000 go to OuttaRange2
add $t0,$0,$s0				#$t0 = num1

Num2:						#get number 2 from user
li $v0,4					#To print a string
la $a0,message3				#store message 3 address into $a0
syscall						#Print message3
li $v0,5					#Prompt user to enter number 2
syscall						#Read integer
move $s0,$v0				#Put number in $s0
blt $s0,$0,OuttaRange2		#if number is less than 0 go to OuttaRange1
bgt $s0,$s1,OuttaRange2		#if number is greater than 1000 go to OuttaRange2
add $t1,$0,$s0				#$t1 = num2 

LoopSumEven1:				#Sum all Even numbers in n1
addi $t2,$t2,0				#i=0
bgt $t2,$t0,LoopSumEven2	#if i>n1 All even numbers in n1 are sumed. Go to second sum.
add $s2,$s2,$t2				#sum+=i
addi $t2,$t2,2				#i+=2
j LoopSumEven1				#Keep looping till done.

LoopSumEven2:				#Sum all number even number in n2
addi $t3,$t3,0				#i=0
bgt $t3,$t1,EvenSum			#if i>n2 All even numbers in n1 are sumed. Go to second sum.
add $s3,$s3,$t3				#sum+=i
addi $t3,$t3,2				#i+=2
j LoopSumEven2				#Keep looping till done.

EvenSum:					#total Even_Sum = Sum_n1 + Sum_n2
add $s2,$s2,$s3				#$s2 = ESum_n1 + ESum_n2
li $v0,4					#To print a string
la $a0,message5				#Store message5 address in $a0
syscall						#Print message5
li $v0,1					#To print an int
move $a0,$s2 				#Put total sum in $a0 temporarily to be printed
syscall						#Print total even sum
bne $t0,$t1,LoopSumOdds		#if number 1 is not equal to number 2 go to LoopSumOdds

LoopSumOdds:				#Sum all odd in [n1,n2]
addi $s4,$0,2				#$s4 = 2(divisor)
bgt $t0,$t1,OddSum			#if n1 > n2 go to oddSum to print sum
div $t0,$s4					#n1/2 to find odd numbers
mfhi $t4					#Get remainder
bne $t4,$0,Increment_n1		#If remainder != 0 go to Increment_n1
addi $t0,$t0,1				#n1++
j LoopSumOdds				#Keep iterating to find all odd numbers

Increment_n1:				#Suming all odd numbers
add $s5,$s5,$t0				#sum += n1
addi $t0,$t0,1				#n1++
j LoopSumOdds				#go back to LoopSumOdds

OddSum:						#Display sum
li $v0,4					#To print a string
la $a0,message6				#Store message6 address to be printed
syscall						#Print message6
li $v0,1					#To print an int
move$a0,$s5					#Put total sum in $a0 temporarily to be printed 
syscall						#Print total odd sum
li $v0,10					#To end program
syscall						#End program

OuttaRange1:				#validation 1 [0,1000]
li $v0,4					
la $a0,message4
syscall
j Num1 						#Go back to Num1 to re-enter first number

OuttaRange2:				#Validation 2 [0,1000]
li $v0,4
la $a0,message4
syscall
j Num2 						#Go back to Num2 to re-enter first number
