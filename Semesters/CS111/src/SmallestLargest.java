
//Leonardo Roman lr534
//SmallestLargest program outputs the smallest and largest 
//numbers out of a list of given number entered by user.
public class SmallestLargest {

	public static void main(String[] args) {

		double terminatingNum;
		double number,smallestNum,largestNum;
		
		System.out.print("Enter terminating number: ");
		terminatingNum = IO.readDouble();
		
		System.out.print("Enter number: ");
		number = IO.readDouble();
		if(number == terminatingNum){
			IO.outputStringAnswer("Program terminated.");
			return;
		}
		largestNum = number;
		smallestNum = number;
		
		while(true){
			System.out.print("Enter number: ");
			number = IO.readDouble();
			if(number == terminatingNum){
				break;
			}
			if(number < smallestNum){
				smallestNum = number;
			}
			if(number>largestNum){
				largestNum = number;
			}
		}
		IO.outputDoubleAnswer(smallestNum);
		IO.outputDoubleAnswer(largestNum);
	}

}
