# Computer Architecture Lab - 3
# Assignment - 5
# FAHD HUMAYUN - 168000889 - fh186

.text
.globl main


main:
	li		$v0, 4				# print string
	la		$a0, purpose		# load address of purpose for printing
	syscall

	li.s	$f1, 0.0			# f1 = 0.0
	
prompt:	

promptHeight:
	li		$v0, 4				# print string
	la		$a0, askHeight		# load address of askHeight
	syscall
	
	li		$v0, 6				# read float
	syscall
	
	c.lt.s	$f0, $f1			# if f0 < f1, FCCR = 1
	bc1t	error				# if FCCR = 0, jump to error
	
	mov.s	$f2, $f0			# f2 = f0 (height)
	
promptRadius:
	li		$v0, 4				# print string
	la		$a0, askRadius		# load address of askRadius
	syscall
	
	li		$v0, 6				# read float
	syscall
	
	c.lt.s	$f0, $f1			# if f0 < f1, FCCR = 1
	bc1t	error				# if FCCR = 1, jumpt to error
	
	mov.s	$f3, $f0			# f3 = f0 (radius)
	
volume:
	li.s	$f5, 22.0			# f5 = 22.0
	li.s	$f6, 7.0			# f6 = 7.0
	div.s	$f5, $f5, $f6		# f5 = 22/7 (pi)
	li.s	$f1, 3.0			# f1 = 3.0
	mul.s	$f3, $f3, $f3		# f3 = radius*radius
	mul.s	$f4, $f3, $f2		# f4 = radius^2 * height
	mul.s	$f4, $f4, $f5		# f4 = pi * radius^2 * height
	div.s	$f4, $f4, $f1		# f4 = (pi * radius^2 * height)/3
	
end:
	li		$v0, 4				# print string
	la		$a0, result			# load address of result
	syscall
	
	li		$v0, 2				# print float
	mov.s	$f12, $f4			# f12 = f4
	syscall
	
	li		$v0, 10				# exit
	syscall

error:
	li		$v0, 4				# print string
	la		$a0, err			# load address of err
	syscall
	
	j		prompt
	
.data 0x10000000

purpose:	.asciiz		"\nThis program will calculate the volume of a circular cone.\n"
askHeight:	.asciiz		"\nEnter the height: "
askRadius:	.asciiz		"\nEnter the radius: "
err:		.asciiz		"\nERROR: Enter positive float numbers.\n"
result:		.asciiz		"\nThe volume is "