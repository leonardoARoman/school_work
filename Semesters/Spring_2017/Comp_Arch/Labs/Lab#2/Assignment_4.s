#Leonardo Roman lr534
#Lab#2 assignment 4
#This program asks the user to enter number of lines to print a diamond 
#Diamond length should be equal the number to the number of lines entered by user
.data
meassage:	.asciiz "Enter number or rows: "
space:		.asciiz " "
starick:	.asciiz " *"
nextLine:	.asciiz "\n"
.text
.globl main

main:
li $v0,4					#To print message
la $a0,meassage				#Store message address
syscall						#Print message
li $v0,5					#Prompt the user to enter number of rows for diamond
syscall
move $t1,$v0				#store number of rows in $t1
blt $t1,$0,end 				#if number entered is negative terminate the program
li $s2,0					#i = 0
li $s0,2					#divisor $s0 = 2
div $t1,$s0					#n/2
mflo $s1					#store quotient in $s1 (if 7/3 then $s1 = 2)-> j = $s1
mfhi $s3					#$s3 = remainder
beq $s3,$0,EvenLoop			#if remainder equals zero make even diamond
addi $t4,$s1,1				#$t4 is the upper limet of diamond quotient(n/2)+1
add $t3,$t4,$0				#$t3 is a copy of $t4 and equal quotient(n/2)+1

#-------------------Upper boddy of diamond------------------------------------------------
DimondUpperBody:			#for(i=0;i<n;i++)
li $s1,0					#reset j = 0
addi $s2,$s2,1				#i++
li $v0,4
la $a0,nextLine				#print("\n")
syscall
li $t0,0					#j=0
ble $s2,$t4,Jloop2			#i<n go to jloop to print spaces

#----------------------------------------------------------------------------------------
j DimondLowerBody			#Upper boddy of diamond is done printing go to LowerDimondBody
#----------------------------------------------------------------------------------------

EvenLoop:
addi $t4,$s1,0				#$t4 is the upper limit of diamond quotient(n/2)+1
add $t3,$t4,$0				#$t3 is a copy of $t4 and equal quotient(n/2)+1
j DimondUpperBody

Jloop1:						#if(j=n/2;j<=i;j++){print("*")}
addi $t2,$s2,-1				#$t2 = i - 1 = 0
sub $t3,$t4,$s2				#n-i; i = $s2 = 2
bgt $s1,$t2,DimondUpperBody	#if j>i go back to Iloop
li $v0,4					#else print "*"
la $a0,starick				#print("*")
syscall
addi $s1,$s1,1				#j++
j Jloop1

Jloop2:						#for(j=0;j<n-i;j++){print(" ")}
bge $t0,$t3,Jloop1			#if j >= n-i go back to Iloop
li $v0,4					#else print spaces " "
la $a0,space				#print(" ")
syscall
addi $t0,$t0,1				#j++
j Jloop2
#-----------------------------------------------------------------------------------------

#-------------------Lower boddy of diamond------------------------------------------------
DimondLowerBody:
mflo $s1					#$s1 = 2(limit)
li $s2,0					#$s2 = i = 0
bne $s3,$0,OddLoop			#if remainder does not equal 0 make odd diamond
addi $t4,$s1,0				#$t4 = 2 is the lower limit of diamond quotient(n/2)

Outer_loop:
li $t0,0					#j = 0
li $t2,0					#k = 0
addi $s2,$s2,1				#i++
ble $s2,$s1,Inner_Loop1		#if i <= n print space

Inner_Loop1:
bge $t0,$s2,Inner_Loop2		#if j => i go to Inner_Loop2 to print("*")
li $v0, 4					#else print("-")
la $a0,space				#print(" ")
syscall
addi $t0,$t0,1				#j++
j Inner_Loop1

Inner_Loop2:
bge $t2,$t4,NewLine			#if k >= $s1 go to NewLine to print("\n")
li $v0,4					#else print("*")
la $a0,starick
syscall
addi $t2,$t2,1				#k++
j Inner_Loop2

NewLine:
li $v0,4
la $a0,nextLine				#print("\n")
syscall
addi $t4,$t4,-1				#n--
beq $t4,$0,main				#if n = 0 finish program
j Outer_loop
 
OddLoop:
li $s2,2					#$s3 = i = 2
li $t2,0					#$t2 = k = 0
addi $t4,$s1,0				#$t4 = 2 is the lower limit of dimond quotient(n/2)
j Inner_Loop1

end:
li $v0,10
syscall