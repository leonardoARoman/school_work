#Leonardo Roman 168000447 lr534
#This program substract two arrays and stores the result back
#into array2[i]
.data
.align 2
Array:	.word 2 5 6 7 12 16     #array of integers
Array2: .word 5 8 9 10 15 19
Size: .word 6                   #Variable size = 6

.text
.align 2
.globl main

main:
lw $a0, Size                    #arr.size() = 6
li $a1, 0                       #i = 0
li $t2, 4                       #$t2 = 4
li $t3, 0                       #$t3 = result = 0
la $a2, Array                   #$a2 = Array base address
la $t4, Array2                  #$t4 = Arra2 base address

loop:
mul $t1, $a1, $t2               #$t1 = i*4 this actually does not make sence
lw $a3, 0($a2)                  #$s3 = Array[i]
lw $t0, 0($t4)                  #$t0 = array2[i]
sub $t3, $t0, $a3               #result = array2[i] - array[i]
sw $t3, 0($t4)                  #store result_i in array2[i] respectivally
add $a2, $t2, $a2               #increment array base address by 4
add $t4, $t2, $t4               #increment array2 base address by 4
addi $a1, $a1, 1                #i++
blt $a0, $a1, END               #if Size < i jump to END to terminate.
j loop                          #if size > i go back to loop

END:                            #END function
li $v0, 10                      #load code 10 into $v0 to terminate
syscall                         #syscall and terminate


