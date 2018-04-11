#Lab 2 - Assignment 6
#Submitted by FAHD HUMAYUN - 168000889 - fh186

.text
.globl main

main:

start:
	jal		size				# call size
	
	jal		sort				# call sort
	
	jal		print				# call print
	
prompt:
	li		$v0, 4				# print string
	la		$a0, ask			# a0 = address of ask
	syscall
	
	li		$v0, 5				# read int
	syscall
	
	move	$s0, $v0			# s0 = v0
	
	blt		$s0, $0, terminate	# if negative number, terminate
	
	jal		search				# call search
	
	jal		add_to_array		# call add to array
	
	j		start				# jump to start
	
size:
	li		$t1, 0				# t1 = 0 (for size)
	la		$t0, array			# t0 = addres of array
	li		$t9, 0xFFFF			# t9 = 0xFFFF (for last word)
	
	
	size_loop:
	lw		$t2, 0($t0)			# t1 = A[i]
	beq		$t2, $t9, end_size_loop	# if word is 0xFFFF, end loop
	addi	$t1, $t1, 1			# increment t1
	addi	$t0, $t0, 4			# increment t0 to next word
	j		size_loop			# jump to size_loop
	
	end_size_loop:
	addi	$sp, $sp, -4		# adjust stack pointer
	sw		$t1, 0($sp)			# store size on stack
	jr		$ra					# return to caller
	
sort:
	lw		$t9, 0($sp)			# t9 = size of array
	addi	$t9, $t9, -1		# t9--
	li		$t7, 0				# t7 = 0
	
	sort_loop:
	beq		$t7, $t9, end_sort_loop	# if t7 = t9, end loop
	la		$t0, array			# t0 = address of array
	li		$t8, 0				# t8 = 0
	
	nested_sort_loop:
	beq		$t8, $t9, end_nested_sort_loop	# t8 = t9, end nested loop
	lw		$t1, 0($t0)			# t1 = A[i]
	lw		$t2, 4($t0)			# t2 = A[i+1]
	slt		$t3, $t2, $t1		# t3 = 1, if A[i+1] < A[i]
	bne		$t3, $0, swap		# if t3 = 1, jump to swap
	addi	$t8, $t8, 1			# t8++
	addi	$t0, $t0, 4			# t0 += 4
	j		nested_sort_loop	# jump to nested_sort_loop

	swap:
	sw		$t2, 0($t0)			# A[i] = A[i+1]
	sw		$t1, 4($t0)			# A[i+1] = A[i]
	addi	$t0, $t0, 4			# t0 += 4
	addi	$t8, $t8, 1 		# t8++
	j		nested_sort_loop	# jump to nested_sort_loop
	
	end_nested_sort_loop:
	addi	$t7, $t7, 1 		# t7++
	j		sort_loop			# jump to sort_loop
	
	end_sort_loop:
	jr 		$ra					# return to caller

print:
	li		$v0, 4				# print string
	la		$a0, s_array		# load address of s_array to a0
	syscall

	la		$t0, array			# t0 = address of array
	li		$t9, 0xFFFF			# t9 = 0xFFFF
	
	print_loop:
	li		$v0, 1				# print string
	lw		$a0, 0($t0)			# load address of s_array to a0
	beq		$a0, $t9, end_print_loop 
	syscall
	li		$v0, 4				# print string
	la		$a0, comma			# load address of comma to a0
	syscall
	addi	$t0, $t0, 4			# t0 += 4
	j 		print_loop			# jump to print_loop
	
	end_print_loop:
	jr 		$ra					# return to caller

search:
	lw		$t9, 0($sp)			# t9 = size of array
	li		$t7, 0				# t7 = 0 (to get index)
	la		$t0, array			# t0 = address of array
	
	search_loop:
	lw		$t1, 0($t0)			# t1 = A[i]
	beq		$t1, $s0, found		# A[i] = number entered, jump to found
	addi	$t0, $t0, 4			# next word
	addi	$t7, $t7, 1			# next index
	beq		$t7, $t9, not_found	# end of array, jump to not found
	j		search_loop			# jump to search_loop
	
	found:
	li		$v0, 4				# print string
	la 		$a0, n_index		# a0 = address of n_index
	syscall
	li		$v0, 1				# print int
	move	$a0, $t7			# a0 = index
	syscall
	j		prompt				# jump to prompt
	
	not_found:
	jr		$ra

add_to_array:
	la		$t0, array			# t0 = address of array
	li		$t9, 0xFFFF			# t9 = 0xFFFF
	lw		$t8, 0($sp)			# t8 = size of array
	sll		$t8, $t8, 2			# t8 = 4*t8
	add		$t0, $t0, $t8		# t0 = t0 + t8 (end of array)
	sw		$s0, 0($t0)			# add number to array
	sw		$t9, 4($t0)			# end of array
	li		$v0, 4				# print string
	la 		$a0, n_found		# a0 = address of n_found
	syscall
	jr		$ra
	
terminate:	
	li		$v0, 4				# print string
	la 		$a0, end_msg		# a0 = end_msg
	syscall

	li		$v0, 10				# exit
	syscall
	
.data	0x10000000
.align 	2

array:		.word	4, 5, 23, 5, 8, 3, 15, 67, 8, 9, 0xFFFF

.data 0x10010000

s_array:	.asciiz "\nSorted Array: "
ask:		.asciiz	"\n\nEnter a number to search (negative number to end): "
n_found:	.asciiz	"\nNumber not found. Added to array.\n"
n_index:	.asciiz	"\nNumber at index "
comma:		.asciiz	", "
end_msg:	.asciiz	"\nProgram Terminated."