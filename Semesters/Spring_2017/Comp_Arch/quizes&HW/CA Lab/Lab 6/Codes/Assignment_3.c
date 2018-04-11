//Assignment_3 (PTX)
//Fahd Humayun - 168000889 - fh186

//input n in register r1

/*
Registers Used:
- r1: input n (as well as inner loop counter)
- r2: result
- r3: inner loop counter
- r4: used for 2^k
- r5: 1/2
- r10: outer loop condition
- r11: inner loop condition
*/
	.reg	.f32	r2,r4,r5;
	.reg	.u32	r1, r3;
	.pred	r10, r11;
	
	mov.f32		r2, 1;		//r2 = 1
	mov.f32		r5, 0.5;	//r5 = 1/2
	
	outer_loop:
		
		setp.gt.u32	r10, r1, 0;	//r10 = 1, r1 > 0
		
		@!r10		bra		end;
		
		mov.u32		r3, r1;		//r3 = r1
		mov.f32		r4, 1;		//r4 = 1
		
		inner_loop:
		
			sub.u32		r3, r3, 1;	//decrement inner loop counter
			setp.gt.u32	r11, r3, 1;	//r11 = 1, r3 > 1
			@r11 	mul.f32		r4, r4, r5;	//r4 = r4 * 1/2
			@r11	bra			inner_loop;
			@!r11	mad.f32 	r2, r4, r5, r2;		// r2 = r4*r5 + r2
			
			sub.u32		r1, r1, 1;	//decrement outer loop counter
			
			bra		outer_loop;
			
			
	end:
		...