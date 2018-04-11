//Leonardo Roman
public class Convert {

	public static int convert(String binaryString,boolean signBit){
		int binaryNumber = 1;
		int sum = 0;
		IO.outputStringAnswer("SIGNED = "+signBit);//test if signed or not

		if (binaryString.length()==1 && binaryString.charAt(0)=='1') {
			return binaryNumber;
		}
		else if (binaryString.length()==1 && binaryString.charAt(0)=='0') {
			return 0;
		}

		for (int i = 1; i <= binaryString.length(); i++) {
			if (binaryString.charAt(i-1) == '1') {
				//2^i-1
				//System.out.println("test = ");
				for (int j = binaryString.length()-1 ; j > i-1; j--) {
					binaryNumber*=2;
					//System.out.println("test = "+binaryNumber);
				}
				//sum from 1toi = 2^i-1
				sum +=binaryNumber;
				binaryNumber = 1;//reset binaryNumber
			}
		}
		return sum;
	}

	public static void main(String[] args){

		boolean sign = false;
		System.out.print("Enter binary number: ");
		String binaryStr = IO.readString();

		if (binaryStr.charAt(0)=='1') 
			sign = true;
		
		int decimalNumber = convert(binaryStr,sign);
		IO.outputStringAnswer("Binary to Decimal number: "+binaryStr+" = "+decimalNumber);
		}//end of main
}//end of class
