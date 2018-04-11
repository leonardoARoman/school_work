#Leonardo Roman lr534
#This program first sorts an array of numbers and then asks the user
#to enter a number and if the number is in the array it prints out 
#the position where number. If number is not found, the number will be addaed.
.data
array:			.word	4, 5, 23, 5, 8, 3, 15, 67, 8, 9, 0xFF

sortedArray:	.asciiz "Sorted Array: "
key:			.asciiz	"\nEnter a number to search or negative integer to end: "
message1:		.asciiz	"\nNumber not found. Added to array.\n"
message2:		.asciiz	"\nNumber at index "
space:			.asciiz	", "
message3:		.asciiz	"\nProgram Terminated."

.text
.globl main

main:
jal	ArraySize				#get array size
jal	SortArray				#sort array 
jal	PrintArray				#print array
	
prompt:
li $v0,4					#print message
la $a0,key 					#load key address to be printed
syscall
li $v0,5					#Prompt the user to enter key
syscall
move $s0,$v0				#$s0 = $v0 = key
blt	$s0,$0,End				#if $s0 = negative number, terminate
jal	SearchKey				#call SearchKey 
jal	Add						#call add and add if key was not found
j main						#go back to main 
	
ArraySize:
li $t1,0					#t1 = 0 (for size)
la $t0,array				#t0 = base address
li $t9,0xFF 				#t9 = 0xFF last word
	
Loop:
lw $t2, 0($t0)				#t1 = A[i]
beq $t2,$t9,EndLoop 		#if word is 0xFF, end loop
addi $t1,$t1,1				#i++
addi $t0,$t0,4				#increment t0 to next word
j Loop	 					#jump to Loop
	
EndLoop:
addi $sp,$sp,-4				#adjust stack pointer and save one word space
sw $t1,0($sp)				#store size on stack
jr $ra						#return to caller
	
SortArray:
lw $t9,0($sp)				#$t9 = size of array
addi $t9,$t9,-1				#size--
li $t7, 0					#$t7 = 0
	
OutterLoop2:
beq	$t7,$t9,EndLoop2		#if $t7 = $t9, end loop
la $t0,array				#$t0 = address of array
li $t8,0					#$t8 = 0
	
InnerLoop:
beq	$t8,$t9,EndInnerLoop	#if $t8 = $t9, go end loop
lw $t1,0($t0)				#$t1 = A[i]
lw $t2,4($t0)				#$t2 = A[i+1]
slt	$t3,$t2,$t1				#$t3 = 1, if A[i+1] < A[i]
bne	$t3,$0,Swap				#if $t3 = 1, jump to swap
addi $t8,$t8,1				#$t8++
addi $t0,$t0,4				#$t0 += 4
j InnerLoop					#jump to InnerLoop

Swap:
sw $t2,0($t0)				#A[i] = A[i+1]
sw $t1,4($t0)				#A[i+1] = A[i]
addi $t0,$t0,4				#t0 += 4
addi $t8,$t8,1 				#t8++
j InnerLoop					#jump to InnerLoop
	
EndInnerLoop:
addi $t7,$t7,1 				#$t7++
j OutterLoop2				#jump to OutterLoop2
	
EndLoop2:
jr $ra						#return to caller

PrintArray:
li $v0,4					#To print string
la $a0,sortedArray			#load address to a0
syscall
la $t0,array				#$t0 = address of array
li $t9,0xFF					#$t9 = 0xFF
	
Loop2:
li $v0,1					#To print string
lw $a0,0($t0)				#load address to a0
beq	$a0,$t9,EndLoop3 
syscall
li $v0,4					#to print string
la $a0,space				#load address of space to a0
syscall
addi $t0,$t0,4				#$t0 += 4
j Loop2						#jump to Loop2
	
EndLoop3:
jr $ra						#return to caller

SearchKey:
lw $t9,0($sp)				#$t9 = size of array
li $t7,0					#$t7 = 0 (to get index)
la $t0,array				#$t0 = address of array
	
LinearSearch:
lw $t1,0($t0)				#$t1 = A[i]
beq	$t1,$s0,KeyFound		#A[i] = key, jump to found
addi $t0,$t0,4				#next word
addi $t7,$t7,1				#next index
beq	$t7,$t9,KeyNotFound		#end of array, jump to not found
j LinearSearch				#jump to LinearSearch
		
KeyFound:
li $v0, 4					#print string
la $a0, message2			#$a0 = address of message2
syscall
li $v0,1					#print int
move $a0,$t7				#$a0 = index
syscall
j prompt					#jump to prompt
	
KeyNotFound:
jr $ra

Add:
la $t0,array				#$t0 = address of array
li $t9,0xFF					#$t9 = 0xFF
lw $t8,0($sp)				#$t8 = size of array
sll $t8,$t8,2				#$t8 = 4*$t8
add $t0,$t0,$t8				#$t0 = $t0 + $t8 (end of array)
sw $s0,0($t0)				#add number to array
sw $t9,4($t0)				#end of array
li $v0,4					#print string
la $a0,message1				#$a0 = address of KeyNotFound
syscall
jr $ra
	
End:	
li $v0,4					#print string
la $a0,message3				#$a0 = message3
syscall
li $v0,10					#exit
syscall