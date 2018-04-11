#Lab 2 - Assignment 3
#Submitted by FAHD HUMAYUN - 168000889 - fh186

.text
.globl main

main:

# prompt for integer
prompt:	
	li		$v0, 4				# print string
	la		$a0, ask1			# load address of ask1 to a0
	syscall
	
	li		$v0, 5				# read int	
	syscall
	move	$t0, $v0			# t0 = a0
	
	# input validation
	slti	$t1, $t0, 0			# t1 = 1, if t0 < 0
	bne		$t1, $0, error		# t1 != 0, jump to error
	
	slti	$t1, $t0, 1001		# t1 = 1, if t0 < 1000
	beq		$t1, $0, error		# t1 = 0, jump to error

	# initialize registers for counter, division, and sums
	li		$t1, 2				# t1 = 2
	li		$t2, 0				# t2 = 0 (store result of even)	
	li		$t3, 0				# t3 = 0 (store result of odd)

loop:
	beq		$t0, $0, end		# if t0 = 0, jump to END
	rem		$t4, $t0, $t1		# t5 = remainder of t0 / t1
	beq		$t4, $0, even		# if t5 = 0, jump to even
	bne		$t4, $0, odd 		# if t4 != 0, jump to odd
	
even:
	add		$t2, $t2, $t0		# t2 = t2 + t0
	addi	$t0, $t0, -1		# t0 = t0 - 1
	j loop

odd:
	add		$t3, $t3, $t0		# t3 = t3 + t0
	addi	$t0, $t0, -1		# t0 = t0 - 1
	j loop
	
error:
	li		$v0, 4				# print string
	la		$a0, e				# load address of e to a0
	syscall
	
	j 		prompt				# jumpt to prompt

end:
	li		$v0, 4				# print string
	la		$a0, ev				# load address of ev to a0
	syscall
	
	li		$v0, 1				# print int
	move	$a0, $t2			# a0 = t2
	syscall
	
	li		$v0, 4				# print string
	la		$a0, od				# load address of od to a0
	syscall
	
	li		$v0, 1				# print int
	move	$a0, $t3			# a0 = t3
	syscall
	
	li		$v0, 10				# exit
	syscall
	
.data

ask1:	.asciiz		"\nEnter a positive integer less than or equal to 1000: "
e:		.asciiz		"\nInvalid integer, try again"
ev:		.asciiz		"\nThe sum of all even numbers is: "
od:		.asciiz		"\nThe sum of all odd numbers is: "