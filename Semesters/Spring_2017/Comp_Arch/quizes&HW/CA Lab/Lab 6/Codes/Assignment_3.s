#Assignment_3 (MIPS)
#Fahd Humayun - 168000889 - fh186

.data 0x10000000
ask:		.asciiz		"\nEnter a positive integer: "
err:		.asciiz		"\nERROR: Not a positive integer.\n"
result:		.asciiz		"\nThe result is "

.text
.globl main


main:

prompt:	
	li		$v0, 4				# print string
	la		$a0, ask			# load address of ask for printing
	syscall
	
	li		$v0, 5				# read int
	syscall
	move	$t0, $v0			# move integer read to t0
	
	blt		$t0, $0, error		# if integer read negative, jump to error
	
	li.s	$f9, 1.0			# f9 = 1.0
	li.s	$f2, 0.5			# f2 = 1/2 = 0.5
	
outer_loop:
	beqz	$t0, end			# if t0 == 0, end outer loop
	move	$t1, $t0			# copy t0 to t1
	li.s	$f3, 1.0			# f3 = 1.0
	
	inner_loop:
		beqz	$t1, end_iLoop	# if t1 == 0, end inner loop
		
		mul.s	$f3, $f3, $f2	# f3 = f3 * f2 (f3 = f3 * 1/2)
		
		addi	$t1, $t1, -1	# decrement inner loop counter
		
		j 		inner_loop
	
	end_iLoop:
		add.s	$f9, $f9, $f3	# f9 = f9 + f3
		addi	$t0, $t0, -1	# decrement outer loop counter
		j 		outer_loop
		
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