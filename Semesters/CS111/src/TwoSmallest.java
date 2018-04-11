//Leonardo Roman lr534
//This program finds two smallest integers in a sequence of numbers entered by user.
public class TwoSmallest {

	public static void main(String[] args) {
		
		double terminatingNum,number,number2,smallNum1,smallNum2,temp;
		
		System.out.print("Enter a number that will terminate program: ");
		terminatingNum = IO.readDouble();
		
		System.out.print("Enter numbers: ");
		number = IO.readDouble();
		if(number == terminatingNum)
			return;
			
		System.out.print("Enter numbers: ");
		number2 = IO.readDouble();
		if(number2 == terminatingNum)
			return;
		
		smallNum1 = number;						//holds first number entered temporarily 
		smallNum2 = number2;					//holds second number entered temporarily
		temp = 0;								//to hold a value temporarily 
		
		while(true){
			System.out.print("Enter number: ");
			number = IO.readDouble();
			if(number == terminatingNum){		//To check if user wants to terminate program
				break;							//Terminate while loop if condition is true
			}
			temp = smallNum1;					//Holds smallNum1 temporarily
			
			if(number<smallNum2){				//First system check 	
				smallNum2 = number;				//if true then smallNum2 is next smallest number
			}
			
			if(number <= temp){					//First system check 
				smallNum1 = number;				//if true then smallNum1 is  current number
				smallNum2 = temp;				//smallNum2 holds temp now
			}
			
		}
		IO.outputDoubleAnswer(smallNum1);
		IO.outputDoubleAnswer(smallNum2);
	}

}
