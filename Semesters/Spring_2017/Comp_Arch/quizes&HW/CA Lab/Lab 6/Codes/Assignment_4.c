//Assignment_4 (PTX ISA)
//Fahd Humayun - 168000889 - fh186

//Sort the array -> A = {2,-4,4,7,11,8}

/*
c++ code:
void BubbleSort(int data_array[], int size_of_array)
{
for (int i = 1; i < data_array.size() - 1; i++)
	{
		swap_flag = false;
		for (int j = 0; j < data_array.size() - i; j++)
		{
			if ( data_array[j] > data_array[j + 1] )
				swap(data_array, j, j+1);
		}
		
		if ( !swap_flag )
			break;
	}
}
*/
/*
Registers Used:
- r1: base address of array in local memory (used for Array[i])
- r2: Array[i]
- r3: Array[i + 1]
- r4: size of array
- r5: outer loop counter (i)
- r6: outer loop condition
- r7: inner loop counter (j)
- r8: inner loop condition
- r10: predicate for outer loop
- r11: predicate for inner loop
- r12: predicate for if condition
*/

	//array declaration
	.local .s32 Array[] = {2,-4,4,7,11,8};

	.reg	.b32	r1;
	.reg	.s32	r2,r3,r4,r5,r6,r7,r8;
	
	.pred	r10,r11,r12
	
	mov.s32		r4, 6;		//size of array = 6
	mov.s32 	r5, 1;		//i = 1
	sub.s32		r6, r4, 1;	//size of array - 1
	
	outer_loop:
		setp.lt.s32		r10, r5, r4;		//r10 = 1, i < (size of array - 1)
		
		@!r10	bra		end_oLoop;
		
		mov.b32		r1, Array;	//move base address of array into r1
		mov.s32		r7, 0;		//j = 0
		sub.s32		r8, r4, r5	//size of array - i
	
		inner_loop:
			setp.lt.s32		r11, r7, r8;	//r11 = 1, j < (size of array - i)
			
			@!r11	bra		end_iLoop;
			
			ld.local.s32	r2,[r1 + 0];	//Array[i]
			ld.local.s32	r3,[r1 + 4];	//Array[i+1]
			
			add.s32			r1, r1, 4;		//increment address
			add.s32			r7, r7, 1;		//j++
			
			//if(Array[i] > Array[i+1])
			setp.gt.s32		r12, r2, r3;		//r12 = 1, r2 > r3
			
			@!r12 	bra 	inner_loop;
			
			st.local.s32	[r1 + 0], r3	//Array[i] = Array[i+1]
			st.local.s32	[r1 + 4], r2	//Array[i+1] = Array[i]
			
			bra		inner_loop;
		
		end_iLoop:
			add.s32			r5, r5, 1;		//i++
			bra		outer_loop;
			
	
	end_oLoop:
		...