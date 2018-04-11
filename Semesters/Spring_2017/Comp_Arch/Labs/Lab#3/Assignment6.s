#leonardo Roman lr534
.data
arr:		.float		12.5 2.34 3.59 4.76 10.67 3.54 
message:	.asciiz		"Please enter a real number: "
result:		.asciiz		"The result is: "
message2:	.asciiz		"\nThe number entered is greater than the numbers in array. Program Terminated!\n"

.text
.globl main

main:
la $t0, arr				#array
li $s0, 6				#Counter
	
prompt:
li $v0, 4				#To read a string message
la $a0, message		
syscall
li $v0, 6				#To read float
syscall
mov.s $f2, $f0			#$f2 = number
la $t0, arr				#$t0 = address of array
li $t9, 0				#$t9 = false
li.s $f5, 0.0			#$f5 = 0.0, 
	
Array:
l.s $f3, 0($t0)			#$f3 = arr[i]
c.le.s $f3, $f2			#if arr[i] <= f2, CondBit = 1
bc1f sum				# if CondBit = 0, jump to sum
addi $t0, $t0, 4		#i += 4
addi $s0, $s0, -1		#counter -= 1
beqz $s0, Result		#end of loop
j Array				 	#jump to Array
	
sum:
addi $t9, $t9, 1		#$t9 = true
mul.s $f4,$f3,$f3		#arr[i]^2
add.s $f5, $f5, $f4		#sum = sum + arr[i]^2 
addi $t0, $t0, 4		#i += 4
addi $s0, $s0, -1		#counter -= 1
beqz $s0, Result		#end of loop
j Array					#jump to Array

Result:
beqz $t9, notFound		# if t9 = false, jump to notFound
li $v0, 4				# print string
la $a0, result			# load address of res
syscall
li $v0, 2				# print float
mov.s $f12, $f5			# f12 = f5
syscall
li $v0, 10				# exit
syscall
	
notFound:
li $v0, 4				#print string
la $a0, message2		#load address of notFound
syscall
	
li $v0, 10				# exit
syscall
	
error:
li $v0, 4				# print string
la $a0, err				# load address of error
syscall
j prompt

