//Team Name 479: Jonathan Quang and Allan Wang
//APCS1 pd5
//HW23 -- Karmacomma
//2016--10--26

public class Commafier {
    
	//This is the recursive helper function for commafyR. 
	//It assumes a nonegative integer input and 0 for the counter
    public static String commafyRHelp(int theInt, int counter) {
		String retString = "";
		if (theInt == 0) { //If the integer has been reduced to 0, it returns the string it has built up
			return retString;
		}
		if (counter == 3) {//if the counter is 3, set it back to 0 and add a ',' to the start of the return string
			counter = 0;
			retString = "," + retString;
		}
		return retString = commafyRHelp(theInt/10, counter += 1) + theInt % 10 + retString;
		//the above line sets the return string to add commfyR(with the last digit shaved off and the
		//counter incremented up by 1), then adds the last digit to the start of the return string.
    }

	//commafyR is a wrapper for commafyRHelp. It expects a nonegative integer input and returns a string.
	//it returns 0 as a special case if it receives 0, otherwise it calls upon the helper function
    public static String commafyR(int theInt){
		if (theInt==0){
			return "0";
		}
		return commafyRHelp(theInt, 0);
    }
	
	//commfyF adds commas every three numbers using iteration. 
	//It expects a non-negative integer input and returns a string
	public static String commafyF(int theInt) {
		String retString = "";
		int counter = 0;
		if (theInt == 0) { //this is the special case for if 0 is the given integer
			return "0";
		}
		for (int x=theInt; theInt!=0; theInt=theInt/10) { //a for loop where x becomes the given integer, and its divided by 10 until it becomes 0
			if (counter == 3) {//if this is the third cycle of the loop, add a comma to the start of the return string
				counter = 0;
				retString = "," + retString;
			}
			retString = theInt%10 + retString; //add the last digit of theInt to the beginning of the return string
			counter += 1; //increment the counter up by 1 to keep track of when to put a comma.
		}
		return retString;
	}

    public static void main(String[] args) {
		//System.out.println(commafyR(1)) // 1
		//System.out.println(commafyR(10)) // 10
		//System.out.println(commafyR(101)) // 101
		//System.out.println(commafyR(1000)) // 1,000
		//System.out.println(commafyR(12345)) // 12,345
		//System.out.println(commafyF(1)) // 1
		//System.out.println(commafyF(10)) // 10
		//System.out.println(commafyF(101)) // 101
		//System.out.println(commafyF(1000)) // 1,000
		//System.out.println(commafyF(12345)) // 12,345
		for (String s:args) {
			System.out.println("commafyR:" + commafyR(Integer.parseInt(s)));
			System.out.println("commafyF:" + commafyF(Integer.parseInt(s)));
		}
	}



}
