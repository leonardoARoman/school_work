
public class recitationPractice {
	public static void main(String []args){
		System.out.println("Please input a nonnegative integer");
		int input = IO.readInt();
		
		if(input < 0){
			IO.reportBadInput();
			System.out.println("Please enter again:");
			input = IO.readInt();
		}
		System.out.println("Please choice one option. Type -1 to quit\n");
		System.out.println("1. print the number of digits of the input");
		System.out.println("2. print all the digits in the reverse order");
		System.out.println("3. print the number of sevens that within the input");
		System.out.println("4. print the number of digits that appear exactly once");
		
		int choice = IO.readInt();
		int result = -1;
		
		switch(choice){
			case 1:
				result = numberOfDigits(input);
				break;
				
			case 2:
				result = digitsInReverse(input);
				break;
				
			case 3:
				result = numberOfSevens(input);
				break;
				
			case 4:
				result = numberOfUniqueness(input);
				break;
				
			case -1:
				return;
		}
		
		System.out.println("the answer is " + result);
	}
	
	/* this function computes and returns the number of digits contained within the input variable 
	 */
	
	public static int numberOfDigits(int input){
		
		return input; // the line is purely for the compiler to compile
		// your code goes here;
	}
	
	/* this function reverses the digits contained within the input variable 
	 */
	
	public static int digitsInReverse(int input){
		int upper = input/10;
		int lower = input%10;
		String reverse = lower+""+upper;   				//92 as string 
		int number = Integer.parseInt(reverse);
		return number; // the line is purely for the compiler to compile
		// your code goes here;
	}
	
	/* this function computes and returns the number of digit "seven" contained within the input variable 
	 */
	
	public static int numberOfSevens(int input){
		return -1; // the line is purely for the compiler to compile
		// your code goes here;
	}
	
	/* this  function computes and returns the number of digits that appear exactly once within the input variable
	 */
	
	public static int numberOfUniqueness(int input){
		return 0;
		// your code goes here;
	}
}
