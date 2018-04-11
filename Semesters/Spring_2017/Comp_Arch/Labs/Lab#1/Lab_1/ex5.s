#Leonardo Roman 168000447 lr534
#This program calculate the number entered by user
#raised to the 3rd power.
.data 0x10000000
	ask: .asciiz "\nEnter a number between 0 and 50000\n"
	ans: .asciiz "Answer: "

.text 0x00400000
.globl main
main:
	li $v0, 4			#loads code 4 into $v0 to print a string
	la $a0, ask			#loads ask address into $a0 to be printed
	syscall				#executes code 4 and prints $a0's content
	li $v0, 5			#code 5 to read an integer(user input)
	syscall
	move $t0, $v0		#transfer the data in $v0 to $t0($t0 = $v0 = m)
	addi $t1, $0, 0		#$t1 = i = 0 initialized i = 0;
	addi $t2, $0, 1		#$t2 = ans = 1, base case n = 0 is 1
	li $t3, 3			#$t3 = 3

loop:
	bge $t1, $t3, End	#branch if $t1 >= $t3 jump to End function
	mult $t2, $t0		#multipy $t2 * $t0
	mflo $t2			#store value to $t2 (n = n * m)
	addi $t1, $t1, 1	#i++
	j loop				#go back to loop


End:
	li $v0, 4           #loads code 4 into $v0 to print a string
	la $a0, ans         #loads ans address into $a0 to be printed(prints Answer)
	syscall
    move $a0, $t2       #store final value of $t2 into $a0 (m^3)
    li $v0, 1           #Printing $a0
	syscall
	li $v0, 10
	syscall



