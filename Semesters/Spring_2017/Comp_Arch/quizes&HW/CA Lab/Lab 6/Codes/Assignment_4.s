#Assignment_4 (MIPS)
#Fahd Humayun - 168000889 - fh186

#Sort the array -> A = {2,-4,4,7,11,8}

#c++ code:
#void BubbleSort(int data_array[], int size_of_array)
#{
#for (int i = 1; i < data_array.size() - 1; i++)
#	{
#		swap_flag = false;
#		for (int j = 0; j < data_array.size() - i; j++)
#		{
#			if ( data_array[j] > data_array[j + 1] )
#				swap(data_array, j, j+1);
#		}
#		
#		if ( !swap_flag )
#			break;
#	}
#}

.data 0x10000860
Array:	.word	2 -4 4 7 11 8

.text
.globl main

main:
	li		$7, 6			#size of array
	li		$8, 1			#counter for outer loop (int i = 1)
	addi 	$10, $7, -1		#size of array - 1 (for outer loop condition)
	
	
	
	outer_loop:
		#loop condition
		bge		$8, $10, end_oLoop
		
		li		$12, 0		#used to check if any swap occured in a loop
		li		$9, 0		#counter for inner loop (int j = 0)
		
		sub		$11, $7, $8	#size of array - i (for inner loop condition)
		la		$4, Array		#load base address of array to R4
		
		inner_loop:
			#loop condition
			bge		$9, $11, end_iLoop
			
			lw		$13, 0($4)		#R13 = Array[i]
			lw		$14, 4($4)		#R13 = Array[i+1]
			
			bgt		$13, $14, swap	#Array[i] > Array[i+1]
			
			ret:
			addi	$4, $4, 4		#increment address
			addi	$9, $9, 1		#j++
			j		inner_loop
		
		end_iLoop:
			beqz	$12, end_oLoop	#if no swap occured
			addi	$8, $8, 1		#i++
			j		outer_loop
		
	swap:
		sw		$14, 0($4)		#Array[i] = Array[i+1]
		sw		$13, 4($4)		#Array[i+1] = Array[i]
		addi	$12, $12, 1		#set to 1 as swap occured
		j		ret
		
	end_oLoop:
		li		$2, 10
		syscall