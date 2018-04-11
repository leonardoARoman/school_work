#Lab 1 - Assignment 2
#Submitted by FAHD HUMAYUN - 168000889 - fh186

.globl main					#by making main function global it will be 
							#visible to code stored in other files
							
main:						#the beginning of main function
	lw $10, Number1($0)		#load word to register 10 ($t2) i.e. 18+0=18
	ori $11, $0, 1			#or immediate register 11 ($t3) i.e. $t3 = 0+1 = 1 (initialize $t3 to 1)
	ori $9, $0, 1			#initialize $t1 to 1
	
#compute the factorial of Number in register 10 ($10 or $t2)
factloop:					#beginning of the loop/iterations to compute the factorial
	bge $11, $10, factexit	#jump to factexit if $11 is greater than or equal to $10
	mul $9, $10, $9			#multiply $10 with $9 and store it in $9
	sub $10, $10, 1			#subtract the value in $10 by 1
	j factloop				#jump to factloop
	
factexit:					#when the above condition is satisfied it will jump to this line of the code

#the computation of the factorial is over

#the result in $9 is half of what the original result is, because, the factorial of 18 results in 
#6402373705728000 (in decimal) which converted to hex results in 16BEECCA730000. So, the result is
#clearly more than 32 bits which the register can not store, so the register stores the last/lower 32 bits
#which the $9 represents that is CA730000, while the higher 32 bits 16BEECCA can not be observed in the 
#result by $9

	li $2, 10				#load immediate $2 or $v0 with 10
	syscall					#run the operation depending upon the code (value) loaded in $2
	
	.data 0x10000000		#used for the data to be contained in the code
	.align 2				#means next item should be on a word boundary
	
Number1: .word 18			#Number1 is a word initialized to 18