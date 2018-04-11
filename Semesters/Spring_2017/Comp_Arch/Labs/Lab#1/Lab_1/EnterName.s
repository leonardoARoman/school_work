#Leonardo Roman 168000447 lr534
#Assigment 5 sum of difference of pairs
.text
.globl main
main:
    li $s0, -1                  #$s0 = -1
    li $v0, 5                   #Get number 1 from user
    syscall
    move $t0,$v0
    li $v0, 5                   #Get number 2 from user
    syscall
    move $t1,$v0
    li $v0, 5                   #Get number 3 from user
    syscall
    move $t2,$v0
    li $v0, 5                   #Get number 4 from user
    syscall
    move $t3,$v0
    blt $t0,$t1,n_compute1      #if $t0 < $t1
    j fun1                      #if not true jump to fun1
    n_compute1:
    sub $t4,$t0,$t1
    mul $t4,$t4, $s0
compute2:
    blt $t0,$t2,n_compute2      #if $t0 < $t2
    j fun2                      #if not true jump to fun2
    n_compute2:
    sub $t5,$t0,$t2
    mul $t5,$t5,$s0
compute3:
    blt $t0,$t3,n_compute3      #if $t0 < $t3
    j fun3                      #if not true jump to fun3
    n_compute3:
    sub $t6,$t0,$t3
    mul $t6,$t6,$s0
compute4:
    blt $t1,$t2,n_compute4      #if $t1 < $t2
    j fun4                      #if not true jump to fun4
    n_compute4:
    sub $t7,$t1,$t2
    mul $t7,$t7,$s0
compute5:
    blt $t1,$t3,n_compute5      #if $t1 < $t3
    j fun5                      #if not true jump to fun5
    n_compute5:
    sub $t8,$t1,$t3
    mul $t8,$t8,$s0
compute6:
    blt $t2,$t3,n_compute6      #if $t2 < $t3
    j fun6                      #if not true jump to fun6
    n_compute6:
    sub $t9,$t2,$t3
    mul $t9,$t9,$s0
sum:                            #Summing difference of pairs
    add $t4,$t4,$t5
    add $t4,$t4,$t6
    add $t4,$t4,$t7
    add $t4,$t4,$t8
    add $t4,$t4,$t9
    li $v0,1                    #Printing sum of the difference
    move $a0,$t4
    syscall
    li $v0, 10                  #end of program
    syscall
fun1:                           #Difference of pairs for when n > m
    sub $t4,$t0,$t1             #($t0-$t1),($t0-$t2),($t0-$t3)
    j compute2                  #go back and check if $t0<$t2
fun2:
    sub $t5,$t0,$t2
    j compute3                  #go back and check if $t0<$t3
fun3:
    sub $t6,$t0,$t3
    j compute4                  #go back and check if $t1<$t2
fun4:                           #($t1-$t2),($t1-$t3)
    sub $t7,$t1,$t2
    j compute5                  #go back and check if $t1<$t3
fun5:
    sub $t8,$t1,$t3
    j compute6                  #go back and check if $t2<$t3
fun6:                           #($t2-$t3)
sub $t9,$t2,$t3
j sum                           #go back to sum and compute result
