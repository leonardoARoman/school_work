#Assignment_3.s
#FAHD HUMAYUN - 168000889 - fh186

.data 0x10000860
matrix_A:	.word	1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25

.data 0x1000A000
matrix_B:	.word	26 27 28 29 30

.data 0x1000A100
			.word	31 32 33 34 35

.data 0x1000A200
			.word	36 37 38 39 40

.data 0x1000A300
			.word	41 42 43 44 45

.data 0x1000A400
			.word	46 47 48 49 50

.data 0x1000B000
matrix_C:	.word	0

.text 0x00400000
.globl main

#Registers Used:
#R4 -> base address of matrix A
#R5 -> base address of matrix B
#R6 -> base address of matrix C
#R7 -> number of elements (used to control the iterations of loop)
#R8 -> number of words in each row of matrix B (used for a condition to increment the address of matrix B)
#R9 -> used to store the result and store it in matrix B
#R10 -> words from matrix A loaded
#R11 -> words from matrix B loaded

main:
	la		$4, matrix_A	#base address of matrix A in R4
	la		$5, matrix_B	#base address of matrix B in R5
	la		$6, matrix_C	#base address of matrix C in R6
	li		$7, 25			#number of elements
	li		$8, 5			#number of words in each row of matrix B
	li		$9, 0			#result to be stored in matrix C

loop:
	lw		$10, 0($4)		#load word from matrix A
	lw		$11, 0($5)		#load word from matrix B
	mult	$10, $11		#matrix_A[i]*matrix_B[i]
	mflo	$9				#move the result to R9
	sw		$9, 0($6)		#store the result in matrix C
	addi	$4, $4, 4		#increment address to next word of matrix_A
	addi	$6, $6, 4		#increment address to next word of matrix_C
	addi	$7, $7, -1		#decrement counter
	addi	$8, $8, -1		#decrement the counter for checking row of matrix_B
	beqz	$8, next_row	#if $8 == 0, jump to next_row
	addi	$5, $5, 4		#increment address to next word in same row of matrix_B
	bnez	$7, loop		#if loop counter not 0, jump to loop
	
next_row:
	beqz	$7, exit		#if loop counter 0 then exit
	#the difference from the end of one row to the beginning of the next
	#in hexadecimal is 0xF0 or in decimal 240 so therefore need to increment the address by 240
	addi	$5, $5, 240		#increment address of matrix_B by 240 for next row
	li		$8, 5			#reset the number of words counter
	j		loop
	
exit:
	li		$2, 10
	syscall