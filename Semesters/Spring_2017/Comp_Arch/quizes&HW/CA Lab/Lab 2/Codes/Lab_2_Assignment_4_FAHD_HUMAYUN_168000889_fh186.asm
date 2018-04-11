#Lab 2 - Assignment 4
#Submitted by FAHD HUMAYUN - 168000889 - fh186

.text
.globl main

main:
	
# prompt user for two strings
prompt1:
	li		$v0, 4					# print string
	la		$a0, ask1				# load address of ask1
	syscall
	
	li		$v0, 8					# read string
	la		$a0, str1				# load address of str1
	syscall
	
	# store the address of str1 into $t0
	move	$t0, $a0				# move a0 to t0
	move	$t5, $a0				# move a0 to t5 (copy of str1)
	
prompt2:
	li		$v0, 4					# print string
	la		$a0, ask2				# load address of ask2
	syscall
	
	li		$v0, 8					# read string
	la		$a0, str2				# load address of str2
	syscall
	
	# store the address of str2 into $t1
	move	$t1, $a0				# move a0 to t1
	
	li		$t9, 0x0a				# t9 = 0x0a or null character
	la		$t4, mismatch			# t4 = address of mismatch string
	li		$t8, 0					# t8 = 0, used for counter
	
# compare both strings
compare:
	
	# i.e. loading each character from strings
	lb		$t2, 0($t0)				# load byte from t0 (str1) to t2
	lb		$t3, 0($t1)				# load byte from t1 (str2) to t3
	
	# check for end of string 
	beq		$t2, $t9, string1_end	# if t2 = t9, jump to string1_end
	beq		$t3, $t9, string2_end	# if t3 = t9, jump to string2_end

	beq		$t2, $t3, match			# if t2 = t3, jump to match
	bne		$t2, $t3, nomatch		# if t2 != t3, jump to nomatch
	
result:
	# if the characters matched then it means there was no jump to nomatch
	# which means that the counter t8 should be 0, so the result is all
	# characters match
	beq		$t8, $0, end			# if t8 = 0, jump to end
	
	# if the strings did not match then display message and the unmatched
	# characters and prompt the user for another string
	li		$v0, 4					# print string
	la		$a0, nomatch_res		# load address of nomatch_res to a0
	syscall
	
	li 		$v0, 4					# print string
	la		$a0, mismatch			# load address of mismatch to a0
	syscall
	
	la		$t6, mismatch			# t6 = address of mismatch
	move	$t0, $t5				# move t5 to t0 (restore t0)
	li		$t7, 100				# t7 = 100
	
# clearing the mismatch string
loop:
	sb		$0, 0($t6)				# store 0 into byte
	addi	$t7, $t7, -1			# t7 = t7 - 1
	addi	$t6, $t6, 1				# t6 = t6 + 1
	beqz	$t7, prompt2			# t7 == 0, jumpt to prompt2
	j		loop					# jump to loop
	
	
# string1 ends store the bytes of string2 only
string1_end:
	sb		$t3, 0($t4)				# store byte t3 into address t4 + 0
	beq		$t3, $t9, result		# if t3 = t9, jump to result  
	addi	$t1, $t1, 1				# t1 = t1 + 1
	addi	$t4, $t4, 1				# t4 = t4 + 1
	lb		$t3, 0($t1)				# load byte from t1 to t3
	addi	$t8, $t8, 1				# increment counter
	j		string1_end

	
# string2 ends store the bytes of string1 only
string2_end:
	sb		$t2, 0($t4)				# store byte t2 into address t4 + 0
	beq		$t2, $t9, result		# if t2 = t9, jump to result
	addi	$t0, $t0, 1				# t0 = t0 + 1
	addi	$t4, $t4, 1				# t4 = t4 + 1
	lb		$t2, 0($t0)				# load byte from t0 to t2
	addi	$t8, $t8, 1				# increment counter
	j		string2_end

	
# if characters match, jump to next byte/character
match:
	addi	$t0, $t0, 1				# t0 = t0 + 1
	addi	$t1, $t1, 1				# t1 = t1 + 1
	j		compare

# if the characters do not match, store character from second string
# and jump to next byte/character
nomatch:
	sb		$t3, 0($t4)				# store byte t3 into address t4 + 0
	addi	$t1, $t1, 1				# jump to next byte of second string
	addi	$t0, $t0, 1				# jump to next byte of first string
	addi	$t4, $t4, 1				# jump to next byte of mismatch string
	addi	$t8, $t8, 1				# increment counter
	j 		compare					# jump to compare
	
# the end of program
end:
	li		$v0, 4					# print string
	la		$a0, match_res			# load address of match_res to a0
	syscall

	li		$v0, 10
	syscall
	
.data	0x10000000
.align 	2
str1:		.space 		100
str2:		.space 		100
ask1:		.asciiz		"\nEnter first string (max 100 characters): "
ask2:		.asciiz		"\nEnter second string (max 100 characters): "
match_res:	.asciiz 	"\nThe strings match. Terminating program\n"
nomatch_res:.asciiz		"\nThe strings do not match. The mismatched characters are: "
mismatch:	.space		100