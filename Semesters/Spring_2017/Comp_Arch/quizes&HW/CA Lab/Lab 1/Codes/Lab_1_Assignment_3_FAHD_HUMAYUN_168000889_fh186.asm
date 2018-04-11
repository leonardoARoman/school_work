#Lab 1 - Assignment 3
#Submitted by FAHD HUMAYUN - 168000889 - fh186

.text 0x00400000
.align 2
.globl main

main:
	lw $a0, size			#load the size of array into $a0, using lw
	li $a1, 0				#initialize index i to 0
	li $t2, 4				#t2 contains constant 4, initialize t2
	ori $t3, $0, 1			#initialize result to one

loop:
	mul $t1, $a1, $t2		#t1 gets i*4
	lw $a3, Array($t1)		#a3 = Array[i]
	mul $t3, $t3, $a3		#result = result * Array[i]
	sw $t3, Array2($t1)		#store result in the Array2 in location i
	addi $a1, $a1, 1		#i = i + 1
	blt $a0, $a1, END		#go to END if finished
	j loop					

END:

	li $v0, 10				#load 10 to v0 for exit
	syscall

.data 0x10000000
.align 2

#data to be used
Array: .word 2 5 6 7 12 16
size: .word 6
Array2: .space 24

