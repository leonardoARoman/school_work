#Leonardo Roman lr534
#This program prompts the user to enter a password
#Password should contained only upper or lower case letters
#and sould be re-entered for confirmation.
.data 
message1: .asciiz "Set a pasword: "
message2: .asciiz "Failed! Please enter a password with the size of 8 to 12.Try again.\n"
message3: .asciiz "Pasword requires only upper and lower case letters. Try again.\n"
message4: .asciiz "Re-enter the password: "
message5: .asciiz "Incorrect, you have 2 more chances! Please re-enter password."
message6: .asciiz "Pasword is setup."
invalid:  .asciiz "Invalid password.\nProgram ended.\n"
password: .space  16

.text 
.globl main

main:
li $t3,1						#counter
li $s7,2						#counter2
li $s0,0xa						#$s0 = null char
li $s1,0x41						#$s1 = 'A'
li $s2,0x5a						#$s2 = 'Z'
li $s3,0x61						#$s3 = 'a'
li $s4,0x7a						#$s2 = 'z'
li $t0,0						#$t0 = i = 0
addi $sp,$sp,-4					#save a word space
sw $s7,0($sp)					#store $s7 on stack

EnterPassword:
li $v0,4						#Printing message
la $a0,message1
syscall
li $v0,8						#Pront user to enter password
la $a0,password
li $a1,16
move $s5,$a0					#$s5 = password[0](based address)
addi $sp,$sp,-4					#save a word space
sw $s5,0($sp)					#store password on stack
syscall

loop:
add $t1,$t0,$s5					#$t1 = password[i]
lb $t2,0($t1)					#load byte by byte
beq $t2,$s0,CheckValidPasswod	#end of password, null character
sge $t4,$t2,$s1	 				#$t4 = 1 if $t2 >= 'A' else 0 invalid (not a letter) 
sle $t5,$t2,$s2 				#$t5 = 1 if $t2 <= 'Z' else 0 invalid (not a letter)  
sge $t6,$t2,$s3 				#$t6 = 1 if $t2 >= 'a' else 0 invalid (not a letter) 
sle $t7,$t2,$s4 				#$t7 = 1 if $t2 <= 'z' else 0 invalid (not a letter)
and $t8,$t4,$t5					#$t8 = $t4 && $t5
and $t9,$t6,$t7					#$t9 = $t6 && $t7
or $s6,$t8,$t9					#$s6 = $t8 || $t9
beq $s6,$0,Error2 				#if $s6 == 0 then not valid password
addi $t0,$t0,1					#i++
j loop

CheckValidPasswod:
li $t3,8						#$s2 = 8
blt $t0,$t3,Error				#if i < 8 go to error
addi $t3,$t3,4					#$s2 = 12
bgt $t0,$t3,Error 				#if i > 12 go to error
lw $s7,0($sp)					#$s7 = 2
li $t0,0						#reset counter

ReEnterPassword:	
li $v0,4						#Printing message
la $a0,message4					#"Re-enter password"
syscall
li $v0,8						#Pront user to enter password
la $a0,password 				#put password in $a0
li $a1,16						#Length of address
move $t9,$a0					#$s5 = password[0](based address)
syscall

loop2:
add $t1,$t0,$t9					#$t1 = REpassword[i]
lb $t2,0($t1)					#load byte by byte
lw $t3,0($sp)					#$t3 = $s5
add $t4,$t0,$t3					#$t4 = password[i]
lb $t7,0($t4)					#load byte by byte
bne $t2,$t7,Error3				#if REpassword[i] != password[i] break
addi $t0,$t0,1					#i++
beq $t2,$s0,ValidPassword 		#end of password, null character
j loop2							#keep looping

ValidPassword:					#check for validation
li $v0,4						#to print string
la $a0,message6					#Valid password
syscall							#Print valid pass
li $v0 10						#end program
syscall
#----------------------------------------------------------------------------------------
#-----------------------------Errors-----------------------------------------------------
#----------------------------------------------------------------------------------------
Error:							#error 1 if pass < 0 or pass > 12 characters
beq $s7,$0,end 					#terminate program if no more chances
li $v0,4
la $a0,message2					#Display proper message
syscall
addi $s7,$s7,-2					#counter2--(user gets one more chance)
j EnterPassword 				#go back to reenter pass

Error2:							#error 2 if password contains any char that is not a letter
beq $t3,$0,end 					#terminate program if no more chances
li $v0,4
la $a0,message3					#Display proper message
syscall
addi $t3,$t3,-1					#counter--(user gets one more chance)
j EnterPassword 				#go back to reenter pass

Error3: 						#error 3 if re-enter pass does not match entered pass
beq $s7,$0,end 					#terminate program if no more chances
li $v0,4
la $a0,message5 				#Display proper message
syscall
addi $s7,$s7,-1 				#counter2--(user gets two more chance)
j ReEnterPassword 				#go back to re-enter pss

end: 							#End program at error
addi $sp,$sp,8 					#re store stack
li $v0,4
la $a0,invalid
syscall
li $v0 10
syscall
