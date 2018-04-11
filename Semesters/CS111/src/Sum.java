//Leonardo Roman lr534
//Sum.java assignment 
public class Sum {

	public static void main(String[] args) {
		int num1, num2, sum = 0;//local variables

		System.out.print("Enter a number 1: ");
		num1 = IO.readInt();//prompt user to enter first number
		System.out.print("Enter a number 2: ");
		num2 = IO.readInt();//prompt user to enter first number
		sum = num1 + num2;

		IO.outputIntAnswer(sum);
	}

}
