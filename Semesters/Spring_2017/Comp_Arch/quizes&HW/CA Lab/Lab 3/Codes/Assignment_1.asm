# Lab3_Assignment1.asm
# Lab 3 - Assignment 1
# FAHD HUMAYUN - 168000889 - fh186
# Read three numbers and calculate the logic function 
# F = (A OR C)' AND (B AND C)'

.text
.globl main

main:

	li		$v0, 4			# print string
	la		$a0, purpose	# load address of purpose
	syscall
	
prompt:
	li		$v0, 4			# print string
	la		$a0, number1	# load address of number1
	syscall
	
	li		$v0, 5			# read int
	syscall
	move	$t0, $v0		# move $v0 to $t0
	
	li		$v0, 4			# print string
	la		$a0, number2	# load address of number2
	syscall
	
	li		$v0, 5			# read int
	syscall
	move	$t1, $v0		# move $v0 to $t1
	
	li		$v0, 4			# print string
	la		$a0, number1	# load address of number3
	syscall
	
	li		$v0, 5			# read int
	syscall
	move	$t2, $v0		# move $v0 to $t2
	
function:
	or		$t3, $t0, $t2	#  A OR C
	nor		$t3, $t3, $zero	# (A OR C)'
	and		$t4, $t1, $t2	#  B AND C
	nor		$t4, $t4, $zero	# (B AND C)'
	and		$t5, $t3, $t4	# (A OR C)' AND (B AND C)'
	
print:
	li		$v0, 4			# print string
	la		$a0, result		# load address of result
	syscall
	
	li		$v0, 1			# print int
	move	$a0, $t5		# move $t5 to $a0
	syscall
	
end:
	li		$v0, 4			# print string
	la		$a0, terminate	# load address of terminate
	syscall

	li		$v0, 10			# exit
	syscall

.data
.align 2
purpose:	.asciiz		"\nEnter three numbers and this program will calculate the logic function \nF = (A OR C)' AND (B AND C)'\nWhere A,B,and C will be the three numbers\n\n"
number1:	.asciiz		"\n\tNumber 1: "
number2:	.asciiz		"\n\tNumber 2: "
number3:	.asciiz		"\n\tNumber 3: "
result:		.asciiz		"\n\n\tThe result is "
terminate:	.asciiz		"\n\nProgram End."