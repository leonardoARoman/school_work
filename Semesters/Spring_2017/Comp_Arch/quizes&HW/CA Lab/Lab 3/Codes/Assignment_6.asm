# Computer Architecture Lab - 3
# Assignment - 6
# FAHD HUMAYUN - 168000889 - fh186

.text
.globl main

main:

	la		$t0, array			# load address of array into t0
	li		$s0, 10				# s0 = 10 for counter
	

prompt:
	li		$v0, 4				# print string
	la		$a0, ask			# load address of ask
	syscall
	
	li		$v0, 6				# read float
	syscall
	
	mov.s	$f2, $f0			# f2 = f0
	la		$t0, array			# t0 = address of array

	li		$t9, 0				# f9 = 0, used as a flag
	li.s	$f5, 0.0			# f5 = 0.0, used for sum
	
func:
	l.s		$f3, 0($t0)			# load element from array
	c.le.s	$f3, $f2			# if f3 <= f2, CondBit = 1
	bc1f	sum					# if CondBit = 0, jump to sum
	addi	$t0, $t0, 4			# go to address of next element in array
	addi	$s0, $s0, -1		# decrement counter
	beqz	$s0, result			# end of loop
	j		func				# jump to func
	
sum:
	addi	$t9, $t9, 1			# set the flag to 1
	add.s	$f5, $f5, $f3		# sum = sum + A[i] (where A[i] is greater than number entered)
	addi	$t0, $t0, 4			# increment address to next element in array
	addi	$s0, $s0, -1		# decrement counter
	beqz	$s0, result			# end of loop
	j		func				# jump to func

result:
	beqz	$t9, noResult		# if t9 = 0, jump to noRes (flag = 0)
	
	li		$v0, 4				# print string
	la		$a0, res			# load address of res
	syscall
	
	li		$v0, 2				# print float
	mov.s	$f12, $f5			# f12 = f5
	syscall
	
	li		$v0, 4				# print string
	la		$a0, terminate		# load address of terminate
	syscall
	
	li		$v0, 10				# exit
	syscall
	
noResult:
	li		$v0, 4				# print string
	la		$a0, noRes			# load address of noRes
	syscall
	
	li		$v0, 10				# exit
	syscall
	
error:
	li		$v0, 4				# print string
	la		$a0, err			# load address of err
	syscall
	j		prompt

.data 0x10000000

# an array of floating points with -1.0 at the end to determine the end of array
array:		.float		1.35 2.67 3.566 4.56 5.98 9.43 12.34 15.54 23.87 34.33
ask:		.asciiz		"\n\nEnter a real number: "
res:		.asciiz		"\nThe result is: "
noRes:		.asciiz		"\nThe number entered is greater than the numbers in array. Program Terminated!\n"
terminate:	.asciiz		"\n\nProgram Terminated!\n"