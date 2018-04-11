#Assignment_2.s
#FAHD HUMAYUN - 168000889 - fh186

.data 0x10000480
Array_A: 	.word 	1 2 3 4 5 6 7
Array_B: 	.word	4 5 6 7 8 9 10

.text 0x00400000
.globl main

main:

	la		$2, Array_A		#$2 = address of Array_A[i] (first word)
	la		$3, Array_B		#$3 = address of Array_B[i] (second word)
	li		$6, 1			#result = 1
	li		$4, 7			#number of elements (counter)
	
loop:
	
	lw		$5, 0($2)		#$5 = Array_A[i]
	lw		$7, 0($3)		#$7 = Array_B[i]
	sub		$5, $5, $7		#$5 = Array_A[i] - Array_B[i]
	mult	$6, $5			#result * (Array_A[i]-Array_B[i])
	mflo	$6				#move the least 32 significant bits to result (i.e. R6)
	addi	$2, $2, 4		#increment address to next word of Array_A
	addi	$3, $3, 4		#increment address to next word of Array_B
	addi	$4, $4, -1		#decrement the counter
	bgt		$4, $0, loop	#loop condition
	
	li		$2, 10
	syscall