//Assignment_1
//Fahd Humayun - 168000889 - fh186

/*
//cpp code
void main()
{
	int a, b, c, d;
	int e[10];
	for (int i = 0; i < 10; i++)
	{
		if(a<=b)
		{
			a = a + c;
			e[i] = a;
		}
		else
		{
			a = a - d;
			e[i] = a;
		}
	}
} 
*/

//Program in ISA described in lab manual

/*
- data in local memory starting from the address that is stored in register r0,r1

- total number of registers available -> 64 (32-bits)
  registers numbered from 0 to 63

- For a 64-bit data use pair of registers -> for example 64-bit number stored in
  registers r0 and r1, then, refer to this number by r0
  
- 
*/

/*
Registers Used (32-bit):
- r1: (assuming 32-bit address) base address of data in local memory (used for e[i])
- r2: used for the integer variable 'a' (and assuming some data initialized)
- r4: used for the integer variable 'b' (and assuming some data initialized)
- r6: used for the integer variable 'c' (and assuming some data initialized)
- r8: used for the integer variable 'd' (and assuming some data initialized)
- r10: used for the loop counter
- r12: used to check the condition for 'if' and 'else' (true or false) (predicate operand 1-bit)
- r13: used to check the condition of loop (predicate operand 1-bit)
*/

	//Variable/register Declarations, assigning values to the variables/registers
	.reg	.b32	r1;
	.reg	.s32	r2, r4, r6, r8;
	.reg	.s32	r10;
	.pred	r12, r13;
	
	.local	.s32	e[10];	//array e[10] will have some values declared to it
	
	mov.b32		r1, e;		//move base address of array i.e. address of e[0] into r1
	mov.s32		r10, 0;		//r10 = 0 (i = 0)
	
	//Similarly, use 'mov.s32' for registers r2, r4, r6, and r8 to assign values
	//if 64-bits is to be used then use '.reg .s64' and 'mov.s64'
	...
		
		
	loop:
		//(i < 10 in c++ for loop, if condition is false then end the loop)
		setp.ge.s32		r13, r10, 10;		//r13 = 1, if r10 >= 10
		@r13 bra end;
		
		//check condition (a <= b) if true jump to if_ label, else continue from next instruction
		setp.le.s32		r12, r2, r4;		//r12 = 1, if r2 <= r4
		
		@r12	add.s32		r2, r2, r6	//if (a <= b), then (a = a + c) r2 = r2 + r6
		@!r12	sub.s32		r2, r2, r8;	//else (a = a - d) r2 = r2 - r8
		
		st.local.s32	[r1 + 0], r2;	//store r2 in local memory at address [r1 + 0] (e[i] = a)
			
		//32-bit integer stored in the local memory so increment the address by 4
		//to store next integer (4*8 = 32)
		//if 64-bit integer then increment by 8 i.e. 8*8 = 64
		add.b32			r1, r1, 4;
		add.s32			r10, r10, 1;	//increment counter, i++
		
		bra loop;
		
	end:
	...