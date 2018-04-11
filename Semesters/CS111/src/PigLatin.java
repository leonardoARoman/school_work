//Leonardo Roman lr534
public class PigLatin {

	public static String translate(String word){
		
		if(((char)word.charAt(0)>=65 && (char)word.charAt(0)<=90) || ((char)word.charAt(0)>=97 && (char)word.charAt(0)<=122)){

			char[] checkVowels = {'a','e','i','o','u','A','E','I','O','U'};
			
			String pigWord;

			for(int i = 0; i < 10; i++){
				
				if(word.charAt(0) == checkVowels[i]){
					
					return word+"way";
					
				}//end if
			}//end loop
			pigWord = word.substring(1,word.length());
			return pigWord+word.charAt(0)+"ay";
		}//end if
		return "0";
	}//end function

	public static void main(String[] args){
		System.out.print("Enter a word: ");
		String word = IO.readString();
		String pigLatin = translate(word);

		if(pigLatin.equals("0")){
			IO.outputStringAnswer("Not a valid word.");
			return;
		}//end if
		IO.outputStringAnswer(word+" translated to Pig Latin is: \""+pigLatin+"\" ");
	}//end main

}
