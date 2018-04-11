//Leonardo Roman 
//lr534 
//02/27/2017
public class LuckySevens {
	public static void main(String[] args) {
		int lowerBound,upperBound;

			int numberOfSevens = 0;
			int j=0;
			while(true){
		System.out.print("Enter lower end of range or 00 to finish: ");
		lowerBound=IO.readInt();
		if(lowerBound == 00)
			return;
		
		System.out.print("Enter upper end of range or 00 to finish: ");
		upperBound=IO.readInt();
		if(upperBound == 00)
			return;
		
		if(lowerBound>upperBound){
			IO.reportBadInput();
		}else{
		for (int i=lowerBound;i<=upperBound ;i++ ) {
			j = Math.abs(i);
			while(j>0){
				if(j%10==7){
					numberOfSevens+=1;
				}
				j/=10;
			}
		}
		
		IO.outputIntAnswer(numberOfSevens);
		
		}
	}
  }
}
