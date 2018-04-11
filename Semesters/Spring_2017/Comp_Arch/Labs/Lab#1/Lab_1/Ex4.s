#Leonardo Roman 168000447 lr534
#Write a program that will prompt the user to enter his name
#and then print them out.

.data 0x10010000
name: .space 20

.data 0x10011000
message1: .asciiz "Please enter your name: "
message2: .asciiz "\nPrinting name.....\n "

.text
.globl main

main:
                    #printing message1 (Please enter your name:)
li $v0, 4           #for printing string
la $a0, message1    #loading address of the string that needs to be printed
syscall
                    #reading string input
li $v0, 8           #code 8 is to read a string
la $a0, name        #loading the address of empty space, where the name
                    #(string) is going to be saved in the data
li $a1, 20
move $t0, $a0
syscall

li $v0, 4           #printing string
la $a0, message2    #the string to be printed
syscall

move $a0, $t0       #moving the name to a0
li $v0, 4           #printing string (from a0)
syscall

li $v0, 10
syscall
