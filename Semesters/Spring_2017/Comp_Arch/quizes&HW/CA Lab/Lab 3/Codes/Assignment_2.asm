# Lab3_Assignment2.asm
# Comp Arch Lab 3 - Assignment 2
# Section - 04
# FAHD HUMAYUN - 168000889 - fh186
# Read two integers and calculate their product using only
# shift add, or sub instructions to calculate the multiplication

.text
.globl main

main:

	li		$v0, 4			# print string
	la		$a0, purpose	# load address of purpose
	syscall
	
prompt1:
	li		$v0, 4			# print string
	la		$a0, number1	# load address of number1
	syscall
	
	li		$v0, 5			# read int
	syscall
	move	$t0, $v0		# move $v0 to $t0
	
	blt		$t0, $0, negInt1	# if t0 < 0 jump to negInt1
	li		$s0, 0			# set s0 to 0
	
prompt2:
	li		$v0, 4			# print string
	la		$a0, number2	# load address of number2
	syscall
	
	li		$v0, 5			# read int
	syscall
	move	$t1, $v0		# move $v0 to $t1
	
	li		$t4, 0		 	# initialize product register to 0
	
	li		$t5, 32			# loop counter
	li		$t6, 0			# initialize t6 to 0
	
	blt		$t1, $0, negInt2	# if t1 < 0 jump to negInt2
	li		$s1, 0			# set s1 to 0
	
product:
	andi	$t6, $t1, 1		# mask the LSB of multiplier register
	beq		$t6, $0, shift	# if LSB of multiplier register is 0 shift the bits
	add		$t4, $t4, $t0	# add multiplicand to product and place the result in product register

shift:
	sll		$t0, $t0, 1		# shift multiplicand register left 1 bit
	srl		$t1, $t1, 1		# shift the multiplier register right 1 bit
	addi	$t5, $t5, -1	# decrement counter
	blt		$t5, $0, check 	# end condition of loop
	j		product			# jump to product for next iteration

check:
	beq		$s0, $s1, print	# if s0 = s1 jump to print
	beqz	$s1, print		# if s1 = 0 jump to print
	
	not		$t4, $t4		# flip the bits of result
	addi	$t4, $t4, 1		# add 1 to result
	
print:
	li		$v0, 4			# print string
	la		$a0, result		# load address of result
	syscall
	
	li		$v0, 1			# print int
	move	$a0, $t4		# a0 = t4
	syscall
	
end:
	li		$v0, 4			# print string
	la		$a0, terminate	# load address of terminate
	syscall
	
	li		$v0, 10			# exit
	syscall

negInt1:
	li		$s0, 1			# set s0 to 1
	j		prompt2			# jump to prompt2

negInt2:
	li		$s1, 1			# set s1 to 1
	not		$t1, $t1		# flip the bits of t1 (second integer)
	addi	$t1, $t1, 1		# add 1 to t1
	beq		$s0, $s1, flip	# if s0 = s1, jump to flip
	j		product			# jump to product
	
flip:
	not		$t0, $t0		# flip the bits of t0
	addi	$t0, $t0, 1		# add 1 to t0
	j		product			# jump to product
	
.data
purpose:	.asciiz		"\nEnter two numbers and this program will calculate the product\nusing shift, add, or sub instructions\n\n"
number1:	.asciiz		"\n\tNumber 1: "
number2:	.asciiz		"\n\tNumber 2: "
result:		.asciiz		"\n\n\tThe result is "
terminate:	.asciiz		"\n\nProgram End."