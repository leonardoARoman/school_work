#Lab 2 - Assignment 5
#Submitted by FAHD HUMAYUN - 168000889 - fh186

.text
.globl main

main:

start:
	jal		prompt1			# jump and link to prompt1
	
	jal		initialize		# jump and link to initialize

	jal		get_length		# jump and link to get_length
	
	jal		check_length	# jump and link to check_length

	jal		check_pass		# jump and link to check_pass

second:	
	jal		prompt2			# jump and link to prompt2
	
	jal		compare_pass	# jump and link to compare_pass
	
	j		end				# jump to end
	
prompt1:
	li		$v0, 4			# print string
	la		$a0, ask		# load adress of ask to a0
	syscall
	
	li		$v0, 8			# read string
	la		$a0, pass1		# load address of pass1 to a0
	syscall
	
	addi	$sp, $sp, -4	# adjust stack pointer (one)
	sw		$a0, 0($sp)		# store a0 on stack
	
	jr		$ra
	
	
initialize:
	li		$s0, 3			# s0 = 3 (chances)
	li		$t0, 0			# counter
	li		$t1, 0			# load byte to
	li		$t2, 0xa		# null character
	addi	$sp, $sp, -12	# adjust stack pointer (four)
	sw		$t0, 0($sp)		# store t0 on stack
	sw		$t1, 4($sp)		# store t1 on stack
	sw		$t2, 8($sp)		# store t2 on stack
	jr		$ra
	
	
get_length:
	lw		$t0, 0($sp)		# load from stack to t0
	lw		$t1, 4($sp)		# load from stack to t1
	lw		$t2, 8($sp)		# load from stack to t2
	lw		$t3, 12($sp)	# load from stack to t3
	

	
length:	
	lb		$t1, 0($t3)		# load byte from t3 to t1
	beq		$t1, $t2, r_gL	# if t1 == t2, jump to r_gL
	addi	$t0, $t0, 1		# t0 = t0 + 1
	addi	$t3, $t3, 1		# t3 = t3 + 1
	j		length

	
r_gL:
	addi	$sp, $sp, -4	# adjust stack pointer (five)
	sw		$t0, 0($sp)		# store t0 on stack
	jr		$ra				# jump to ra
	
	
check_length:
	lw		$t0, 0($sp)		# load from stack to t0
	slti	$t4, $t0, 8		# t4 = 1, t0 < 8
	bne		$t4, $0, error1	# t4 != 0, jump to error1
	slti	$t4, $t0, 13	# t4 = 1, t0 < 13 
	beq		$t4, $0, error1	# t4 = 0, error1
	jr		$ra				# jump to ra
	
error1:
	li		$v0, 4			# print string
	la		$a0, e1			# load address of e1 to a0
	syscall
	
	addi	$sp, $sp, 20	# adjust stack pointer
	j		start			# jump to start

check_pass:
	lw		$t0, 16($sp)	# load from stack to t0
	li		$t9, 0x41		# t9 = A
	li		$t8, 0x5a		# t8 = Z
	li		$t7, 0x61		# t7 = a
	li		$t6, 0x7a		# t6 = z
	
in_check_pass:
	lb		$t1, 0($t0)		# load byte from t0 to t1
	beq		$t1, $t2, r_cP	# t1 = null character jump to r_cP
	slt 	$t4, $t1, $t9	# t4 = 1, t1 < A
	slt		$t5, $t6, $t1	# t5 = 1, t1 > z
	or		$t4, $t4, $t5	# t4 = t4 || t5
	bnez	$t4, error2		# t4 != 0, jump to error2
	slt		$t4, $t8, $t1	# t4 = 1, t1 > Z
	slt		$t5, $t1, $t7	# t4 = 1, t1 < a
	and		$t4, $t4, $t5	# t4 = t4 && t5	
	bnez	$t4, error2		# t4 != 0, jump to error2
	addi	$t0, $t0, 1		# t0 = t0 + 1
	
	j		in_check_pass
	
r_cP:
	jr		$ra

error2:
	li		$v0, 4			# print string
	la		$a0, e2			# load address of e2 to a0
	syscall
	
	addi	$sp, $sp, 20	# adjust stack pointer
	j		start			# jump to start
	
prompt2:
	li		$v0, 4			# print string
	la		$a0, ask2		# load address of ask2 to a0
	syscall
	
	li		$v0, 8			# read string
	la		$a0, pass2		# load address of pass1 to a0
	syscall
	
	addi	$sp, $sp, -4	# adjust stack pointer (six)
	sw		$a0, 0($sp)		# store a0 on stack
	
	jr		$ra

compare_pass:
	lw		$t0, 20($sp)	# load from stack to t0
	lw		$t1, 0($sp)		# load from stack to t1
	li		$t9, 0xa		# t9 = a, null character
	
loop:
	lb		$t2, 0($t0)		# load byte from t0 to t2
	lb		$t3, 0($t1)		# load byte from t1 to t3

	bne		$t2, $t3, nomatch	# if t2 != t3, jump to nomatch
	beq		$t2, $t9, end_loop	# if t0 = t9, jump to end_loop
	
	addi	$t0, $t0, 1		# t0 = t0 + 1
	addi	$t1, $t1, 1		# t1 = t1 + 1
	j 		loop
	
nomatch:
	addi	$s0, $s0, -1	# s0 = s0 - 1

	beq		$s0, $0, end2	# s0 = 0, jump to end2
	
	li		$v0, 4			# print string
	la		$a0, incorrect	# load address of incorrect to a0
	syscall
	
	li		$v0, 1			# print string
	move	$a0, $s0		# a0 = s0
	syscall
	
	li		$v0, 4			# print string
	la		$a0, incorrect1	# load address of incorrect1 to a0
	syscall
	
	lw		$t1, 0($sp)		# load from stack to t1
	li		$t5, 0			# t5 = 1
clear_pass:
	sb		$0, 0($t1)		# clear byte
	addi	$t1, $t1, 1		# t1 = t1 + 1
	addi	$t5, $t5, 1		# t5 = t5 + 10
	slti	$t4, $t5, 16	# t4 = 1, t5 < 16
	beq		$t4, $0, end_clear	# t4 = 0, jump to end_clear
	j		clear_pass		# jump to clear_pass

end_clear:
	addi	$sp, $sp, 4		# adjust stack pointer
	j		second			# jump to second
	
end_loop:
	jr		$ra
	
	
end:
	li		$v0, 4			# print string
	la		$a0, result		# load address of result to a0
	syscall
	
	li		$v0, 10			# exit
	syscall
	
end2:
	li		$v0, 4			# print string
	la		$a0, result2	# load address of result2 to a0
	syscall
	
	li		$v0, 10			# exit
	syscall
	
.data		0x10000000
.align		2
pass1:		.space		16
pass2:		.space		16
ask:		.asciiz		"\nSet a password: "
ask2:		.asciiz		"\nRe-enter the password: "
e1:			.asciiz		"\nFailed. Enter a password with the size of 8 to 12\n"
e2:			.asciiz		"\nFailed. Enter a password with only upper and lower case letters\n"
incorrect:	.asciiz		"\nIncorrect, you have "
incorrect1:	.asciiz		" chance(s)"
result:		.asciiz		"\nPassword is setup.\n\nProgram terminated."
result2:	.asciiz		"\nPassword is not setup. \n\nProgram terminated."