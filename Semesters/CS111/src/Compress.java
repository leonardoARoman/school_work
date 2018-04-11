//Leonardo Roman lr534
public class Compress {

	public static String compress(String original){
		String character;
		// Buffer to collect sequences
		String compressed = "";
		// To count number of letters in sequence.
		int occurrences = 0;

		// Error cehcking.
		if(original.length() == 1)
			return original;
		else if(original.length() == 0)
			return "0";

		for (int i = 1; i < original.length(); i++) {
			occurrences++;
			// toString a sequence of letters from start to of sequence till
			// next differente character.
			if (original.charAt(i-1) != original.charAt(i)) {
				compressed += counter(Character.toString(original.charAt(i)),occurrences);
				occurrences = 0;
			}
			// toString upto last character in original string.
			if (original.charAt(i-1) == original.charAt(i) && i==original.length()-1) {
				occurrences++;
				compressed += counter(Character.toString(original.charAt(i)),occurrences);
				occurrences = 0;
			}
			// If last character in string has no occurrences.
			else if (i==original.length()-1 && occurrences == 0) {
				compressed += counter(Character.toString(original.charAt(i)),occurrences);
			}
		}
		return compressed;
	}

	// Helper function toString letter count.
	public static String counter(String letter,int count){
		String num = Integer.toString(count);
		if (count==0||count==1) {
			return letter;
		}
		String newStr = count+letter;

		return newStr;
	}

	public static void main(String[] args){
		System.out.println(compress("qwwwwwwwwweeeeerrtyyyyyqqqqwEErTTT"));
		}
}
