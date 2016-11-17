// Ryan Siu, Mark Shafran, Jonathan Quang, James Smith -- Team 2Slow4Boot
// APCS1 pd5
// HW25 -- ? ? ?
// 2016-10-31

import java.util.Scanner;

public class Pig 
{

    private static final String VOWELS = "aeiou";
    private static final String LETTERS = "abcdefghijklmnopqrstuvwxyz";
    

    /*=====================================
      boolean hasA(String,String) -- checks for a letter in a String
      pre:  w != null, letter.length() == 1
      post: hasA("cat", "a") --> true  
      hasA("cat", "p") --> false
      =====================================*/
    public static boolean hasA( String w, String letter ) 
    {
	// account for case differences
	w = w.toLowerCase();
	letter = letter.toLowerCase();

        return (w.indexOf(letter) != -1);
    }


    /*====================================
      boolean isAVowel(String) -- tells whether a letter is a vowel
      precondition: letter.length() == 1
      =====================================*/
    public static boolean isAVowel( String letter ) 
    {
        return hasA(VOWELS, letter);
    }


    /*=====================================
      int countVowels(String) -- counts vowels in a String
      pre:  w != null
      post: countVowels("meatball") --> 3
      =====================================*/
    public static int countVowels( String w ) 
    {
	return allVowels(w).length();
    }


    /*=====================================
      boolean hasAVowel(String) -- tells whether a String has a vowel
      pre:  w != null
      post: hasAVowel("cat") --> true
      hasAVowel("zzz") --> false
      =====================================*/
    public static boolean hasAVowel( String w ) 
    {
        return (countVowels(w) > 0);
    }


    /*=====================================
      String allVowels(String) -- returns vowels in a String
      pre:  w != null
      post: allVowels("meatball") --> "eaa"
      =====================================*/
    public static String allVowels( String w ) 
    {
	// loops through w, appends each vowel to retStr
	String retStr = "";
	for (int i = 0; i < w.length(); i += 1) {
	    String chr = w.substring(i,i+1);
	    if (isAVowel(chr)) {
		retStr += chr;
	    }
	}
	return retStr;
    }


    /*=====================================
      String firstVowel(String) -- returns first vowel in a String
      pre:  w != null
      post: firstVowel("") --> ""
      firstVowel("zzz") --> ""
      firstVowel("meatball") --> "e"
      =====================================*/
    public static String firstVowel( String w ) 
    {
	// returns the first letter of all the vowels in w, "" if no vowels
        String v =  allVowels(w);
	if (!v.equals("")) {
	    return v.substring(0,1);
	}
	return "";
    }


    /*=====================================
      boolean beginsWithVowel(String) -- tells whether a String begins with a vowel
      pre:  w != null and w.length() > 0
      post: beginsWithVowel("apple")  --> true
      beginsWithVowel("strong") --> false
      =====================================*/
    public static boolean beginsWithVowel( String w ) 
    {
	if (!w.equals("")) {
	    return isAVowel(w.substring(0,1));
	}
	return false;
    }


    /*=====================================
      String engToPig(String) -- converts an English word to Pig Latin
      pre:  w.length() > 0
      post: engToPig("apple")  --> "appleway"
      engToPig("strong") --> "ongstray"
      engToPig("java")   --> "avajay"
      =====================================*/
    public static String engToPig( String w ) 
    {
	String retStr = "";

	// handles numbers and isolated punctuation
	if (hasNoLetters(w)) {
	    return w;
	}
	
	// capitalization case
	String firstChar = w.substring(0,1);
	boolean caps = firstChar.equals(firstChar.toUpperCase());
	w = w.toLowerCase();

	// punctuation case
	String endPunc = w.substring(w.length()-1,w.length());
	String beginPunc = w.substring(0,1);
	if (LETTERS.indexOf(endPunc) == -1) {
	    w = w.substring(0,w.length()-1);
	} else {
	    endPunc = "";
	}
	if (LETTERS.indexOf(beginPunc) == -1) {
	    w = w.substring(1);
	} else {
	    beginPunc = "";
	}
	
	// case 1: begins with vowel
        if (beginsWithVowel(w)) {
	    retStr = w + "way";
	}
	
	// case 2: begins with consanant
	else {
	    int posVowel = w.indexOf(firstVowel(w)); // pos of first vowel
	    int posY = w.indexOf("y"); // pos of first y

	    /* True if there is a y in w, y is not the first letter, and the
	    // first y comes before the first vowel.
	    // If true, treats y as a vowel.
	    // If false, treats y (if it exists) as a consonant. 
	    */
	    if ((posY != -1 && posY != 0 && posY < posVowel) || !hasAVowel(w)) {
		retStr = w.substring(posY) + w.substring(0,posY) + "ay";
	    } else {
		retStr = w.substring(posVowel) + w.substring(0,posVowel) + "ay";
	    }
	}

	// handles caps
	if (caps) {
	    retStr = capitalize(retStr.toLowerCase());
	}

	// handles punctuation
	retStr += endPunc;
	retStr = beginPunc + retStr;

	return retStr;
    }

    
    /*=====================================
      String capitalize(String) -- changes the first letter of a word to uppercase
      pre:  w != null
      post: capitalize("hello") --> "Hello"
      =====================================*/
    public static String capitalize( String w ) {
	return w.substring(0,1).toUpperCase() + w.substring(1);
    }

    /*=====================================
      String hasNoLetters(String) -- returns true if there are no letters in the string
      pre:  w != null
      post: hasNoLetters("88") --> false
      =====================================*/
    public static boolean  hasNoLetters( String w ) {
        for (int i = 0; i < w.length(); i += 1){
	    if (LETTERS.indexOf(w.substring(i,i+1)) != -1) {
		return false;
	    }
	}
	return true;
    }
	

	

    
    public static void main( String[] args ) {

	Scanner sc = new Scanner(System.in);
	
	while( sc.hasNext() ) {
	    System.out.print( engToPig(sc.next()) + " " );
	}
	
	/*
	System.out.println( engToPig("apple") ); // "appleway"
	System.out.println( engToPig("strong") ); // "ongstray"
	System.out.println( engToPig("java") ); // "avajay"
	System.out.println( engToPig("yellow") ); // "ellowyay"
	System.out.println( engToPig("style") ); // "ylestay"
	*/
	
    }//end main()

}//end class Pig


