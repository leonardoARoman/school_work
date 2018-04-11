//Assignment_2
//Fahd Humayun - 168000889 - fh186

/*
//cpp code
void main()
{
	int x[10];
	int neg=0, pos=0, neg_sum=0, pos_sum=0;
	int neg_mean=0, pos_mean=0;
	
	for (int i = 0; i < 10; i++)
	{
		if(x[i] <= 0)
		{
			neg++;
			neg_sum += x[i];
		}
		else
		{
			pos++;
			pos_sum += x[i];
		}
	}
	neg_mean = neg_sum / neg;
	pos_mean = pos_sum / pos;
} 
*/

/*
- data in local memory starting from the address that is stored in register r1

- each memory address can store 2 bytes = 16 bits
*/

/*
Registers Used:
- r1: base address of data in local memory (used for x[i])
- r2: used for the integer variable 'neg'
- r3: used for the integer variable 'pos'
- r4: used for the integer variable 'neg_sum'
- r5: used for the integer variable 'pos_sum'
- r6: used for the integer variable 'neg_mean'
- r7: used for the integer variable 'pos_mean'
- r8: used for loading the data from memory (16-bit)
- r10: used for the loop counter
- r11: used to check the condition of loop
- r12: used to check the condition for 'if' and 'else' (true or false)
*/

	/*
	r2, r3, r4, r5, r6, r7, r8 (type .s16) will have value 0
	r10 (type .s32) will have a value 0
	r13 will have a value 1 (true)
	*/
	
	/*
	8-bit or 16-bit values may be held directly in 32-bit or 64-bit registers when 
	being loaded, stored, or converted to other types and sizes.
	*/
	
	//Variable/register Declarations, assigning values to the variables/registers
	.reg	.b32	r1;
	.reg	.s16	r8;
	.reg	.s32	r2, r3, r4, r5, r6, r7, r10;
	.pred	r11, r12;
	
	.local	.s16	x[10];	//array x[10] will have some values declared to it
	
	mov.b32		r1, x;		//move base address of array i.e. address of x[0] into r1
	mov.s32		r2, 0;		//neg  = 0;
	mov.s32		r3, 0;		//pos  = 0;
	mov.s32		r4, 0;		//neg_sum  = 0;
	mov.s32		r5, 0;		//pos_sum  = 0;
	mov.s32		r6, 0;		//neg_mean  = 0;
	mov.s32		r7, 0;		//pos_mean  = 0;
	mov.s32		r10, 0;		//i  = 0;
	
	//if 64-bits is to be used then use '.reg .s64' and 'mov.s64'
	...

	loop:
		//(i < 10 in c++ for loop, if condition is false then end the loop)
		setp.ge.s32		r11, r10, 10;		//r11 = 1, if r10 >= 10
		@r11 bra end;
		
		//load data from memory
		ld.local.s16	r8, [r1 + 0];		//r8 = x[i]
		
		//check condition (x[i] <= 0) if true jump to if_ label, else continue from next instruction
		setp.le.s64		r12, r8, 0;		//r12 = 1, if r8 <= 0
		
		//16-bit integer stored in the local memory so increment the address by 2
		//to store next integer (2*8 = 16)
		add.b32		r1, r1, 2;
		add.s32		r10, r10, 1;	//increment counter, i++
		
		@r12 bra if_;
		@!r12 bra else_;
		
		if_:
			//(neg++)
			add.s16		r2, r2, 1;		//r2 = r2 + 1
			
			//(neg_sum += x[i])
			add.s16		r4, r4, r8;		//r4 = r4 + r8	
			
			bra loop;
		
		else_:
			//(pos++)
			add.s16		r3, r3, 1;		//r3 = r3 + 1
			
			//(pos_sum += x[i])
			add.s16		r5, r5, r8;		//r4 = r4 + r8	
			
			bra loop;
		
	end:
		//(neg_mean = neg_sum / neg)
			div.s16		r6, r4, r2;		//r6 = r4/r2
		
		//(pos_mean = pos_sum / pos)
			div.s16		r7, r5, r3;		//r7 = r5/r3
			
		//for the above division instructions it would be better to use floating point
		//registers as the result stored would not have the fraction part because of the
		//integer type used, but, in the pseudocode given the variables used are integer
		//types, that is why same type used here in the code. 