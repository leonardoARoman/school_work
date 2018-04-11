# Computer Architecture Lab - 3
# Assignment - 4
# FAHD HUMAYUN - 168000889 - fh186

.text
.globl main


main:
	li		$v0, 4				# print string
	la		$a0, purpose		# load address of purpose for printing
	syscall

prompt:	
	li		$v0, 4				# print string
	la		$a0, ask			# load address of ask for printing
	syscall
	
	li		$v0, 6				# read float
	syscall
	
	# float read is in f0
	
	lwc1	$f1, ZeroFloat		# f1 = 0.0
	
	c.lt.s	$f0, $f1			# if f0 < f1, Register FCCR = 1 (special coprocessor register)
	bc1t	error				# if FCCR = 1, jump to error
	
	lwc1	$f2, epsilon		# f2 = 0.00001
	lwc1	$f3, initial		# f3 = 1.0 (xi)
	li.s	$f4, 2.0			# f4 = 2.0
	li.s	$f5, 3.0			# f5 = 3.0
	
cubeRoot:
	mul.s	$f6, $f4, $f3		# f6 = 2*xi
	mul.s	$f7, $f3, $f3		# f7 = xi^2
	div.s	$f8, $f0, $f7		# f8 = N/xi^2
	add.s	$f9, $f6, $f8		# f9 = 2*xi + N/xi^2
	div.s	$f9, $f9, $f5		# f9 = (2*xi + N/xi^2)/3
	sub.s	$f10, $f9, $f3		# f10 = xi+1 - xi
	abs.s	$f10, $f10			# f10 = |xi+1 - xi|
	c.lt.s	$f10, $f2			# if |xi+1-xi| < 0.00001, FCCR = 1
	bc1t	end					# if FCCR = 1, jump to end
	mov.s	$f3, $f9			# f3 = f9 or xi = xi+1
	j		cubeRoot
	
end:
	li		$v0, 4				# print string
	la		$a0, result			# load address of result
	syscall
	
	li		$v0, 2				# print float
	mov.s	$f12, $f9			# f12 = f9
	syscall
	
	li		$v0, 10
	syscall
		
error:
	li		$v0, 4				# print string
	la		$a0, err			# load address of err
	syscall
	
	j prompt
	
.data	0x10000000
.align 2

purpose:	.asciiz		"\nThis program will calculate the cube root of a positive float number"
ask:		.asciiz		"\nEnter a positive float number: "
err:		.asciiz		"\nERROR: Not a positive float number.\n"
result:		.asciiz		"\nThe cube root is "
ZeroFloat:	.float		0.0
epsilon:	.float		0.00001
initial:	.float		1.0
