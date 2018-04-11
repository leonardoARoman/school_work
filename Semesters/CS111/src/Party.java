//Leonardo Roman lr534
//Party.java assignment 
public class Party {

	public static void main(String[] args) {

		//local variables
		int numberOfGuests, slicesPerPerson, sodaCansPerGuest;
		
		double pizzaPiePrice, sodaCasePrice, 
		totalPizzaCost = 0.0,totalSodaCost = 0.0,totalCost = 0.0;
		
		int totalPizzaSlices = 0, totalSodaCans = 0, numOfCansInCase,
		slicesInPie,totalPizzaPies,totalSodaCases,evenOrOdd;
		
		//User input
		System.out.print("Enter the number of guests attending the party: ");
		numberOfGuests = IO.readInt();
		System.out.print("Enter the number of pizza slices per guest: ");
		slicesPerPerson = IO.readInt();
		System.out.print("Enter the number of soda cans per guest: ");
		sodaCansPerGuest = IO.readInt();
		System.out.print("Enter the cost of pizza pie: ");
		pizzaPiePrice = IO.readDouble();
		System.out.print("Enter the number of slices in a pizza pie : ");
		slicesInPie = IO.readInt();
		System.out.print("Enter the cost of soda case: ");
		sodaCasePrice = IO.readDouble();
		System.out.print("Enter the number of soda cans in a case: ");
		numOfCansInCase = IO.readInt();
		
		totalPizzaSlices = numberOfGuests * slicesPerPerson;
		totalSodaCans = numberOfGuests * sodaCansPerGuest;
		
		evenOrOdd = totalPizzaSlices % slicesInPie;
		if(evenOrOdd == 0){
			totalPizzaPies = totalPizzaSlices/slicesInPie;
		}else{
			totalPizzaPies = (totalPizzaSlices/slicesInPie) + 1;
		}
		
		evenOrOdd = totalSodaCans % numOfCansInCase;
		if(evenOrOdd == 0){
			totalSodaCases = totalSodaCans / numOfCansInCase;
		}else{
			totalSodaCases = (totalSodaCans / numOfCansInCase) + 1;
		}
		totalPizzaCost = totalPizzaPies * pizzaPiePrice;
		totalSodaCost = totalSodaCases * sodaCasePrice;
		totalCost = totalPizzaCost + totalSodaCost;
		
		IO.outputDoubleAnswer(totalCost);
		
	}

}
