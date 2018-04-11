#Leonardo Roman lr534
#This program calculates the surface area and volume of a cuboid by
#using the formula SA = 2(lw+lh+wh) and V = lwh

.data
lenght: 		.asciiz "Enter length: "
width:			.asciiz "Enter width: "
height: 		.asciiz "Enter heigth: "
SA: 			.asciiz "The surface area of cuboid is: "
volume: 		.asciiz "\nand the volume of cuboid is: "
error: 			.asciiz "Enter a value greater than 0.001.\n"

.text
.globl main

main:
li.s $f1,0.001					#$f1 = system failure smallest value
li.s $f5,2.0					#$f5 = 2.0(multiplicand)

promptLength:
li $v0,4						#To print a string message
la $a0,lenght 					#Print message
syscall
li $v0,6						#To read a float number
syscall
mov.s $f2,$f0					#$f2 = l
c.lt.s $f2,$f1					#if l < 0.001 go to error
bc1t error1 

promptWidth:
li $v0,4						#To print a string message
la $a0,width 					#Print message
syscall
li $v0,6						#To read a float number
syscall
mov.s $f3,$f0					#$f3 = w
c.lt.s $f3,$f1					#if w < 0.001 go to error
bc1t error2 

promptHeight:
li $v0,4						#To print a string message
la $a0,height 					#Print message
syscall
li $v0,6						#To read a float number
syscall
mov.s $f4,$f0					#$f4 = h
c.lt.s $f4,$f1					#if h < 0.001 go to error
bc1t error3 

S_Area:							#SA = 2(lw+lh+wh)
li $v0,4						#To print a string message
la $a0,SA 						#Print message
syscall
mul.s $f6,$f2,$f3				#$f6 = lw
mul.s $f7,$f2,$f4				#$f7 = lh
mul.s $f8,$f3,$f4				#$f8 = wh
add.s $f12,$f6,$f7				#$f12 = lw + lh
add.s $f12,$f12,$f8				#$f12 = lw + lh + wh
mul.s $f12,$f12,$f5				#$f12 = 2*(lw + lh + wh)
li $v0,2						#To print a float
syscall

Volume:							#V = lwh
li $v0,4						#to print a string message
la $a0,volume
syscall
mul.s $f12,$f6,$f4				#$f12 = lwh
li $v0,2						#To print a float number
syscall
li $v0,10						#To terminate program
syscall							#program terminated 

#------------------------------Error Messages-----------------------------------
error1: 
li $v0,4
la $a0,error
syscall
j promptLength

error2: 
li $v0,4
la $a0,error
syscall
j promptWidth

error3: 
li $v0,4
la $a0,error
syscall
j promptHeight