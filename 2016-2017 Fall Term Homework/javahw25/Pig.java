//James Smith
//APCS1 pd5
//HW24 -- Otnay Ybay ethay Airhay Onway Ymay Inneechay Inchay Inchay
//2016-10-28

import java.util.Scanner;

public class Pig {
    private static final String VOWELS = "aeiou";
	private static final String PUNCTUATION ="!.,;";
    
    /*=====================================
      boolean hasA(String,String) -- checks for a letter in a String
      pre:  w != null, letter.length() == 1
      post: hasA("cat", "a") â†’ true  
      hasA("cat", "p") â†’ false
      =====================================*/
    public static boolean hasA( String w, String letter ){
	return (w.indexOf(letter) != -1);
    }
    
    /*=====================================
      boolean isAVowel(String) -- tells whether a letter is a vowel
      precondition: letter.length() == 1
      =====================================*/
    public static boolean isAVowel( String letter ){
	return hasA(VOWELS, letter);
    }


    /*=====================================
      int countVowels(String) -- counts vowels in a String
      pre:  w != null
      post: countVowels("meatball") â†’ 3
      =====================================*/
    public static int countVowels( String w ){
	return allVowels(w).length();
    }


    /*=====================================
      boolean hasAVowel(String) -- tells whether a String has a vowel
      pre:  w != null
      post: hasAVowel("cat") â†’ true
      hasAVowel("zzz") â†’ false
      =====================================*/
    public static boolean hasAVowel( String w ){
        if (countVowels(w) > 0){
	    return true;
	}
	else{
	    return false;
	}
    }


    /*=====================================
      String allVowels(String) -- returns vowels in a String
      pre:  w != null
      post: allVowels("meatball") â†’ "eaa"
      =====================================*/
    public static String allVowels( String w ){
	String retString = "";
	for (int i =0;i < w.length(); i++){//iterates through string and checks if each letter is a vowel and if so, adds it to a string variable to be returned
	    if (isAVowel(w.substring(i,i+1))){
		retString += w.substring(i,i+1);
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
      =====================================*/
    public static String firstVowel( String w ){
	if (hasAVowel(w)){
	    return allVowels(w).substring(0,1);
	}
	return "";
    }


    /*=====================================
      boolean beginsWithVowel(String) -- tells whether a String begins with a vowel
      pre:  w != null and w.length() > 0
      post: beginsWithVowel("apple")  --> true
      beginsWithVowel("strong") --> false
      =====================================*/
    public static boolean beginsWithVowel( String w ){
	return isAVowel(w.substring(0,1));
    }


    /*=====================================
      String engToPig(String) -- converts an English word to Pig Latin
      pre:  w.length() > 0
      post: engToPig("apple")  --> "appleway"
      engToPig("strong") --> "ongstray"
      engToPig("java")   --> "avajay"
      =====================================*/
    public static String engToPig( String w ){
	boolean isFirstCap = isFirstCharCap(w); //stores whether the first character is capitalized
	String retStr = "";
	String punct = "";
	if (hasA(PUNCTUATION,w.substring(w.length()-1))) { //removes end punctuation and stores the removed pucntuation
		punct = w.substring(w.length()-1);
		w=w.substring(0,w.length()-1);
	}
	if (isFirstCap) { //removes uppercase
		w=w.toLowerCase();
	}
	if (beginsWithVowel(w)){
	    retStr = w+"way";
	}
	if (hasA(w,"y")) {
		retStr = w.substring(1) + "y" + "ay";
	}
	else{
	    int posVowel = w.indexOf(firstVowel(w));
	    retStr = w.substring(posVowel) + w.substring(0,posVowel) + "ay";//slices all letters preceding a vowel and then sticks them onto the end with ay
	}
	if (isFirstCap) { //restores the first charcater being capital
		retStr= retStr.substring(0,1).toUpperCase() + retStr.substring(1);
	}
	if (!(punct.equals(""))) { //restores end punctuation
		retStr = retStr + punct;
	}
		return retStr;
    }

    public static boolean isFirstCharCap(String w){
		String firstLetter = w.substring(0,1);
		return (firstLetter == firstLetter.toUpperCase());
	}

    public static void main( String[] args ) {
	System.out.println(engToPig("Yoda"));
	System.out.println(engToPig("sleep."));
	Scanner sc = new Scanner(System.in);
	while (sc.hasNext()) {
		System.out.println(engToPig(sc.next()));
			}
		}//end main()
    }//end class



