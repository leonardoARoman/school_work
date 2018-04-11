#Leonardo Roman lr534
#This program calculates the square root of a positive
#floating number using newton's method.
.data 
message1: 	.asciiz "Enter a number: "
sqr: 		.asciiz "The square root is "
error: 		.asciiz "Enter a positive number\n."
limit:		.float 0.0
E: 			.float	0.00001
xi: 		.float 1.0

.text 
.globl main

main:
li $v0,4							#to print a string message
la $a0,message1
syscall
li $v0,6							#to read a float
syscall
mov.s $f2,$f0						#$f2 = number(b)
lwc1 $f1,limit						#$f1 = 0.0
c.lt.s $f2,$f1	 					#if number < 0 go to error
bc1t Error
lwc1 $f3,E							#$f3 = E = 0.00001
lwc1 $f4,xi							#$f4 = 1.0 (xi)
li.s $f5,2.0						#$f5 = 2.0
	
NSqrt:
div.s $f6,$f2,$f4					#$f6 = b/xi
add.s $f7,$f4,$f6					#$f7 = xi + b/xi
div.s $f7,$f7,$f5					#$f7 = xi+1 = 0.5*(xi + b/xi)
sub.s $f8,$f7,$f4					#$f8 = xi+1 - xi
abs.s $f8,$f8						#$f8 = |xi+1 - xi|
c.lt.s $f8, $f3						#$f8 = |xi+1-xi| < 0.00001, FCCR = 1
bc1t end							#if FCCR = 1, jump to end
mov.s $f4,$f7						#$f4 = $f7 or xi = xi+1
j NSqrt
	
end:
li $v0,4							# print string
la $a0,sqr							# load address of result
syscall	
li $v0,2							#to print a float
mov.s $f12,$f7						#f12 = f9
syscall
li $v0,10
syscall
		
Error:
li $v0,4							# print string
la $a0,error					
syscall
j main