#Assignment_4.s
#FAHD HUMAYUN - 168000889 - fh186

.data 0x10000800
OrinRow_0:	.word	1 2 3 4 5 6
OrinRow_1:	.word	7 8 9 10 11 12
OrinRow_2:	.word	13 14 15 16 17 18
OrinRow_3:	.word	19 20 21 22 23 24
OrinRow_4:	.word	25 26 27 28 29 30
OrinRow_5:	.word	31 32 33 34 35 36

.data 0x10001000
TransRow_0:	.word	0 0 0 0 0 0
TransRow_1:	.word	0 0 0 0 0 0
TransRow_2:	.word	0 0 0 0 0 0
TransRow_3:	.word	0 0 0 0 0 0
TransRow_4:	.word	0 0 0 0 0 0
TransRow_5:	.word	0 0 0 0 0 0

.text 0x00400000
.globl main

#Registers used:
#R4 -> address of OrinRow
#R5 -> address of TransRow
#R6 -> number of elements
#R7 -> number of rows
#R8 -> words from matrix
#R9 -> half of rows

main:
	la		$4, OrinRow_3	#load base address of OrinRow_3
	la		$5, TransRow_0	#load base address of TransRow_0
	li		$6, 6			#number of elements in row
	li		$7, 6			#number of rows
	li		$9, 3			#half of rows
	
loop:
	lw		$8, 20($4)		#load word from OrinRow
	sw		$8, 0($5)		#store word in TransRow
	addi	$6, $6, -1		#decrement the elements counter
	addi	$5, $5, 4		#increment the address of TransRow
	beqz	$6, next_row	#R6 == 0, jump to next_row
	addi	$4, $4, -4		#decrement address of OrinRow
	j		loop			#next iteration

next_row:
	addi	$7, $7, -1		#decrement the row counter
	beqz	$7, exit		#R7 == 0, exit
	li		$6, 6			#reset elements counter
	beq		$7, $9, switch_row	#R7 == 3, switch row
	#need to increment to the first word of the next row and the 
	#difference from current address in R4 to the first word of next row
	#is 44 so add 44 to the current address
	addi	$4, $4, 44		#load base address of next row
	j		loop			#next iteration
	
switch_row:
	la		$4, OrinRow_0	#load address of OrinRow_0
	j		loop			#jump to loop for next iteration
	
exit:
	li		$2, 10
	syscall