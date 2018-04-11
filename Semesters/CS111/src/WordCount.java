//Leonardo Roman 
public class WordCount {
	
	public static int countLetters(String word,int minLength){
		String newWord = "";
		int counter = 0;
		
		for (int i = 0; i < word.length(); i++) {
			if(((char)word.charAt(i)>=65 && (char)word.charAt(i)<=90) || 
			((char)word.charAt(i)>=97 && (char)word.charAt(i)<=122) 
			&& word.length()>=minLength) {//system check.(only accepts letters)
				
				newWord = newWord + word.charAt(i);
				counter++;
			}//end if
		}//end for
		System.out.println(newWord);//prints the word with only letters for debugging 

	return counter;//returns number of letters
}//end function

	public static int countWords(String original, int minLength){

		int count = 0;
		int wordCount = 0;
		
		if(minLength < 0)
			return -1;
		
		String[] words = original.split(" ");

		for (int i = 0 ;i < words.length;i++ ) {
			count = countLetters(words[i],minLength);
			if (count >= minLength) {
				wordCount++;
			}
		}
		return wordCount;
	}//end function
	
	public static void main(String[] args){

		System.out.print("Enter a sentence: ");
		String sentence = IO.readString();
		
		System.out.print("Enter minimun word length: ");
		int length = IO.readInt();
		
		int count = countWords(sentence,length);
		if(count == -1){
			IO.outputStringAnswer("Enter a minimun length greater than 0.");
			return;
		}
		IO.outputStringAnswer("The number of words is: "+count);

	}//end main
}//end class


