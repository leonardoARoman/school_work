//Leonardo Roman lr534 
//LuckyNines program calculate the number of nines
//contained in a range of number entered by user.
public class LuckyNines {

	public static int countLuckyNines(int lowerEnd,int upperEnd){
		int numberOfNines = 0;
		if(lowerEnd > upperEnd){
			return -1;
		}
		for (int i=lowerEnd;i<=upperEnd ;i++ ) {
			int j = Math.abs(i);
			while(j>0){
				if(j%10==9){
					numberOfNines+=1;
				}
				j/=10;
			}
		}
		return numberOfNines;
	}

	public static void main(String[] args) {
		int lowerBound,upperBound;
		//int totalNumberofNines = 0;
		
		while(true){
			System.out.print("Enter lower end of range or 00 to finish: ");
			lowerBound=IO.readInt();
			if(lowerBound == 00)
				return;

			System.out.print("Enter upper end of range or 00 to finish: ");
			upperBound=IO.readInt();
			if(upperBound == 00)
				return;

			if(countLuckyNines(lowerBound,upperBound)==-1){
				IO.reportBadInput();
			}else{
				//totalNumberofNines = countLuckyNines(lowerBound,upperBound);
				IO.outputIntAnswer(countLuckyNines(lowerBound,upperBound));
			}
		}
	}
}
