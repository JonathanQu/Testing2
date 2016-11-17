//Jonathan Quang
//APCS1 pd5
//HW21 -- For the Love of Strings
//2016--10--24


public class Foresrever {

	//fenceF assumes nonnegative integers
	//It will return a string comprised of n "|" with "--" between each "|"
    public static String fenceF(int posts) {
	String retStr="|";
	
	for (int x = 0; x < posts-1; x+=1) {
	    retStr += "--|";
	}
	if (posts==0) {
	    return "";
	}
	return retStr;
    }

	//reverseF takes a string and outputs its characters backwards using a for loop
    public static String reverseF(String s) {
	String retStr="";
	//says to continue looping until the length of the string is 0. Each step
	//adds the last character of the s to return string, then takes the last character off f
	for (int x= 0; x !=s.length(); s=s.substring(0,s.length()-1)) { 
	    retStr+=s.substring(s.length()-1);
	}
	return retStr;
    }
	//reverseR takes a string and does the same as F, just with recursion.
	public static String reverseR(String s) {
	String retStr="";
		if (s.length()==0) { //the base case is if the length of s is 0, in which case it ends the recursion by outputting an empty string 
			return "";
			}
		//the recursion process below makes the return string equal to the last character + reverseR(s without the last letter)
		return retStr = s.substring(s.length()-1) + reverseR(s.substring(0,s.length()-1));
	}

    public static void main(String[] args) {
	System.out.println(fenceF(0));
	System.out.println(fenceF(1));
	System.out.println(fenceF(2));
	System.out.println(fenceF(3));
	System.out.println(reverseF("stressed"));
	System.out.println(reverseF(""));//testing if an empty string works
	System.out.println(reverseR("stressed"));
	System.out.println(reverseR(""));//testing if an empty string works
    }








}
