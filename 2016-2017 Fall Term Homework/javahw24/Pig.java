//Jonathan Quang
//APCS1 pd5
//HW#24 -- Otnay Ybay ethay Airhay Onway Ymay Inneechay Inchay Inchay
//2016--10--29

public class Pig {
    //Q: How does this initialization make your life easier?
	//you can loop through this initialization to check if a character is a vowel,
	//instead of writing 5 if statements.
    private static final String VOWELS = "aeiou";


    /*=====================================
      boolean hasA(String,String) -- checks for a letter in a String
      pre:  w != null, letter.length() == 1
      post: hasA("cat", "a") → true  
      hasA("cat", "p") → false
		
		This algorithm works by having a for loop go through each letter in string w until
		it finds a match.
	  ======================*/
    public static boolean hasA( String w, String letter ) 
    {
	for (int x=0; x < w.length(); x+=1) {
	    if (w.substring(x,x+1).equals(letter)){
		return true;
	    }
	}
	return false;
    }//end hasA()


    /*=====================================
      boolean isAVowel(String) -- tells whether a letter is a vowel
      precondition: letter.length() == 1
	  This algorithm works by going through the string of vowels 
	  until it finds a match
      =====================================*/
    public static boolean isAVowel( String letter ) 
    {
		for (int x=0; x < VOWELS.length(); x+=1) {
			if (VOWELS.substring(x,x+1).equals(letter)) {
				return true;
				}
			}
		return false;
    }


    /*=====================================
      int countVowels(String) -- counts vowels in a String
      pre:  w != null
      post: countVowels("meatball") → 3
	  A for loop goes through each character of string w
	  and uses isAVowel() to check if it is a vowel. If it is,
	  it increments up retInt, then returns it at the end.
      =====================================*/
    public static int countVowels( String w ) 
    {
		int retInt = 0;
		for (int x = 0; x < w.length(); x+=1) {
			if (isAVowel(w.substring(x,x+1))){
				retInt += 1;
			}
		}
		return retInt;
    }


    /*=====================================
      boolean hasAVowel(String) -- tells whether a String has a vowel
      pre:  w != null
      post: hasAVowel("cat") → true
      hasAVowel("zzz") → false
	  This method uses the result of countVowels to determine if a string has vowels or not
      =====================================*/
    public static boolean hasAVowel( String w ) 
    {
		if (countVowels(w) == 0) {
			return false;
			}
		return true;
    }


    /*=====================================
      String allVowels(String) -- returns vowels in a String
      pre:  w != null
      post: allVowels("meatball") → "eaa"
	  This function loops through each letter in string w, and if that letter isAVowel
	  Then it concatenates it to the return string
      =====================================*/
    public static String allVowels( String w ) {	
		String retString="";
		for(int x = 0; x < w.length(); x += 1) {
			if (isAVowel(w.substring(x,x+1))) {
				retString += w.substring(x,x+1) ;
				}
		}
		return retString;
    }


    /*=====================================
      String firstVowel(String) -- returns first vowel in a String
      pre:  w != null
      post: firstVowel("") --> ""
      firstVowel("zzz") --> ""
      firstVowel("meatball") --> "e"
	  Generally, this method returns the first letter of allVowels(w), which would be the first vowel
	  in string W. There are cases where the length of w is 0 or 1 that must be considered so that
	  there is no index out of range error.
      =====================================*/
    public static String firstVowel( String w ) {
		String vowels = allVowels(w);
		if (vowels.length()==0) {
			return "";
		}
		else if (vowels.length()==1) {
			return vowels;
		}
		return vowels.substring(0,1);
    }


    /*=====================================
      boolean beginsWithVowel(String) -- tells whether a String begins with a vowel
      pre:  w != null and w.length() > 0
      post: beginsWithVowel("apple")  --> true
      beginsWithVowel("strong") --> false
	  This method uses the firstVowel on string w, and checks if that is
	  also the first letter of string w. There is an exception with w of length 1
	  to prevent an out of bound error.
      =====================================*/
    public static boolean beginsWithVowel( String w ) 
    {
		if (w.length() == 1) {
			return (w==firstVowel(w));
		}
		return (w.substring(0,1).equals(firstVowel(w)));
    }


    /*=====================================
      String engToPig(String) -- converts an English word to Pig Latin
      pre:  w.length() > 0
      post: engToPig("apple")  --> "appleway"
      engToPig("strong") --> "ongstray"
      engToPig("java")   --> "avajay"
	  This algorithm first checks if the word starts with a vowel. If it does, return the string + way
	  If not, then it proceeds to run a while loop that runs so long as loopInterrupter is true
	  The while loop checks each letter from the first to see if it isn't a vowel. If it isn't, it
	  increments lastIndexOfCons (which keeps track of the first index that doesn't contain a consonant).
	  All letters before it are a group of consonants that comprise a consonant syllable. The method then
	  returns all letters from lastIndexOfCons onward, + the consonant syllable + ay.
      =====================================*/
    public static String engToPig( String w ) {
		int lastIndexOfCons=0;
		boolean loopInterrupter=true;
		if (beginsWithVowel(w)) {
			return w+"way";
		}
		while (loopInterrupter) {
			if (isAVowel(w.substring(lastIndexOfCons,lastIndexOfCons+1))){
				loopInterrupter=false;
			}
			else {
				lastIndexOfCons+=1;
			}
		}
		
		return w.substring(lastIndexOfCons) + w.substring(0,lastIndexOfCons) + "ay";
		
		}
    


    public static void main( String[] args ) {
	System.out.println("--Testing hasA--");
	System.out.println("cat,a " + hasA("cat", "a"));
	System.out.println("cat,k " + hasA("cat", "k"));
	System.out.println("--Testing is a vowel--");
	System.out.println("a " + isAVowel("a"));
	System.out.println("e " + isAVowel("e"));
	System.out.println("r " + isAVowel("r"));
	System.out.println("--Testing how many vowels--");
	System.out.println("how many " + countVowels("how many"));
	System.out.println("qwqwqtw " + countVowels("qwqwqtw"));
	System.out.println("--Testing if there is a vowel--");
	System.out.println("Sshoop da woop " + hasAVowel("shoop da woop"));
	System.out.println("zxcvbnm " + hasAVowel("zxcvbnm"));
	System.out.println("--Testing the allVowels method--");
	System.out.println("shoop da woop " + allVowels("shoop da woop"));
	System.out.println("zxcvbnm " + allVowels("zxcvbnm"));
	System.out.println("--Testing first vowel--");
	System.out.println("shoop da woop: " + firstVowel("shoop da woop"));
	System.out.println("zxc:"  + firstVowel("zxc"));
	System.out.println("--Testing begins with vowel--");
	System.out.println("rubber: " + beginsWithVowel("rubber"));
	System.out.println("octopus: " + beginsWithVowel("octopus"));	
	System.out.println("--Testing engToPig--");
	System.out.println("apple:" + engToPig("apple"));
	System.out.println("strong:" + engToPig("strong"));
	System.out.println("java:" + engToPig("java"));
    }//end main()

}//end class Pig

