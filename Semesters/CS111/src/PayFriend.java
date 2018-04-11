//Leonardo Roman lr534
//02/17/2017
//This program calculates the fees an user would need to pay for 
//using PayFriend program.
public class PayFriend {

	public static void main(String[] args) {
		double threePercentFee,onePercentFee,twoPercentFee,totalCharges;
		threePercentFee = 0.03;
		onePercentFee = 0.01;
		twoPercentFee = 0.02;
		totalCharges = 0.0;
		double payment;
		System.out.print("Enter the amount of money you want to send: ");
		payment = IO.readDouble();
		
		//for the first fee if payment < 100 fee then fee will be $5
		if(payment >0 && payment<=100){
			totalCharges = 5.0;
		}
		//for the second fee if the calculated fee is less than $6 then the fee will be $6
		else if(payment > 100 && ((payment*threePercentFee) < 6)){
			totalCharges = 6.0;
		}else if((payment*threePercentFee) > 6){
			totalCharges = payment * threePercentFee;
		}
		//for the third fee if the calculated fee is less than $15 then the fee will be $15
		if(payment >= 1000 && ((payment*onePercentFee) < 15)){
			totalCharges = 15.0;
		}else if((payment*onePercentFee) > 15){
			totalCharges = payment * onePercentFee;
		}
		//for the last case fee if payment > $15,000 then there will be 3 fees added
		if(payment >10000 && payment <= 15000){
			totalCharges = 100 + ((payment - 10000)*twoPercentFee);
		}else if(payment > 15000){
			totalCharges = 100+100+((payment-15000)*threePercentFee);
		}
		//result
		if(payment == 0){
			System.out.println("Payment not valid!");
		}else
		IO.outputDoubleAnswer(totalCharges);
		
	}

}
